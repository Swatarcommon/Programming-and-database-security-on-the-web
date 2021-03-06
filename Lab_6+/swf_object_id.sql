-- Function definition script SWF_OBJECT_ID for Oracle
-- Generated by (c) Ispirer SQLWays 9.0 Build 6197 64bit Licensed to bgtu - Nikita - Belarus - Ispirer MnMTK 2020 Microsoft SQL Server to Oracle Database Migration Demo License (1 month, 20200629)
-- Timestamp: Fri May 29 12:39:37 2020
SET DEFINE OFF

create or replace function SWF_OBJECT_ID (SWV_full_object_name VARCHAR2, SWV_object_type VARCHAR2)
RETURN NUMBER
IS
 SWV_OBJECT_ID_status number;
 SWV_dot_position number;
 SWV_schema_name VARCHAR2(255);
 SWV_object_name VARCHAR2(255);
BEGIN
 SWV_OBJECT_ID_status := NULL;
 IF SWV_object_type = 'U'
 THEN
 	IF (INSTR(SWV_full_object_name,'.') != 0)
 	THEN
 		SWV_dot_position := INSTR(SWV_full_object_name,'.');
 		SWV_schema_name := SUBSTR(SWV_full_object_name, 1, SWV_dot_position-1);
 		SWV_object_name := SUBSTR(SWV_full_object_name, SWV_dot_position+1);
 		IF UPPER(SWV_schema_name) = 'DBO'
 		THEN
 			SELECT DISTINCT 1 INTO SWV_OBJECT_ID_status FROM all_tables WHERE TABLE_NAME = UPPER(SWV_object_name);
 			RETURN SWV_OBJECT_ID_status;
 		ELSIF UPPER(SWV_schema_name) = 'TEMPDB'
 		THEN
 			IF UPPER(SUBSTR(SWV_full_object_name, 8, 3)) = 'DBO' or SUBSTR(SWV_full_object_name, INSTR(SWV_full_object_name,'.') + 1, INSTR(SWV_full_object_name,'.', 1, 2) - INSTR(SWV_full_object_name,'.') - 1) is null
 			THEN
 				SWV_object_name := CONCAT('tt_',SUBSTR(SWV_full_object_name, INSTR(SWV_full_object_name,'.', -1)+2));
 				SELECT DISTINCT 1 INTO SWV_OBJECT_ID_status FROM all_tables WHERE TABLE_NAME = UPPER(SWV_object_name);
 				RETURN SWV_OBJECT_ID_status;
 			ELSE
 				SWV_schema_name := SUBSTR(SWV_full_object_name, INSTR(SWV_full_object_name,'.') + 1, INSTR(SWV_full_object_name,'.', 1, 2) - INSTR(SWV_full_object_name,'.') - 1);
 				SELECT DISTINCT 1 INTO SWV_OBJECT_ID_status FROM all_tables WHERE TABLE_NAME = UPPER(SWV_object_name) AND OWNER = UPPER(SWV_schema_name);
 				RETURN SWV_OBJECT_ID_status;
 			END IF;
 		ELSE
 			SELECT DISTINCT 1 INTO SWV_OBJECT_ID_status FROM all_tables WHERE TABLE_NAME = UPPER(SWV_object_name) AND OWNER = UPPER(SWV_schema_name);
 			RETURN SWV_OBJECT_ID_status;
 		END IF;
 	ELSE
 		SELECT DISTINCT 1 INTO SWV_OBJECT_ID_status FROM all_tables WHERE TABLE_NAME = UPPER(SWV_full_object_name);
 		RETURN SWV_OBJECT_ID_status;
 	END IF;
 END IF;
 EXCEPTION
 	WHEN NO_DATA_FOUND THEN
 	RETURN NULL;
END;

/

SHOW ERRORS;

EXIT;

