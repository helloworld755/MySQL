-- Transactions. Task 1

START TRANSACTION; 

REPLACE INTO sample.users
SELECT * FROM shop.users
WHERE shop.users.id = 1;

DELETE FROM shop.users
WHERE shop.users.id = 1;
COMMIT;



-- Transactions. Task 2

CREATE VIEW my_view AS
SELECT p.name AS 'name', c.name AS 'type'
FROM products p
JOIN catalogs c
ON p.catalog_id = c.id
ORDER BY p.id;

SELECT * FROM my_view;



-- Transactions. Task 3

CREATE TABLE dates (created_at date);
INSERT INTO dates (created_at)
VALUES ('2018-08-01'), ('2018-08-04'), ('2018-08-16'), ('2018-08-17');

CREATE VIEW all_dates AS
SELECT * FROM 
(SELECT adddate('1970-01-01',t4*10000 + t3*1000 + t2*100 + t1*10 + t0) selected_date FROM
 (SELECT 0 t0 UNION SELECT 1 UNION SELECT 2 UNION SELECT 3 UNION SELECT 4 UNION SELECT 5 UNION SELECT 6 UNION SELECT 7 UNION SELECT 8 UNION SELECT 9) t0,
 (SELECT 0 t1 UNION SELECT 1 UNION SELECT 2 UNION SELECT 3 UNION SELECT 4 UNION SELECT 5 UNION SELECT 6 UNION SELECT 7 UNION SELECT 8 UNION SELECT 9) t1,
 (SELECT 0 t2 UNION SELECT 1 UNION SELECT 2 UNION SELECT 3 UNION SELECT 4 UNION SELECT 5 UNION SELECT 6 UNION SELECT 7 UNION SELECT 8 UNION SELECT 9) t2,
 (SELECT 0 t3 UNION SELECT 1 UNION SELECT 2 UNION SELECT 3 UNION SELECT 4 UNION SELECT 5 UNION SELECT 6 UNION SELECT 7 UNION SELECT 8 UNION SELECT 9) t3,
 (SELECT 0 t4 UNION SELECT 1 UNION SELECT 2 UNION SELECT 3 UNION SELECT 4 UNION SELECT 5 UNION SELECT 6 UNION SELECT 7 UNION SELECT 8 UNION SELECT 9) t4) v
WHERE selected_date BETWEEN '2018-08-01' AND '2018-08-31'
ORDER BY selected_date asc;

SELECT * FROM all_dates;

SELECT all_dates.selected_date AS `day`,
(SELECT EXISTS(SELECT * FROM dates WHERE created_at = `day`)) AS `quantity`
FROM all_dates;



-- Transactions. Task 4

CREATE TABLE some_dates (created_at date);
INSERT INTO some_dates (created_at)
VALUES ('2018-08-01'),
		('2018-08-04'),
		('2018-08-16'),
		('2018-08-17'),
		('2018-08-03'),
		('2018-08-07'),
		('2018-08-21'),
		('2018-08-24'),
		('2018-08-09'),
		('2018-08-13');

SELECT * FROM some_dates
ORDER BY created_at DESC
LIMIT 5;

DELETE FROM some_dates
WHERE created_at NOT IN
(SELECT * FROM
(SELECT * FROM some_dates
ORDER BY created_at DESC
LIMIT 5) AS newest_ones);
