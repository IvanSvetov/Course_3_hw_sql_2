SELECT * FROM employee;
SELECT * FROM city;


CREATE TABLE city (
    city_id BIGSERIAL NOT NULL PRIMARY KEY,
    city_name VARCHAR(50) NOT NULL
);

ALTER TABLE employee
ADD COLUMN city_id INT;

ALTER TABLE employee
ADD FOREIGN KEY (city_id) REFERENCES city (city_id);

INSERT INTO city (city_id, city_name)
VALUES (1, 'Sydney');
INSERT INTO city (city_id, city_name)
VALUES (2, 'Cape Town');
INSERT INTO city (city_id, city_name)
VALUES (3, 'Moscow');
INSERT INTO city (city_id, city_name)
VALUES (4, 'Tyumen');
INSERT INTO city (city_id, city_name)
VALUES (5, 'Paris');

UPDATE employee
SET city_id = 1
WHERE id = 1;
UPDATE  employee
SET city_id = 2
WHERE id = 2;
UPDATE employee
SET city_id = 3
WHERE id = 3;
UPDATE employee
SET city_id = 3
WHERE id = 4;
UPDATE employee
SET city_id = 4
WHERE id = 5;

SELECT e.first_name ||' '|| e.last_name AS name, c.city_name AS city
FROM employee e
JOIN city c ON e.city_id = c.city_id;

SELECT c.city_name AS city, e.first_name ||' '|| e.last_name AS name
FROM city c
LEFT JOIN employee e on c.city_id = e.city_id;

SELECT e.first_name ||' '|| e.last_name AS name, c.city_name AS city
FROM employee e
FULL JOIN city c on e.city_id = c.city_id;

SELECT e.first_name ||' '|| e.last_name AS name, city_name AS city
FROM employee e
CROSS JOIN city c;

SELECT c.city_name AS city
FROM city c
LEFT JOIN employee e ON c.city_id = e.city_id
WHERE e.first_name IS NULL
AND e.last_name IS NULL;