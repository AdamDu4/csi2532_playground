CREATE TABLE artists (
 name VARCHAR(20),
 birthplace VARCHAR(20),
 style VARCHAR(20),
 dateofbirth DATE,
 PRIMARY KEY (name)
);

CREATE TABLE customers (
 id INTEGER,
 name VARCHAR(20),
 address VARCHAR(20),
 amount numeric(8,2),
 PRIMARY KEY (id)
);

CREATE TABLE artworks (
 title VARCHAR(20),
 year INTEGER,
 type VARCHAR(20),
 price numeric(8,2),
 artist_name VARCHAR(20),
 PRIMARY KEY (title),
 FOREIGN KEY(artist_name) REFERENCES artists(name)
);

CREATE TABLE likeartists (
 customer_id INTEGER,
 artist_name VARCHAR(20),
 PRIMARY KEY(artist_name, customer_id),
 FOREIGN KEY (artist_name) REFERENCES artists(name),
 FOREIGN KEY (customer_id) REFERENCES customers(id)
);
INSERT INTO customers
(id, name, address, amount)
VALUES
(1, 'John', 'Ottawa', 8.5),
(2, 'Amy', 'Orleans', 9.0),
(3, 'Peter', 'Gatineau', 6.3);

INSERT INTO artists
(name, birthplace, style, dateofbirth)
VALUES
('Caravaggio', 'Milan', 'Baroque', '1571-09-28' ),
('Smith', 'Ottawa', 'Modern', '1977-12-12'),
('Picasso', 'Malaga', 'Cubism', '1881-10-25');

INSERT INTO artworks
(title, year, type, price, artist_name)
VALUES
('Blue', 2000, 'Modern', 10000.00, 'Smith'),
('The Cardsharps', 1594, 'Baroque', 40000.00, 'Caravaggio');

UPDATE customers
SET amount = 9.8
WHERE address = 'Gatineau';

DELETE
FROM customers
WHERE name = 'John';

ALTER TABLE artists
ADD COLUMN country varchar(100);

ALTER TABLE customers
ADD COLUMN rating integer CHECK (rating between 1 and 10);

INSERT INTO customers
(id, name, address, amount, rating)
VALUES
(4, 'Emre', 'Preston', 20000.00, 5),
(5, 'Saeid', null, 40000.00, 6);

INSERT INTO artists
(name, birthplace, style, dateofbirth, country)
VALUES
('Leonardo', 'Florence', 'Renaissance', '04-15-1452', 'Italy'),
('Michelangelo', 'Arezzo', 'Renaissance', '03-06-1475',
'Italy'),
('Josefa', 'Seville', 'Baroque', '09-09-1630', 'Spain'),
('Hans Hofmann', 'Weisenburg', 'Modern', '02-17-1966', 'Germany');

DELETE
FROM artworks
WHERE artist_name = 'Smith';

DELETE
FROM artists
WHERE name = 'Smith';

BEGIN;

ALTER TABLE artworks
DROP CONSTRAINT artworks_artist_name_fkey;

ALTER TABLE artworks
ADD CONSTRAINT artworks_artist_name_fkey
FOREIGN KEY (artist_name) REFERENCES artists(name)
ON DELETE CASCADE
ON UPDATE CASCADE;

COMMIT;

DELETE
FROM artists
WHERE name = 'Smith';