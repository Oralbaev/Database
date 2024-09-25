CREATE database lab2;   --task 1

CREATE TABLE countries
(
    country_id SERIAL PRIMARY KEY,
    country_name VARCHAR,               --task 2
    region_id INT,
    population INT
);

INSERT INTO countries(country_name, region_id, population)      --task 3
VALUES
(
    'Switzerland',
    1,
    9000000
);

INSERT INTO countries(country_id,country_name)      --task 4
VALUES
(
    2,
    'Finland'
);

INSERT INTO countries(region_id)        --task 5
VALUES
(
    NULL
);

INSERT INTO countries(country_name, region_id, population)      --task 6
VALUES
    ('Italy', 5, 30000000),
    ('Russia', 3, 10000000),
    ('Spain', 4, 60000000);

ALTER TABLE countries                                           --task 7
    ALTER COLUMN country_name SET DEFAULT 'Kazakhstan';

INSERT INTO countries(country_name, region_id, population)      --task 8
VALUES(default, 54, 30000000);

INSERT INTO countries(country_name, region_id, population)      --task 9
VALUES(default, default, default);

CREATE TABLE countries_new (LIKE countries INCLUDING CONSTRAINTS);  --task 10

SELECT  * from countries;
SELECT  * from countries_new;


INSERT INTO countries_new                                           --task 11
SELECT * FROM countries;

UPDATE countries                                                    --task 12
SET region_id = 1
WHERE region_id IS NULL;

SELECT country_name, population * 1.1 AS "New Population"           --task 13
FROM countries;

DELETE FROM countries                                               --task 14
WHERE population<100000;

DELETE FROM countries_new
WHERE country_id IN (SELECT country_id FROM countries)              --task 15
RETURNING *;

DELETE FROM countries                                               --task 16
RETURNING *;

--SELECT * FROM countries;



