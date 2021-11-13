-- Admin. Task 1

CREATE USER 'user_shop'@'localhost';
GRANT ALL ON shop.* TO 'user_shop'@'localhost';

CREATE USER 'user_shop_read'@'localhost';
GRANT SELECT ON shop.* TO 'user_shop_read'@'localhost';

SELECT * FROM mysql.user;



-- Admin. Task 2

CREATE TABLE accounts (
	id SERIAL PRIMARY KEY,
	name VARCHAR(255),
	`password` VARCHAR(255));

INSERT INTO accounts (name, `password`)
VALUES ('Vasya','123'), ('Petya','234'), ('Seryozha','345');

CREATE VIEW id_and_name AS
SELECT id, name FROM accounts;

SELECT * FROM id_and_name;

CREATE USER 'user_read'@'localhost';
GRANT SELECT ON shop.id_and_name TO 'user_read'@'localhost';
