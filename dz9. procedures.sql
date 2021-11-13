-- Procedures. Task 1

DROP PROCEDURE IF EXISTS hello;
DELIMITER //
CREATE PROCEDURE hello ()
BEGIN
  IF(curtime() BETWEEN '06:00:00' AND '12:00:00') THEN
	SELECT 'Доброе утро!';
  ELSEIF(curtime() BETWEEN '12:00:00' AND '18:00:00') THEN
	SELECT 'Добрый день!';
  ELSEIF(curtime() BETWEEN '18:00:00' AND '00:00:00') THEN
	SELECT 'Добрый вечер!';
  ELSEIF(curtime() BETWEEN '00:00:00' AND '06:00:00') THEN
	SELECT 'Доброй ночи!';
  END IF;
END //
DELIMITER ;

CALL hello();



-- Procedures. Task 2

-- insert null in both columns

drop trigger if exists my_trigger;
delimiter //
CREATE TRIGGER my_trigger
BEFORE INSERT ON products
FOR EACH ROW
BEGIN
	IF(ISNULL(NEW.name) and isnull(new.description)) THEN
		SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Null in both columns is not allowed';
	end if;
END //
delimiter ;

INSERT INTO products (name, description, price, catalog_id)
VALUES (NULL, NULL, 1, 1);

-- insert null when there is already a null in one of the columns

drop trigger if exists my_trigger2;
delimiter //
CREATE TRIGGER my_trigger2
BEFORE UPDATE ON products
FOR EACH ROW
begin
	if((old.name is null and old.description is not null) and new.description is null) then 
		SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Null in both columns is not allowed';
	end if;
	if((old.name is not null and old.description is null) and new.name is null) then 
		SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Null in both columns is not allowed';
	end if;
END //
delimiter ;

UPDATE products
SET name = NULL
WHERE id = 9;

UPDATE products
SET description = NULL
WHERE id = 8;



-- Procedures. Task 3

DROP FUNCTION IF EXISTS FIBONACCI;
DELIMITER //
CREATE FUNCTION FIBONACCI(n INT)
RETURNS INT DETERMINISTIC
BEGIN
  DECLARE a INT DEFAULT 0;
  DECLARE b INT DEFAULT 1;
  DECLARE i INT;
  DECLARE res INT;

  SET a=0;
  SET b=1;
  SET i=1;

  WHILE (i<=n) DO
    SET res = a + b;
    SET a = b;
    SET b = res;
    SET i = i+1;
  END WHILE;
  RETURN a;
 END//
DELIMITER ;

SELECT FIBONACCI(10);
