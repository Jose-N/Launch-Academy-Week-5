INSERT INTO category (type)
  VALUES (
    'Adventure/Comedy'
  );

INSERT INTO category (type)
  VALUES (
    'Fantasy'
  );

INSERT INTO category (type)
  VALUES (
    'Drama'
  );

INSERT INTO category (type)
  VALUES (
    'Comedy'
  );

INSERT INTO category (type)
  VALUES (
    'Horror'
  );

INSERT INTO category (type)
  VALUES (
    'Sci-Fi'
  );

INSERT INTO movies (title, year, category_id) 
  VALUES (
    'Home Alone', 1990, 1 
  );

INSERT INTO movies (title, year, category_id) 
  VALUES (
    'Dark Tower', 2017, 2
  );

INSERT INTO movies (title, year, category_id) 
  VALUES (
    'Dunkirk', 2017, 3
  );

INSERT INTO movies (title, year, category_id) 
  VALUES (
    'Sharknado', 2013, 5
  );

INSERT INTO movies (title, year, category_id) 
  VALUES (
    'Sharknado 2', 2014, 5
  );

INSERT INTO movies (title, year, category_id) 
  VALUES (
    'Sharknado 3', 2015, 5
  );

INSERT INTO movies (title, year, category_id) 
  VALUES (
    'Sharknado 4', 2016, 5
  );

INSERT INTO movies (title, year, category_id) 
  VALUES (
    'Sharknado 5', 2017, 5
  );

 UPDATE category
  SET type = 'Science Fiction'
  WHERE id = 6;

  DELETE FROM movies
    WHERE movies.id = 3;
