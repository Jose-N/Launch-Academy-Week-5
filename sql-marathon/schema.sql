DROP TABLE movies CASCADE;
DROP TABLE category CASCADE;

CREATE TABLE category (
  id SERIAL PRIMARY KEY,
  type varchar(255)
);

CREATE TABLE movies(
  id SERIAL PRIMARY KEY,
  title varchar(255),
  year integer,
  category_id integer 
);

CREATE UNIQUE INDEX ON category (type);
CREATE UNIQUE INDEX ON movies (title, year);
