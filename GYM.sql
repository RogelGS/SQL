CREATE TABLE GYM(
    ID NUMBER PRIMARY KEY,
    NOMBRE NVARCHAR2(100),
    MENSUALIDAD NUMBER,
    INSCRIPCION NUMBER,
    ESTADO NVARCHAR2(100)
);

INSERT INTO GYM VALUES(1, 'BIOS', 450, 100, 'PUEBLA');
COMMIT;