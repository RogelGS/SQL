
CREATE TABLE APIGENERO(
    ID NUMBER PRIMARY KEY,
    NOMBRE NVARCHAR2(100),
    ESTATUS NUMBER
);

CREATE TABLE APICLASIFICACION(
    ID NUMBER PRIMARY KEY,
    NOMBRE NVARCHAR2(100),
    EDAD_MIN NUMBER,
    EDAD_MAX NUMBER
);

CREATE TABLE APIPELICULA(
    ID NUMBER PRIMARY KEY,
    NOMBRE NVARCHAR2(100),
    ID_GENERO NUMBER,
    ID_CLASIFICACION NUMBER,
    PRECIO NUMBER,
    FECHA_ESTRENO DATE,
    DURACION NVARCHAR2(100),
    IDIOMA NUMBER,
    FOREIGN KEY (ID_GENERO) REFERENCES APIGENERO(ID),
    FOREIGN KEY (ID_CLASIFICACION) REFERENCES APICLASIFICACION(ID)
);

INSERT INTO APICLASIFICACION VALUES(1, 'A', 5, 50);
INSERT INTO APICLASIFICACION VALUES(2, 'B', 12, 60);
INSERT INTO APICLASIFICACION VALUES(3, 'C', 15, 60);

SELECT * FROM APICLASIFICACION;

INSERT INTO APIGENERO VALUES(1, 'ROMANTICA', 1);
INSERT INTO APIGENERO VALUES(2, 'DRAMA', 1);
INSERT INTO APIGENERO VALUES(3, 'CIENCIA FICCI?N', 1);

SELECT * FROM APIGENERO;

INSERT INTO APIPELICULA VALUES(1, 'VENGADORES', 1, 1, 130, '01-01-2010', 200, 1 );
INSERT INTO APIPELICULA VALUES(2, 'Diario de una pasi?n', 2, 3, 160, '01-01-2000', 60, 2 );
INSERT INTO APIPELICULA VALUES(3, 'Anaconda', 3, 3, 100, '01-01-1990', 70, 3 );

UPDATE APIPELICULA SET IDIOMA = 2 WHERE ID = 2;

SELECT *FROM APIPELICULA;

COMMIT;