SELECT *
  FROM movies
  WHERE movies.year < 2000;

SELECT *
  FROM category;

SELECT *
  FROM movies
  WHERE movies.id = 4;

SELECT *
  FROM movies
  ORDER BY movies.year ASC; 

SELECT *
  FROM movies
  WHERE movies.id < 6;

SELECT *
  FROM movies
  WHERE movies.id > 6;

SELECT movies.title, category.type FROM movies
  JOIN category
  ON movies.category_id = category.id;
