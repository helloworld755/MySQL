-- Task 1

DROP TABLE IF EXISTS logs;
CREATE TABLE logs (
	created_at DATETIME,
	tbl_name VARCHAR(70),
	id BIGINT NOT NULL,
	name VARCHAR(70)
) ENGINE = ARCHIVE;

DROP TRIGGER IF EXISTS users_new;
delimiter //
CREATE TRIGGER users_new
AFTER INSERT ON users
FOR EACH ROW
BEGIN
	INSERT INTO logs (created_at, tbl_name, id, name)
	VALUES (NOW(), 'users', NEW.id, NEW.name);
END //
delimiter ;

DROP TRIGGER IF EXISTS catalogs_new;
delimiter //
CREATE TRIGGER catalogs_new
AFTER INSERT ON catalogs
FOR EACH ROW
BEGIN
	INSERT INTO logs (created_at, tbl_name, id, name)
	VALUES (NOW(), 'catalogs', NEW.id, NEW.name);
END //
delimiter ;

delimiter //
CREATE TRIGGER products_new
AFTER INSERT ON products
FOR EACH ROW
BEGIN
	INSERT INTO logs (created_at, tbl_name, id, name)
	VALUES (NOW(), 'products', NEW.id, NEW.name);
END //
delimiter ;



-- Task 2

DROP PROCEDURE IF EXISTS insert_million;
delimiter //
CREATE PROCEDURE insert_million ()
BEGIN
	declare n int default 1000000;
	declare i int default 1;

	WHILE i <= n DO
		INSERT INTO users(name) VALUES (CONCAT('User #', i));
		SET i = i + 1;
	END WHILE;
END //
delimiter ;

CALL insert_million();



