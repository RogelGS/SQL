CREATE TABLE PRODUCTO15(
    ID NUMBER PRIMARY KEY,
    NOMBRE NVARCHAR2(100),
    PRECIO NUMBER,
    MARCA NVARCHAR2(100)
);


DROP TABLE BIT_PRODUCTO15;
CREATE TABLE BIT_PRODUCTO15(
    ID NUMBER PRIMARY KEY,
    ID_PRODUCTO NUMBER,
    NOMBRE NVARCHAR2(100),
    PRECIO NUMBER,
    MARCA NVARCHAR2(100),
    ACCION NVARCHAR2(100),
    USUARIO NVARCHAR2(100),
    FECHA_REG DATE
);

CREATE OR REPLACE TRIGGER INSERT_PRODUCTO15
AFTER INSERT ON PRODUCTO15
FOR EACH ROW

--DECLARA VARIABLES
DECLARE
ID_B INT;
FECHA_R DATE;
USUARIO VARCHAR(50);

BEGIN
--ACCION

    SELECT MAX(ID+1) INTO ID_B FROM BIT_PRODUCTO15;
    SELECT SYSDATE INTO FECHA_R FROM DUAL;
    SELECT USER INTO USUARIO FROM DUAL;

    IF(ID_B IS NULL) THEN
    ID_B := 1;
    END IF;

    INSERT INTO BIT_PRODUCTO15 VALUES(ID_B, :NEW.ID, :NEW.NOMBRE, :NEW.PRECIO, :NEW.MARCA, 'INSERT', USUARIO, FECHA_R);

END;

--SELECT USER FROM DUAL;

CREATE OR REPLACE TRIGGER DELETE_PRODUCTO15
AFTER DELETE ON PRODUCTO15
FOR EACH ROW

DECLARE
ID_B INT;
FECHA_R DATE;
USUARIO VARCHAR(50);

BEGIN
    
    SELECT MAX(ID+1) INTO ID_B FROM BIT_PRODUCTO15;
    SELECT SYSDATE INTO FECHA_R FROM DUAL;
    SELECT USER INTO USUARIO FROM DUAL;

    IF(ID_B IS NULL) THEN
    ID_B := 1;
    END IF;
    
    INSERT INTO BIT_PRODUCTO15 VALUES(ID_B, :OLD.ID, :OLD.NOMBRE, :OLD.PRECIO, :OLD.MARCA, 'DELETE', USUARIO, FECHA_R);
END;


--ALTER->AGREGAR CAMPOS
ALTER TABLE BIT_PRODUCTO15 ADD NOMBRE_OLD NVARCHAR2(100);
ALTER TABLE BIT_PRODUCTO15 ADD PRECIO_OLD NUMBER;
ALTER TABLE BIT_PRODUCTO15 ADD MARCA_OLD NVARCHAR2(100);

SELECT * FROM BIT_PRODUCTO15;
SELECT * FROM PRODUCTO15;

ALTER TABLE BIT_PRODUCTO15 DROP COLUMN MARCA_OLD;

CREATE OR REPLACE TRIGGER UPDATE_PRODUCTO15
AFTER UPDATE ON PRODUCTO15
FOR EACH ROW

DECLARE
ID_B INT;
FECHA_R DATE;
USUARIO VARCHAR(50);

BEGIN
    
    SELECT MAX(ID+1) INTO ID_B FROM BIT_PRODUCTO15;
    SELECT SYSDATE INTO FECHA_R FROM DUAL;
    SELECT USER INTO USUARIO FROM DUAL;

    IF(ID_B IS NULL) THEN
    ID_B := 1;
    END IF;
    
    INSERT INTO BIT_PRODUCTO15 VALUES(ID_B, :OLD.ID, :NEW.NOMBRE, :NEW.PRECIO, :NEW.MARCA, 'UPDATE', USUARIO, FECHA_R, :OLD.NOMBRE, :OLD.PRECIO, :OLD.MARCA);
END;