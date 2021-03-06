DELIMITER $$

CREATE
    /*[DEFINER = { user | CURRENT_USER }]*/
    PROCEDURE `db_postcode`.`BUILDJSON`()
    /*LANGUAGE SQL
    | [NOT] DETERMINISTIC
    | { CONTAINS SQL | NO SQL | READS SQL DATA | MODIFIES SQL DATA }
    | SQL SECURITY { DEFINER | INVOKER }
    | COMMENT 'string'*/
	BEGIN

	DECLARE COUNT INT DEFAULT 0;
	WHILE COUNT < 26 DO
	    SELECT "{" UNION ALL SELECT CONCAT("""",REPLACE(postcode," ",""),""":{""A"":""",AREA,""",""E"":""",effective,"""},") FROM uk WHERE postcode LIKE 'A%' UNION ALL SELECT "}";
	    
	    SET COUNT = COUNT + 1;
	END WHILE;

	END$$

DELIMITER ;