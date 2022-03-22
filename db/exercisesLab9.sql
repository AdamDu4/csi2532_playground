/* Adam Dufour - 300009016 */

/* Exercise 1 */
create table book (
    bookid integer,
    bookname varchar(20),
    authorid integer,
    amount numeric(7,2),
    rating integer,
    booktype varchar(25),

    primary key (bookid),
    foreign key (authorid) references author(authorid)
    on update cascade on delete cascade,

    check(rating >= 1 and rating <= 10),
    check(amount > 0),
    check(booktype in ('Fiction-adulte', 'Non-fiction-adulte',
        'Fiction-jeunesse', 'Non-fiction-jeunesse'))
);

/* Exercise 2 */
create table author (
    authorid integer,
    authorname varchar(20),

    primary key (authorid)
);

create assertion dbSizeLimit
check(
    (select count(*) from book) +
    (select count(*) from author) <= 10000
);

/* Exercise 3 */
create trigger checkBookOnUpdate
before update on book
for each row
execute procedure check_book_rating();

/* Exercise 4 */
alter table author
add column author_sum_rating integer default 0;

create function updateRatings() /*Function to update rating totals of authors */
returns trigger as
$body$
begin

update author a
set author_sum_rating = n.totalRating
from (
    select authorid, sum(rating) as totalRating
    from new
    group by authorid
    ) n
where a.authorid = n.authorid;

return new;

end
$body$ language plpgsql;

create trigger updateRatingSum
after insert or update of rating on book
for each statement
execute procedure updateRatings();