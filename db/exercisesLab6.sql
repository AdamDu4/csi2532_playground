/* J'ai roulé toutes les commands dans le schéma avant de faire les requêtes suivants */

/* Exercise 1 */
select name, birthplace
from artists;

/* Exercise 2 */
select title, price
from artworks
where year > 1600;


/* Exercise 3 */
select title, type
from artworks
where year = 2000
or artist_name = 'Picasso';

/* Exercise 4 */
select name, birthplace
from artists
where extract(year from dateofbirth) >= 1880
and extract(year from dateofbirth) <= 1930;

/* Exercise 5 */
select name, country
from artists
where style in ('Modern', 'Baroque', 'Renaissance');

/* Exercise 6 */
select *
from artworks
order by title;

/* Exercise 7 */
select id, name
from customers
where id in (
    select customer_id
    from likeartists
    where artist_name = 'Picasso'
);

/* Exercise 8 */
select name
from customers
where id in (
    select likeartists.customer_id
    from likeartists
    join artists
    on likeartists.artist_name = artists.name
    join artworks
    on likeartists.artist_name = artworks.artist_name
    where artworks.price > 30000
    and artists.style = 'Renaissance'
);
