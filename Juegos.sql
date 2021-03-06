CREATE TABLE MARCA_J(
    ID NUMBER PRIMARY KEY,
    NOMBRE NVARCHAR2(100)
);

CREATE TABLE JUEGO_J(
    ID NUMBER PRIMARY KEY,
    NOMBRE NVARCHAR2(100),
    GENERO NVARCHAR2(100),
    ID_MARCA NUMBER,
    PRECIO NUMBER
);

SELECT * FROM MARCA_J;
INSERT INTO MARCA_J(NOMBRE) VALUES('NINTENDO');

SELECT * FROM JUEGO_J;
INSERT INTO JUEGO_J(NOMBRE, GENERO, ID_MARCA, PRECIO) VALUES('MARIO BROS', 'AVENTURA', 1, 200);
COMMIT;

CREATE SEQUENCE INCRE_MARCA;
CREATE SEQUENCE INCRE_JUEGO;

CREATE OR REPLACE TRIGGER AUTO_INCREMENT_MARCA
BEFORE INSERT ON MARCA_J
FOR EACH ROW
BEGIN
    SELECT INCRE_MARCA.NEXTVAL
    INTO :NEW.ID
    FROM DUAL;
END;

CREATE OR REPLACE TRIGGER AUTO_INCREMENT_JUEGO
BEFORE INSERT ON JUEGO_J
FOR EACH ROW
BEGIN
    SELECT INCRE_JUEGO.NEXTVAL
    INTO :NEW.ID
    FROM DUAL;
END;