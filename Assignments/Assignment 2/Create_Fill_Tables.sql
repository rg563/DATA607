DROP TABLE IF EXISTS ratings;
DROP TABLE IF EXISTS movies;
DROP TABLE IF EXISTS person;

CREATE TABLE movies (
	movie_id integer NOT NULL,
    movie_name VARCHAR(255) UNIQUE NOT NULL,
    movie_year integer NOT NULL,
    PRIMARY KEY (movie_id)
);

CREATE TABLE person (
	person_id integer NOT NULL,
    person_name VARCHAR(255) UNIQUE NOT NULL,
    PRIMARY KEY (person_id)
);

CREATE TABLE ratings (
	rating_id integer NOT NULL,
	movie_id integer NOT NULL,
    person_id integer NOT NULL,
    rating integer NOT NULL,
    PRIMARY KEY (rating_id),
    FOREIGN KEY (movie_id) REFERENCES movies (movie_id),
    FOREIGN KEY (person_id) REFERENCES person (person_id)
);

LOAD DATA INFILE '/tmp/movies.csv'
INTO TABLE movies
FIELDS TERMINATED BY ','
ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS;

LOAD DATA INFILE '/tmp/person.csv'
INTO TABLE person
FIELDS TERMINATED BY ','
ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS;

LOAD DATA INFILE '/tmp/ratings.csv'
INTO TABLE ratings
FIELDS TERMINATED BY ','
ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS;