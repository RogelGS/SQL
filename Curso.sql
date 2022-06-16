CREATE TABLE PERRO(
    ID NUMBER PRIMARY KEY,
    NOMBRE NVARCHAR2(100),
    RAZA NVARCHAR2(100),
    EDAD NUMBER
);
INSERT INTO PERRO VALUES(1, 'SCOBY DO', 'GRAN DANES', 1);
COMMIT;
SELECT * FROM PERRO ORDER BY ID;

CREATE TABLE PERRO1(
    ID NUMBER,
    NOMBRE NVARCHAR2(100),
    RAZA NVARCHAR2(100),
    EDAD NUMBER
);

--PRIMARY KEY
CREATE TABLE AUTO(
    ID NUMBER PRIMARY KEY,
    MODELO NVARCHAR2(100),
    MARCA NVARCHAR2(100),
    PRECIO DECIMAL
);

CREATE TABLE AUTO2(
    ID NUMBER,
    MODELO NVARCHAR2(100),
    MARCA NVARCHAR2(100),
    PRECIO NUMBER,
    CONSTRAINT PK_AUTO2 PRIMARY KEY(ID)
);

CREATE TABLE AUTO3(
    ID NUMBER,
    MODELO NVARCHAR2(100),
    MARCA NVARCHAR2(100),
    PRECIO DECIMAL,
    PRIMARY KEY(ID)
);

CREATE TABLE CEREAL(
    ID NUMBER PRIMARY KEY,
    NOMBRE VARCHAR2(100),
    PRECIO DECIMAL,
    MARCA NVARCHAR2(100),
    CON_NETO NUMBER,
    CALORIAS NUMBER
);

--INSERT INTO
INSERT INTO CEREAL VALUES(1, 'ZUKARITAS', 85, 'KELLOS', 750, 1000);

--INSERT FORMA 2
INSERT INTO CEREAL(NOMBRE, ID, PRECIO, CON_NETO) VALUES('CHOCOKRISPIS', 2, 88, 800);

--MOSTRAR DATOS
SELECT ID, NOMBRE, PRECIO, MARCA, CON_NETO, CALORIAS FROM CEREAL;
SELECT * FROM CEREAL;

--INSERT
INSERT INTO CEREAL VALUES(3, 'FROOTLOOPS', 70, 'KELLOGS', 600, 1200);
INSERT INTO CEREAL VALUES(4, 'OJUELAS', 80, 'KELLOGS', 600, 1200);
INSERT INTO CEREAL VALUES(5, 'CAPITAN CRUNCH', 70, 'KELLOGS', 600, 1200);

SELECT * FROM CEREAL WHERE ID = 4;
SELECT * FROM CEREAL WHERE ID = 4 OR ID = 2;

SELECT * FROM CEREAL WHERE PRECIO <= 80;

--IN PARA ESTABLECER RANGOS DEFINIDOS
SELECT * FROM CEREAL WHERE ID IN(4, 2, 5);

--BETWEEN PARA ESTABLECER RANGOS
SELECT * FROM CEREAL WHERE PRECIO BETWEEN 50 AND 80;

--BUSCAR QUE EMPIECE CON
SELECT * FROM CEREAL WHERE NOMBRE LIKE 'Z%';

--BUSCAR QUE TERMINE CON
SELECT * FROM CEREAL WHERE NOMBRE LIKE '%S';

--BUSCAR QUE TERMINE CON
SELECT * FROM CEREAL WHERE NOMBRE LIKE '%S' OR NOMBRE LIKE '%s';

--BUSCAR QUE CONTENGA
SELECT * FROM CEREAL WHERE NOMBRE LIKE '%I%' OR NOMBRE LIKE '%i%';

--ORDENAR DESCENTE POR CONTENIDO NETO
SELECT * FROM CEREAL ORDER BY CON_NETO DESC;

--ORDENAR ASCDENTE POR CONTENIDO NETO
SELECT * FROM CEREAL ORDER BY CON_NETO ASC;

--ORDENAR ASCDENTE POR NOMBRE
SELECT * FROM CEREAL ORDER BY NOMBRE;

-- ES NULL
SELECT * FROM CEREAL WHERE CALORIAS IS NULL;

-- NO ES NULL
SELECT * FROM CEREAL WHERE CALORIAS IS NOT NULL;

--AGRUPAR POR MARCA
SELECT MARCA FROM CEREAL GROUP BY MARCA;

CREATE TABLE ESTADOS_REPUBLICA(
    ID NUMBER PRIMARY KEY,
    NOMBRE NVARCHAR2(100),
    CAPITAL NVARCHAR2(100),
    DIMENCION NUMBER
);

INSERT INTO estados_republica VALUES (1, 'PUEBLA', 'PUEBLA', 500);
INSERT INTO estados_republica VALUES (2, 'ESTADO DE MEXICO', 'CD MEX', 800);
INSERT INTO estados_republica VALUES (3, 'GUERRERO', 'CHILPANZINGO', 750);
INSERT INTO estados_republica VALUES (4, 'VERACRUZ', 'XALAPA', 1000);
INSERT INTO estados_republica VALUES (5, 'TLAXCALA', 'TLAXCALA', 750);

SELECT * FROM estados_republica;

--BUSCAR LOS REGISTROS QUE SU DIMENSION SEA 500 O 750
SELECT * FROM estados_republica WHERE DIMENCION BETWEEN 500 AND 750;
--BUSCAR LOS ESTADOS QUE EMPIEZAN CON UNA E O UNA T
SELECT * FROM estados_republica WHERE NOMBRE LIKE 'E%' OR NOMBRE LIKE 'T%';
--ORDENAR LOS ESTADOS EN BASE A SU DIMENCION DEL MAS ALTO AL MAS BAJO
SELECT * FROM estados_republica ORDER BY DIMENCION DESC;
--BUSCAR LOS ESTADOS QUE SU CAPITAL TERMINE CON UNA A
SELECT * FROM estados_republica WHERE NOMBRE LIKE '%A';
SELECT * FROM estados_republica r where r.Nombre LIKE '%A';

--FUNCIONES DE AGREGACION
CREATE TABLE CANCION(
    ID NUMBER PRIMARY KEY,
    NOMBRE NVARCHAR2(100),
    GENERO NVARCHAR2(100),
    DURACION NUMBER,
    COSTO DECIMAL,
    ARTISTA NVARCHAR2(100)
);

INSERT INTO CANCION VALUES(1, 'LUNA', 'BALADA', 3.55, 100, 'ZOE');
INSERT INTO CANCION VALUES(2, 'PROBLEMS', 'TRAP', 4.1, 150, 'LIL PEEP');
INSERT INTO CANCION VALUES(3, 'Eres tu', 'BALADA', 3.25, 99, 'MORAT');
INSERT INTO CANCION VALUES(4, 'MESA DEL RINCON', 'TRAP', 3.1, 70, 'LOS TIGRES DEL NORTE');
INSERT INTO CANCION VALUES(5, 'POR DEBAJO DE LA MESA', 'BALADA', 4.25, 80, 'EL SOL');

SELECT * FROM CANCION;

--CUENTEN CUANTAS CANCIONES TENGO DE GENERO 'BALADA';
SELECT COUNT(ID) CONTADOR FROM CANCION WHERE GENERO = 'BALADA';

--SUMEN EL TIEMPO DE DURACION 
SELECT SUM(DURACION) DURACION FROM CANCION WHERE NOMBRE LIKE 'P%';

--SACAR LA MEDIA DE COSTO DE LAS CANCIONES QUE SON DE GENERO TRAP
SELECT AVG(COSTO) COSTO FROM CANCION WHERE GENERO = 'TRAP';

--MUESTREN LOS NOMBRES TODOS EN MINUSCULA
SELECT LOWER(NOMBRE) MINUSCULAS, ID, DURACION, GENERO, COSTO FROM CANCION;
SELECT UPPER(NOMBRE) MAYUSCULAS, ID, DURACION, GENERO, COSTO FROM CANCION;

--OBTENER EL VALOR MAS ALTO DE LAS CANCIONES
SELECT MAX(COSTO) FROM CANCION;

--OBTENER EL VALOR MAS BAJO DE LAS CANCIONES
SELECT MIN(COSTO) FROM CANCION;

--AL COSTO CONCATENARLE EL SIGNO DE PESOS
SELECT ID, NOMBRE, GENERO, DURACION, CONCAT('$',COSTO), ARTISTA FROM CANCION;

--MOSTRAR LOS GENEROS NO REPETIDOS
SELECT DISTINCT(GENERO) FROM CANCION;

--MOSTRAR CUANTAS CANCIONES TENGO DE CADA GENERO
SELECT COUNT(GENERO) TOTAL, GENERO FROM CANCION GROUP BY GENERO;

--SUBCONSULTAS
--CASE WHERE
--CHECK
--COMO CREAR FK
--INNER JOIN, FULL, LEFT, RIGHT


DROP TABLE CANTANTE;
CREATE TABLE CANTANTE(
    ID NUMBER PRIMARY KEY,
    NOMBRE NVARCHAR2(100) UNIQUE,
    GENERO NVARCHAR2(100),
    EDAD NUMBER,
    PRECIO_BOLETO NUMBER,
    PAIS NVARCHAR2(100)
);

INSERT INTO CANTANTE VALUES(1, 'SHAGGY', 'REGUETON', 50, 120, 'USA');
INSERT INTO CANTANTE VALUES(2, 'MANA', 'ROCK/POP', 55, 180, 'MX');
INSERT INTO CANTANTE VALUES(3, 'CHARLES HANS', 'RAP', 50, 120, 'MX');
INSERT INTO CANTANTE VALUES(4, 'LOS INFIELES DEL PERREO', 'REGUETON', 20, 100, 'MX');
INSERT INTO CANTANTE VALUES(5, 'ADEL', 'POP', 52, 5000, 'USA');
INSERT INTO CANTANTE VALUES(6, 'BEGGES', 'ROCK/POP', 65, 5500, 'USA');
INSERT INTO CANTANTE VALUES(7, 'AVRIL LABIL', 'ROCK', 65, 5500, 'USA');
UPDATE CANTANTE SET EDAD = 38, PRECIO_BOLETO = 3000, PAIS = 'CAN' WHERE ID = 7;
INSERT INTO CANTANTE VALUES(8, 'MALUMA', 'REGUETON', 30, 4000, 'COL');

SELECT * FROM CANTANTE ORDER BY ID;

--CONTAR CUANTOS CANTANTES TENGO DE CADA PAIS
SELECT COUNT(PAIS) TOTAL, PAIS FROM CANTANTE GROUP BY PAIS;
--BUSCAR LOS CANTANTES EMPIECEN CON UNA A
SELECT * FROM CANTANTE WHERE NOMBRE LIKE 'A%';
--3 ORDENAR LOS REGISTROS EN BASE A SU PAIS Y A SU PRECIO Y AL CAMPO PRECIO CONCATENARLE EL SIGNO 4
SELECT ID, NOMBRE, GENERO, EDAD, CONCAT('$',PRECIO_BOLETO) PRECIO, PAIS FROM CANTANTE ORDER BY PAIS, PRECIO_BOLETO;
--4 SACAR EL PROMEDIO DEL COSTO DE BOELTOS DE LOS CANTANTES DE PAIS MX
SELECT AVG(PRECIO_BOLETO) PROMEDIO FROM CANTANTE where pais = 'MX';
--5 MOSTRAR LOS REGISTROS ORDENADOS EN BASE A SU NOMBRE DE A AL Z Y PONERLOS EN MINUSUCLAS
SELECT ID, LOWER(NOMBRE) NOMBRE, LOWER(GENERO) GENERO, EDAD, PRECIO_BOLETO, LOWER(PAIS) PAIS FROM CANTANTE ORDER BY NOMBRE ASC;

--GENERO--> MASCULINO, FEMENINO, INDEFINIDO
--ESTADOCIVIL-->SOLTERO, CASADOS, DIVORCIADO, UNIONLIBRE, VIUDOS

--COLOR 1 ROJA, 2 VERDE, 3 BANDERA, 4 PINTA, 5 BLANCA, 6 OTROS
drop table memelas;
CREATE TABLE MEMELA(
    ID NUMBER PRIMARY KEY,
    NOMBRE NVARCHAR2(100),
    PRECIO NUMBER,
    COLOR NUMBER,
    CONSTRAINT CHECK_COLOR_MEMELA CHECK(COLOR IN (1, 2, 3, 4, 5, 6))
);

INSERT INTO MEMELA VALUES(1, 'SOCABON', 20, 1);
INSERT INTO MEMELA VALUES(2, 'CDMX', 35, 5);
INSERT INTO MEMELA VALUES(3, 'ENUCOM', 15, 3);
INSERT INTO MEMELA VALUES(4, 'NORTE', 50, 2);
INSERT INTO MEMELA VALUES(5, 'SUR', 10, 4);

SELECT * FROM MEMELAS ORDER BY ID;

--10 A 15 BARATA
SELECT ID, NOMBRE, PRECIO, COLOR,
(
    CASE COLOR
    WHEN 1 THEN 'ROJO'
    WHEN 2 THEN 'VERDE'
    WHEN 3 THEN 'BANDERA'
    WHEN 4 THEN 'PINTA'
    WHEN 5 THEN 'BLANCA'
    WHEN 6 THEN 'OTROS'
    ELSE 'SIN COLOR' END
) DETALLE_COLOR,
(
    CASE
    WHEN PRECIO >= 10 AND PRECIO <= 15 THEN 'BARATA'
    WHEN PRECIO BETWEEN 16 AND 25 THEN 'BUEN PRECIO'
    WHEN PRECIO > 26 THEN 'CARA'
    ELSE 'PRECION SIN IDENTIFICAR' END
) DETALLE_PRECIO
FROM MEMELA
ORDER BY ID;

--1 DRAMA 2 CIENCIA Y FICCION 3 SUSPENSO 4 TERROR 5 INFANTILES 6 ROMANCE 7 COMEDIA
DROP TABLE PELICULA;
CREATE TABLE PELICULA(
    ID NUMBER PRIMARY KEY,
    NOMBRE NVARCHAR2(100),
    GENERO NUMBER,
    PRECIO_BOLETO NUMBER,
    DURACION NUMBER,
    PAIS NVARCHAR2(3),
    FECHA_ESTRENO DATE,
    CHECK (PAIS IN('USA', 'MX', 'ESP'))
);

INSERT INTO PELICULA VALUES (1, 'DIARIO DE UNA PASION', 6, 120, 120, 'USA', '01-01-2010');
INSERT INTO PELICULA VALUES (2, 'VOLVER AL FUTURO', 2, 80, 150, 'USA', '01-01-1985');
INSERT INTO PELICULA VALUES (3, 'LAS VENTAJAS DE SER INVISIBLE', 1, 110, 90, 'USA', '01-01-2012');
INSERT INTO PELICULA VALUES (4, 'HARRY POTTER', 2, 800, 180, 'USA', '01-01-2001');
INSERT INTO PELICULA VALUES (5, 'SPIDER MAN', 2, 200, 160, 'USA', '01-01-2021');
INSERT INTO PELICULA VALUES (6, 'LA LEY DE HERODES', 1, 100, 120, 'MX', '01-01-2005');
SELECT * FROM PELICULA ORDER BY ID;

--1 MOSTRAR LOS DATOS ORDENADOS POR SU FECHA DE ESTRENO Y PONER LOS CASE DE GENERO Y PAIS
SELECT ID, NOMBRE, PRECIO_BOLETO, DURACION, FECHA_ESTRENO,
(
    CASE GENERO
    WHEN 1 THEN 'DRAMA'
    WHEN 2 THEN 'CIENCIA FICCI�N'
    WHEN 3 THEN 'SUSPENSO'
    WHEN 4 THEN 'TERROR'
    WHEN 5 THEN 'INFANTILES'
    WHEN 6 THEN 'ROMANCE'
    WHEN 7 THEN 'COMEDIA'
    ELSE 'VALOR INDEFINIDO' END
) GENERO,
(
    CASE
    WHEN PAIS = 'MX' THEN 'MEXICO'
    WHEN PAIS = 'USA' THEN 'ESTADOS UNIDOS'
    WHEN PAIS = 'ESP' THEN 'ESPA�A'
    ELSE 'VALOR INDEFINIDO' END
) PAIS
FROM PELICULA
ORDER BY FECHA_ESTRENO;

--2 CONTAR CUANTAS PELICULAS TENGO DE CADA PAIS
SELECT COUNT(ID) TOTAL, PAIS FROM PELICULA GROUP BY PAIS;

--3 BUSCAR LAS PELICULAS QUE SU PRECIO ESTE ENTRE 100 Y 200 Y CONCATENAR EL SIGNO DE PESOS
SELECT ID, NOMBRE,
(
    CASE GENERO
    WHEN 1 THEN 'DRAMA'
    WHEN 2 THEN 'CIENCIA FICCI�N'
    WHEN 3 THEN 'SUSPENSO'
    WHEN 4 THEN 'TERROR'
    WHEN 5 THEN 'INFANTILES'
    WHEN 6 THEN 'ROMANCE'
    WHEN 7 THEN 'COMEDIA'
    ELSE 'VALOR INDEFINIDO' END
) GENERO
, CONCAT('$',PRECIO_BOLETO) PRECIO_BOLETO, DURACION,
(
    CASE
    WHEN PAIS = 'MX' THEN 'MEXICO'
    WHEN PAIS = 'USA' THEN 'ESTADOS UNIDOS'
    WHEN PAIS = 'ESP' THEN 'ESPA�A'
    ELSE 'VALOR INDEFINIDO' END
) PAIS
, FECHA_ESTRENO FROM PELICULA WHERE PRECIO_BOLETO BETWEEN 100 AND 200;

--4 MOSTRAR LAS PELICULAS SU NOMBRE EN MAYUSCULA Y ORDENARLO ALFABETICAMENTE DE LA A Z
SELECT LOWER(NOMBRE) NOMBRE FROM PELICULA ORDER BY NOMBRE;

--5 OBTENER EL PRECIO MAS CARO DE LA PELICULA
SELECT MAX(PRECIO_BOLETO) MAXIMO FROM PELICULA;

--6 CONTAR CUANTAS PELICULAS TENGO POR GENERO
SELECT COUNT(ID) TOTAL,
(
    CASE GENERO
    WHEN 1 THEN 'DRAMA'
    WHEN 2 THEN 'CIENCIA FICCI�N'
    WHEN 3 THEN 'SUSPENSO'
    WHEN 4 THEN 'TERROR'
    WHEN 5 THEN 'INFANTILES'
    WHEN 6 THEN 'ROMANCE'
    WHEN 7 THEN 'COMEDIA'
    ELSE 'VALOR INDEFINIDO' END
) GENERO
FROM PELICULA
GROUP BY GENERO;

--7 MOSTRAR LAS PELICULAS QUE EN SU NOMBRE TENGA UNA E O UNA P
SELECT ID, NOMBRE, PRECIO_BOLETO, PAIS, DURACION FROM PELICULA WHERE NOMBRE LIKE '%E%' OR NOMBRE LIKE '%P%';

--8 OBTENER EL PROMEDIO DE LAS PELICULAS QUE SEAN DE USA
SELECT AVG(PRECIO_BOLETO) PRECIO FROM PELICULA WHERE PAIS = 'USA';

CREATE TABLE PADRE(
    ID NUMBER PRIMARY KEY,
    NOMBRE NVARCHAR2(100),
    APP NVARCHAR2(100),
    APM NVARCHAR2(100)
);

CREATE TABLE HIJO(
ID NUMBER PRIMARY KEY,
    NOMBRE NVARCHAR2(100),
    APP NVARCHAR2(100),
    APM NVARCHAR2(100),
    IDPADRE NUMBER,
    CONSTRAINT FK_HIJO_PADRE FOREIGN KEY (IDPADRE) REFERENCES PADRE(ID)
);

INSERT INTO PADRE VALUES(1, 'GOKU', 'SON', 'KAKAROTO');
INSERT INTO PADRE VALUES(2, 'HOMERO', 'J.', 'SIMPSON');
UPDATE PADRE SET APP = 'PSIMON', APM = 'MARCH' WHERE ID = 2;
INSERT INTO PADRE VALUES(3, 'NARUTO', 'UZUMAKI', 'DEBERAS');
INSERT INTO PADRE VALUES(4, 'DON', 'RAMON', 'MONCHITO');

SELECT * FROM PADRE ORDER BY ID;

INSERT INTO HIJO VALUES(1, 'GOHAN', 'SON', 'OCCSATAN', 1);
INSERT INTO HIJO VALUES(2, 'GOTEN', 'SON', 'OCCSATAN', 1);
INSERT INTO HIJO VALUES(3, 'BARTOLOMEO', 'PSIMON', 'SPRINFIT', 2);
INSERT INTO HIJO VALUES(4, 'BORUTO', 'UZUMAKI', 'HYUGO', 3);
INSERT INTO HIJO VALUES(5, 'HIMAGUARY', 'UZUMAKI', 'HYUGO', 3);
INSERT INTO HIJO VALUES(6, 'CHAVO', 'DEL', 'OCHO', NULL);
INSERT INTO HIJO VALUES(7, 'LISA', 'PSIMON', 'SPRINFIT', 2);
INSERT INTO HIJO VALUES(8, 'MAGGY', 'PSIMON', 'SPRINFIT', 2);

SELECT * FROM HIJO ORDER BY ID;

SELECT HIJO.ID, HIJO.NOMBRE, PADRE.NOMBRE FROM HIJO INNER JOIN PADRE ON PADRE.ID = HIJO.IDPADRE;

--INNER JOIN
SELECT H.ID, H.NOMBRE, H.APP, H.APM, P.ID, P.NOMBRE, P.APP, P.APM FROM HIJO H INNER JOIN PADRE P ON P.ID = H.IDPADRE;

--LEFT JOIN
SELECT H.ID, H.NOMBRE, H.APP, H.APM, P.ID, P.NOMBRE, P.APP, P.APM FROM HIJO H LEFT JOIN PADRE P ON P.ID = H.IDPADRE;

--RIGHT JOIN
SELECT H.ID, H.NOMBRE, H.APP, H.APM, P.ID, P.NOMBRE, P.APP, P.APM FROM HIJO H RIGHT JOIN PADRE P ON P.ID = H.IDPADRE;

--FULL JOIN
SELECT H.ID, H.NOMBRE, H.APP, H.APM, P.ID, P.NOMBRE, P.APP, P.APM FROM HIJO H FULL JOIN PADRE P ON P.ID = H.IDPADRE;

SELECT * FROM HIJO H FULL JOIN PADRE P ON P.ID = H.IDPADRE WHERE P.ID IS NULL OR H.ID IS NULL;

DROP TABLE PAIS;
CREATE TABLE PAIS(
    ID NUMBER PRIMARY KEY,
    NOMBRE NVARCHAR2(100),
    CONTINENTE NUMBER
);

DROP TABLE MARCA;
CREATE TABLE MARCA(
    ID NUMBER PRIMARY KEY,
    NOMBRE NVARCHAR2(100),
    SLOGAN NVARCHAR2(100),
    IDPAIS NUMBER,
    FOREIGN KEY (IDPAIS) REFERENCES PAIS(ID)
);

DROP TABLE CELULAR;
CREATE TABLE CELULAR(
    ID NUMBER PRIMARY KEY,
    MODELO NVARCHAR2(100),
    RAM NUMBER,
    PRECIO NUMBER,
    SO NUMBER,
    IDMARCA NUMBER,
    CONSTRAINT FK_IDMARCA FOREIGN KEY (IDMARCA) REFERENCES MARCA(ID)
);

--1 AMERICA 2 ASIA 3 EUROPA 4 OCEANIA 5 AFRICA
INSERT INTO PAIS VALUES(1, 'USA', 1);
INSERT INTO PAIS VALUES(2, 'FRANCIA', 3);
INSERT INTO PAIS VALUES(3, 'JAPON', 2);
INSERT INTO PAIS VALUES(4, 'KOREA', 2);
INSERT INTO PAIS VALUES(5, 'CHINA', 2);

SELECT * FROM PAIS ORDER BY ID;

INSERT INTO MARCA VALUES(1, 'MOTOROLA', 'BUENOS Y BARATOS', 1);
INSERT INTO MARCA VALUES(2, 'XIAMI', 'BUENOS Y BARATOS', 5);
INSERT INTO MARCA VALUES(3, 'IPHONE', 'CAROS Y BARATOS', 1);
INSERT INTO MARCA VALUES(4, 'SAMSUNG', 'BONITOS', 4);
INSERT INTO MARCA VALUES(5, 'HUAWEI', 'SIN GOOGLE', 5);

SELECT * FROM MARCA ORDER BY ID;

INSERT INTO CELULAR VALUES(1, 'G50 PLUS', 8, 12000, 1, 1);
INSERT INTO CELULAR VALUES(2, 'A9', 6, 6000, 1, 2);
INSERT INTO CELULAR VALUES(3, '13 PRO MAX', 4, 43000, 2, 3);
INSERT INTO CELULAR VALUES(4, 'S21 PLUS', 8, 25000, 1, 4);
INSERT INTO CELULAR VALUES(5, 'MATE 8', 8, 28000, 1, 5);
INSERT INTO CELULAR VALUES(6, 'P30', 4, 3000, 1, NULL);

SELECT * FROM CELULAR ORDER BY ID;

--1 MOSTRAR LOS CELULARES CON SU MARCA Y SU PAIS
SELECT C.ID, C.MODELO, C.PRECIO, C.RAM, M.NOMBRE MARCA, P.NOMBRE PAIS
FROM CELULAR C
INNER JOIN MARCA M ON M.ID = C.IDMARCA
INNER JOIN PAIS P ON P.ID = M.IDPAIS;

--2 MOSTRAR LOS CELULARES CON SU MARCA Y SU PAIS ASI COMO LOS CASE DE CONTINENTE Y SO
SELECT C.ID, C.MODELO, C.PRECIO, C.RAM, M.NOMBRE MARCA, P.NOMBRE PAIS,
(
    CASE P.CONTINENTE
    WHEN 1 THEN 'AMERICA'
    WHEN 2 THEN 'ASIA'
    WHEN 3 THEN 'EUROPA'
    WHEN 4 THEN 'OCEANIA'
    WHEN 5 THEN 'AFRICA'
    ELSE 'VALOR INDEFINIDO' END
) CONTINENTE,
(
    CASE C.SO
    WHEN 1 THEN 'ANDROID'
    WHEN 2 THEN 'IOS'
    ELSE 'VALOR INDEFINIDO' END
) SO
FROM CELULAR C
INNER JOIN MARCA M ON M.ID = C.IDMARCA
INNER JOIN PAIS P ON P.ID = M.IDPAIS;

--3 CONTAR CUANTOS CELULARES TENGO DE CADA PAIS
SELECT COUNT(C.ID) TOTAL, P.NOMBRE PAIS
FROM CELULAR C
INNER JOIN MARCA M ON M.ID = C.IDMARCA
INNER JOIN PAIS P ON P.ID = M.IDPAIS
GROUP BY P.NOMBRE;

--4 ORDENAR LOS CELULARES EN VASE A SU PAIS Y CONCATENAR EL SIGO DE $ EN EL CAMPO PRECIO
SELECT C.ID, C.MODELO, CONCAT('$', C.PRECIO) PRECIO, C.RAM, M.NOMBRE MARCA, P.NOMBRE PAIS
FROM CELULAR C
INNER JOIN MARCA M ON M.ID = C.IDMARCA
INNER JOIN PAIS P ON P.ID = M.IDPAIS
ORDER BY P.NOMBRE;

--5 MOSTRAR EL TELEFONO M�S CARO
SELECT C.ID, C.MODELO, C.PRECIO, C.RAM, M.NOMBRE FROM CELULAR C INNER JOIN MARCA M ON M.ID = C.IDMARCA WHERE PRECIO = (SELECT MAX(C.PRECIO) MAS_CARO
FROM CELULAR C);

--6 BUSCAR LOS TELEFONOS QUE SU PRECIO ESTE ENTRE 10000 Y 50000 Y ORDENARLOS EN CASE A SU PRECIO
SELECT C.ID, C.MODELO, C.PRECIO, C.RAM, M.NOMBRE MARCA, P.NOMBRE PAIS,
(
    CASE P.CONTINENTE
    WHEN 1 THEN 'AMERICA'
    WHEN 2 THEN 'ASIA'
    WHEN 3 THEN 'EUROPA'
    WHEN 4 THEN 'OCEANIA'
    WHEN 5 THEN 'AFRICA'
    ELSE 'VALOR INDEFINIDO' END
) CONTINENTE,
(
    CASE C.SO
    WHEN 1 THEN 'ANDROID'
    WHEN 2 THEN 'IOS'
    ELSE 'VALOR INDEFINIDO' END
) SO
FROM CELULAR C
INNER JOIN MARCA M ON M.ID = C.IDMARCA
INNER JOIN PAIS P ON P.ID = M.IDPAIS
WHERE C.PRECIO BETWEEN 10000 AND 50000
ORDER BY C.PRECIO;

CREATE TABLE PAIS_C(
    ID NUMBER PRIMARY KEY,
    NOMBRE NVARCHAR2(100),
    CONTINENTE NUMBER
);
CREATE TABLE CLASIFICACION_P(
    ID NUMBER PRIMARY KEY,
	NOMBRE NVARCHAR2(100),
	EDAD_INI NUMBER,
	EDAD_FIN NUMBER,
	ID_PAIS NUMBER,
    FOREIGN KEY(ID_PAIS) REFERENCES PAIS_C(ID)
);
CREATE TABLE GENERO_P(
    ID NUMBER PRIMARY KEY,
	NOMBRE NVARCHAR2(100),
    ESTATUS NUMBER(1)
);
CREATE TABLE PELICULA15(
    ID NUMBER PRIMARY KEY,
	NOMBRE NVARCHAR2(100),
    ID_GENERO NUMBER,
    ID_CLASIFICACION NUMBER,
    PRECIO NUMBER,
    FECHA_EST DATE, 
    DURACION NUMBER,
    IDIOMA NUMBER, /*1 ESPA�OL 2 INGLES 3 JAPONES 4 KOREANO 5 FRANCES*/
    CONSTRAINT FK_PELICULA_GENERO FOREIGN KEY(ID_GENERO) REFERENCES GENERO_P(ID),
    FOREIGN KEY(ID_CLASIFICACION) REFERENCES CLASIFICACION_P(ID)
);


INSERT INTO PAIS_C VALUES(1, 'USA', 1);
INSERT INTO PAIS_C VALUES(2, 'MX', 1);
INSERT INTO PAIS_C VALUES(3, 'ESP', 2);
INSERT INTO PAIS_C VALUES(4, 'KOREA', 3);
INSERT INTO PAIS_C VALUES(5, 'JAPON', 3);
SELECT * FROM PAIS_C ORDER BY ID;
INSERT INTO CLASIFICACION_P VALUES(1, 'A', 5, 50, 1);
INSERT INTO CLASIFICACION_P VALUES(2, 'B', 12, 60, 2);
INSERT INTO CLASIFICACION_P VALUES(3, 'C', 15, 60, 3);
INSERT INTO CLASIFICACION_P VALUES(4, 'D', 18, 60, 4);
INSERT INTO CLASIFICACION_P VALUES(5, 'E', 21, 90, 5);
SELECT * FROM CLASIFICACION_P ORDER BY ID;
INSERT INTO GENERO_P VALUES(1, 'ROMANTICA', 1);
INSERT INTO GENERO_P VALUES(2, 'DRAMA', 1);
INSERT INTO GENERO_P VALUES(3, 'CIENCIA FICCI�N', 1);
INSERT INTO GENERO_P VALUES(4, 'XXX', 0);
INSERT INTO GENERO_P VALUES(5, 'SUPER HEROES', 1);
SELECT * FROM GENERO_P ORDER BY ID;
INSERT INTO PELICULA15 VALUES(1, 'VENGADORES', 1, 1, 130, '01-01-2010', 200, 1 );
INSERT INTO PELICULA15 VALUES(2, 'Diario de una pasi�n', 2, 3, 160, '01-01-2000', 60, 12 );
INSERT INTO PELICULA15 VALUES(3, 'Anaconda', 3, 4, 100, '01-01-1990', 70, 3 );
INSERT INTO PELICULA15 VALUES(4, 'Pinter pan', 5, 5, 150, '01-01-2000', 100, 4 );
INSERT INTO PELICULA15 VALUES(5, 'Spider Man', 3, 2, 200, '01-01-2022', 210, 1 );

--1 MOSTRAR LAS PELICULAS CON SU GENERO, SU CLASIFICACI�N Y SU PAIS ASI COMO UN CASE DE CONTINENTE E IDIOMA
SELECT P.NOMBRE, G.NOMBRE GENERO, C.NOMBRE CLASIFICACION, PS.NOMBRE PAIS,
(
    CASE PS.CONTINENTE
    WHEN 1 THEN 'AMERICA'
    WHEN 2 THEN 'ASIA'
    WHEN 3 THEN 'EUROPA'
    WHEN 4 THEN 'OCEANIA'
    WHEN 5 THEN 'AFRICA'
    ELSE 'VALOR NO DEFINIDO' END
) CONTINENTE,
(
    CASE P.IDIOMA
    WHEN 1 THEN 'ESPA�OL'
    WHEN 2 THEN 'INGLES'
    WHEN 3 THEN 'JAPONES'
    WHEN 4 THEN 'KOREANO'
    WHEN 5 THEN 'FRANCES'
    ELSE 'VALOR NO DEFINIDO' END
) IDIOMA
FROM PELICULA15 P
INNER JOIN GENERO_P G ON G.ID = P.ID_GENERO
INNER JOIN CLASIFICACION_P C ON P.ID_CLASIFICACION = C.ID
INNER JOIN PAIS_C PS ON C.ID_PAIS = PS.ID;

--2 CONTAR LAS PELICULAS QUE SU GENERO Y SU CLASIFICACI�N Y SU PAIS ASI COMO SU CASE DE CONTINENTE E IDIOMA
SELECT COUNT(P.ID) TOTAL, G.NOMBRE GENERO, C.NOMBRE CLASIFICACION, PS.NOMBRE PAIS,
(
    CASE PS.CONTINENTE
    WHEN 1 THEN 'AMERICA'
    WHEN 2 THEN 'ASIA'
    WHEN 3 THEN 'EUROPA'
    WHEN 4 THEN 'OCEANIA'
    WHEN 5 THEN 'AFRICA'
    ELSE 'VALOR NO DEFINIDO' END
) CONTINENTE,
(
    CASE P.IDIOMA
    WHEN 1 THEN 'ESPA�OL'
    WHEN 2 THEN 'INGLES'
    WHEN 3 THEN 'JAPONES'
    WHEN 4 THEN 'KOREANO'
    WHEN 5 THEN 'FRANCES'
    ELSE 'VALOR NO DEFINIDO' END
) IDIOMA
FROM PELICULA15 P
INNER JOIN GENERO_P G ON G.ID = P.ID_GENERO
INNER JOIN CLASIFICACION_P C ON P.ID_CLASIFICACION = C.ID
INNER JOIN PAIS_C PS ON C.ID_PAIS = PS.ID
GROUP BY 
G.NOMBRE
,C.NOMBRE
,PS.NOMBRE
,PS.CONTINENTE
,P.IDIOMA
;

--3 MOSTRAR LAS PELICULAS EN MAYUSCULAS, ORDENARLAS POR SU CLASIFICACI�N DE LA A A LA Z
SELECT UPPER(P.NOMBRE) NOMBRE, G.NOMBRE GENERO, C.NOMBRE CLASIFICACION, PS.NOMBRE PAIS,
(
    CASE PS.CONTINENTE
    WHEN 1 THEN 'AMERICA'
    WHEN 2 THEN 'ASIA'
    WHEN 3 THEN 'EUROPA'
    WHEN 4 THEN 'OCEANIA'
    WHEN 5 THEN 'AFRICA'
    ELSE 'VALOR NO DEFINIDO' END
) CONTINENTE,
(
    CASE P.IDIOMA
    WHEN 1 THEN 'ESPA�OL'
    WHEN 2 THEN 'INGLES'
    WHEN 3 THEN 'JAPONES'
    WHEN 4 THEN 'KOREANO'
    WHEN 5 THEN 'FRANCES'
    ELSE 'VALOR NO DEFINIDO' END
) IDIOMA
FROM PELICULA15 P
INNER JOIN GENERO_P G ON G.ID = P.ID_GENERO
INNER JOIN CLASIFICACION_P C ON P.ID_CLASIFICACION = C.ID
INNER JOIN PAIS_C PS ON C.ID_PAIS = PS.ID
ORDER BY C.NOMBRE;

--4 MOSTRAR LAS PELICULAS CON LA EDAD_FINAL MAS ALTA
SELECT P.NOMBRE, C.EDAD_FIN
FROM PELICULA15 P
INNER JOIN CLASIFICACION_P C ON P.ID_CLASIFICACION = C.ID
WHERE C.EDAD_FIN = (SELECT MAX(C.EDAD_FIN) FROM CLASIFICACION_P C)
;

--4.1 MOSTRAR LAS PELICULAS CON LA EDAD_FINAL MAS ALTA


--5 BUSCAR LAS PELICULAS QUE SU FECHA DE ESTRENO ESTE ENTRE 1900 Y 2010
SELECT P.NOMBRE, P.FECHA_EST
FROM PELICULA15 P
WHERE EXTRACT(YEAR FROM (P.FECHA_EST)) BETWEEN 1900 AND 2010
;

-----------------------ESTATUS-----------------------

CREATE TABLE ESTATUS_R(
    ID NUMBER PRIMARY KEY,
    NOMBRE NVARCHAR2(100)
);

INSERT INTO ESTATUS_R VALUES(1,'ACTIVO');
INSERT INTO ESTATUS_R VALUES(2,'INACTIVO');
INSERT INTO ESTATUS_R VALUES(3,'AUSENTE');
INSERT INTO ESTATUS_R VALUES(4,'EN PROCESO');
INSERT INTO ESTATUS_R VALUES(5,'EN PAUSA');

SELECT * FROM ESTATUS_R;

------------------DEPARTAMENTO------------------

CREATE TABLE DEPARTAMENTO_R(
    ID NUMBER PRIMARY KEY,
    NOMBRE NVARCHAR2(100),
    DESCRIPCION NVARCHAR2(100)
);

INSERT INTO DEPARTAMENTO_R VALUES(1,'FINACIERO', 'financiamiento para las necesidades de la empresa');
INSERT INTO DEPARTAMENTO_R VALUES(2,'RECURSOS HUMANOS', 'reclutamiento, selecci�n, de personal');
INSERT INTO DEPARTAMENTO_R VALUES(3,'CONTROL DE GESTION', 'obtener informacion fiable para la empresa');
INSERT INTO DEPARTAMENTO_R VALUES(4,'DIRECCION GENERAL', ' parte principal de una empresa');
INSERT INTO DEPARTAMENTO_R VALUES(5,'MARKETING', 'conseguir mas ventas y clientes');

SELECT * FROM DEPARTAMENTO_R ORDER BY ID;

---------------------TABULADOR--------------------

create table TABULADOR_R(
    ID NUMBER PRIMARY KEY,
    CLAVE NUMBER,
    PAGO_INI NUMBER,
    PAGO_FIN  NUMBER,
    ID_ESTATUS NUMBER,
    FOREIGN KEY(ID_ESTATUS)  REFERENCES ESTATUS_R(ID)
);

INSERT INTO TABULADOR_R VALUES(1,1,10000,13000,2);
INSERT INTO TABULADOR_R VALUES(2,12,8000,10000,3);
INSERT INTO TABULADOR_R VALUES(3,21,7000,40000,1);
INSERT INTO TABULADOR_R VALUES(4,3,6000,15000,4);
INSERT INTO TABULADOR_R VALUES(5,2,1000,30000,5);

SELECT * FROM TABULADOR_R ORDER BY ID;

----------------------CONTINENTE---------------------

CREATE TABLE CONTINENTE_R(
    ID NUMBER PRIMARY KEY,
    NOMBRE NVARCHAR2(100)
);

INSERT INTO CONTINENTE_R VALUES(1,'AMERICA');
INSERT INTO CONTINENTE_R VALUES(2,'AFRICA');
INSERT INTO CONTINENTE_R VALUES(3,'EUROPA');
INSERT INTO CONTINENTE_R VALUES(4,'OCEANIA');
INSERT INTO CONTINENTE_R VALUES(5,'ASIA');

SELECT * FROM CONTINENTE_R;

----------------SALARIO----------------

CREATE TABLE SALARIO_R(
    ID NUMBER PRIMARY KEY,
    NOMBRE NVARCHAR2(100),
    DESCRIPCION NVARCHAR2(100),
    ID_ESTATUS NUMBER,
    ID_TABULADOR NUMBER,
    CONSTRAINT FK_ESTATUS_TABULADOR FOREIGN KEY(ID_ESTATUS) REFERENCES ESTATUS_R(ID), 
    FOREIGN KEY(ID_TABULADOR) REFERENCES TABULADOR_R(ID)
);

INSERT INTO SALARIO_R VALUES(1, 'A', '15000',1,1 );
INSERT INTO SALARIO_R VALUES(2, 'B', '20000',2,2 );
INSERT INTO SALARIO_R VALUES(3, 'C', '2500', 3,3);
INSERT INTO SALARIO_R VALUES(4, 'D', '30000',4,4 );
INSERT INTO SALARIO_R VALUES(5, 'E', '35000', 5,5);


SELECT * FROM SALARIO_R;

---------------NACIONALIDAD------------------

CREATE TABLE NACIONALIDAD_R(
    ID NUMBER PRIMARY KEY,
	NOMBRE NVARCHAR2(100),
    ID_CONTINENTE NUMBER,
    FOREIGN KEY(ID_CONTINENTE) REFERENCES CONTINENTE_R(ID)
);

INSERT INTO NACIONALIDAD_R VALUES(1,'Argentina',1);
INSERT INTO NACIONALIDAD_R VALUES(2,'Bolivian',2);
INSERT INTO NACIONALIDAD_R VALUES(3,'Brazilian', 3);
INSERT INTO NACIONALIDAD_R VALUES(4,'Canadian', 4);
INSERT INTO NACIONALIDAD_R VALUES(5,'Colombian', 5);

SELECT * FROM NACIONALIDAD_R;

--------------------PERSONA----------------------
CREATE TABLE PERSONA_R(
    ID NUMBER PRIMARY KEY,
    NOMBRE NVARCHAR2(100),
    APP NVARCHAR2(100),
    APM NVARCHAR2(100),
    EDAD NUMBER,
    EMAIL NVARCHAR2(100),
    TELEFONO NVARCHAR2(10),
    ID_NACIONALIDAD NUMBER,
    CONSTRAINT FK_ID_NACIONALIDAD FOREIGN KEY (ID_NACIONALIDAD) REFERENCES NACIONALIDAD_R(ID)
);

INSERT INTO PERSONA_R VALUES(1, 'DIEGO', 'ALFARO', 'RODRIGUEZ', 52, 'diegoalafarorodriguez@gmail.com', 2385471584, 1);
INSERT INTO PERSONA_R VALUES(2, 'SANDRA', 'OLIVARES', 'FLORES', 24, 'sandraolivaresflores@gmail.com', 2385514761, 2);
INSERT INTO PERSONA_R VALUES(3, 'RIGOBERTO', 'SANS', 'MENDEZ', 35, 'rigonertosansmendez@gmail.com', 2221123547, 3);
INSERT INTO PERSONA_R VALUES(4, 'LUIS', 'HERNANDEZ', 'HERNANDEZ', 19, 'luishernandezhernandez@gmail.com', 2384895512, 4);
INSERT INTO PERSONA_R VALUES(5, 'PEDRO', 'SAGRARIO', 'MONTALVO', 44, 'pedrosagrariomontalvo@gmail.com', 2383661132, 5);

SELECT * FROM PERSONA_R;

----------------PUESTO---------------------

CREATE TABLE PUESTO_R(
ID NUMBER PRIMARY KEY,
NOMBRE VARCHAR2(100),
ID_DEPARTAMENTO NUMBER,
ID_ESTATUS NUMBER,
FOREIGN KEY (ID_DEPARTAMENTO) REFERENCES DEPARTAMENTO_R(ID),
FOREIGN KEY (ID_ESTATUS) REFERENCES ESTATUS_R(ID)
);

INSERT INTO PUESTO_R VALUES(1,'DIRECTOR', 1, 2);
INSERT INTO PUESTO_R VALUES(2,'SUB_DIRECTOR', 3, 4);
INSERT INTO PUESTO_R VALUES(3,'JEFE_CARRERA', 5, 1);
INSERT INTO PUESTO_R VALUES(4,'DOCENTE', 4, 4);
INSERT INTO PUESTO_R VALUES(5,'SECRETARIA', 2, 1);

SELECT * FROM PUESTO_R;

------------------------HISTORICO--------------------------------------------

CREATE TABLE HISTORICO_PERSONA(
    ID NUMBER PRIMARY KEY,
    ID_PERSONA NUMBER,
    ID_PUESTO NUMBER,
    ID_SALARIO NUMBER,
    USUARIO NVARCHAR2(100),
    FECHA_ALTA DATE,
    ID_JEFE NUMBER,
    ID_TUTOR NUMBER,
    FOREIGN KEY (ID_PERSONA) REFERENCES PERSONA_R(ID),
    FOREIGN KEY (ID_PUESTO) REFERENCES PUESTO_R(ID),
    CONSTRAINT FK_SALARIO FOREIGN KEY (ID_SALARIO) REFERENCES SALARIO_R(ID),
    CONSTRAINT FK_JEFE FOREIGN KEY (ID_JEFE) REFERENCES HISTORICO_PERSONA(ID),
    CONSTRAINT FK_TUTOR FOREIGN KEY (ID_TUTOR) REFERENCES HISTORICO_PERSONA(ID)
);

INSERT INTO HISTORICO_PERSONA VALUES(1, 1, 1, 1, 'USUARIO1', '01-01-2000', NULL, NULL);
INSERT INTO HISTORICO_PERSONA VALUES(2, 3, 4, 5, 'USUARIO2', '01-01-2010', NULL, NULL);
INSERT INTO HISTORICO_PERSONA VALUES(3, 5, 2, 2, 'USUARIO3', '01-01-2005', NULL, NULL);

INSERT INTO HISTORICO_PERSONA VALUES(4, 2, 4, 4, 'USUARIO4', '01-01-2009', 1, 2);
INSERT INTO HISTORICO_PERSONA VALUES(5, 1, 3, 3, 'USUARIO5', '01-01-2006', 3, 4);
INSERT INTO HISTORICO_PERSONA VALUES(6, 3, 2, 1, 'USUARIO6', '01-01-2000', 3, 2);

INSERT INTO HISTORICO_PERSONA VALUES(7, 5, 2, 1, 'USUARIO7', '01-01-2021', 2, NULL);

SELECT * FROM HISTORICO_PERSONA;

----------------------------------------------------------------------------------------------

--1 MOSTRAR LOS DATOS DEL HISTORICO_PERSONA CON SU PERSONA, NACIONALIDAD, CONTINENTE, PUESTO, DEPARTAMENTO, ESTATUS, SALARIO
SELECT 
HP.ID, P.NOMBRE NOMBRE, P.APP APELLIDO_P, P.APM APELLIDO_M,
N.NOMBRE NACIONALIDAD, C.NOMBRE CONTINENTE, PT.NOMBRE PUESTO,
D.NOMBRE DEPARTAMENTO, E.NOMBRE ESTATUS_PUESTO, S.NOMBRE SALARIO_GRADO, S.DESCRIPCION SALARIO
FROM HISTORICO_PERSONA HP
INNER JOIN PUESTO_R PT ON PT.ID = HP.ID_PUESTO
INNER JOIN SALARIO_R S ON S.ID = HP.ID_SALARIO
INNER JOIN DEPARTAMENTO_R D ON D.ID = HP.ID_PUESTO
INNER JOIN ESTATUS_R E ON E.ID = PT.ID_ESTATUS
INNER JOIN PERSONA_R P ON P.ID = HP.ID_PERSONA
INNER JOIN NACIONALIDAD_R N ON N.ID = P.ID_NACIONALIDAD
INNER JOIN CONTINENTE_R C ON C.ID = N.ID_CONTINENTE
;

--2 MUESTRA EL NOMBRE, APP, APM DE LAS PERSONAS Y SI TIENE JEFE O TUTOR ME MUESTRAN LOS DATOS SI NO TIENE QUE MUESTRE NULL
SELECT
HP.ID, HP.ID_PERSONA, P.NOMBRE, P.APP APELLIDO_P, P.APM APELLIDO_M, HP.ID_JEFE, P_J.NOMBRE JEFE, HP.ID_TUTOR, P_T.NOMBRE TUTOR
FROM HISTORICO_PERSONA HP
INNER JOIN PERSONA_R P ON P.ID = HP.ID_PERSONA
LEFT JOIN HISTORICO_PERSONA J ON J.ID = HP.ID_JEFE
LEFT JOIN PERSONA_R P_J ON P_J.ID = J.ID_PERSONA
LEFT JOIN HISTORICO_PERSONA T ON T.ID = HP.ID_TUTOR
LEFT JOIN PERSONA_R P_T ON P_T.ID = T.ID_PERSONA
ORDER BY HP.ID
;

--3 CONTAR CUANTS EMPLEADOS TENGO DE CADA JEFE, MOSTRAR EL NOMBRE DEL JEFE Y EL NUMERO DE EMPLEADOS QUE TIENE
SELECT 
--*
J_P.NOMBRE
,COUNT(HP.ID) TOTAL
FROM HISTORICO_PERSONA HP
INNER JOIN HISTORICO_PERSONA J ON HP.ID_JEFE = J.ID
INNER JOIN PERSONA_R J_P ON J_P.ID = J.ID_PERSONA
GROUP BY J_P.NOMBRE
;

--4 MOSTRAR LA NACIONALIDAD, ASI COMO EL CONTINENTE DEL JEFE
SELECT
--*
J_P.NOMBRE
, N.NOMBRE NACIONALIDAD
, C.NOMBRE CONTINENTE
FROM HISTORICO_PERSONA HP
INNER JOIN HISTORICO_PERSONA J ON J.ID = HP.ID_JEFE
INNER JOIN PERSONA_R J_P ON J_P.ID = J.ID_PERSONA
INNER JOIN NACIONALIDAD_R N ON J_P.ID_NACIONALIDAD = N.ID
INNER JOIN CONTINENTE_R C ON N.ID_CONTINENTE = C.ID
GROUP BY J_P.NOMBRE, N.NOMBRE, C.NOMBRE
;

--5 SUMAR EL SALARIO INICIAL DE LOS EMPLEADOS QUE TIENEN TUTOR
SELECT
--*
SUM(TB.PAGO_INI) SALARIO_TOTAL
FROM HISTORICO_PERSONA HP
INNER JOIN HISTORICO_PERSONA T ON T.ID = HP.ID_TUTOR
INNER JOIN SALARIO_R S ON S.ID = HP.ID_SALARIO
INNER JOIN TABULADOR_R TB ON TB.ID = S.ID_TABULADOR
;
