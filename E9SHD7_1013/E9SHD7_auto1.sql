-- Haladó Adatbázisrendszerek - 5. Practice - 1. Task (Auto1)


CREATE TABLE Auto1 (
    RSZ   CHAR(6) NOT NULL,
    TIPUS CHAR(30),
    SZIN  CHAR(20),
    KOR   NUMBER(3),
    AR    NUMBER(10)
    );

    desc auto1;p

INSERT INTO Auto1 VALUES ('ABC500', 'Opel Corsa', 'piros', 8, 1939639);
INSERT INTO Auto1 VALUES ('MCC325', 'Opel Insignia', 'fekete', 2, 6800000);
INSERT INTO Auto1 VALUES ('BBM104', 'Suzuki Swift', 'piros', 5, s3636824);
INSERT INTO Auto1 VALUES ('CHR411', 'Renault Twingo', 'piros', 12, 1697185);
INSERT INTO Auto1 VALUES ('JRZ932', 'BMW M3', 'fekete', 5, 4500000);
INSERT INTO Auto1 VALUES ('JEG113', 'Opel Corsa', 'piros', 7, 2182094);
INSERT INTO Auto1 VALUES ('DER842', 'Seat Ibiza', 'szürke', 14, 605000);
INSERT INTO Auto1 VALUES ('BAB422', 'Lada 1300S', 'fehér', 28, 220000);
INSERT INTO Auto1 VALUES ('UFF666', 'Audi TT', 'fekete', 4, 7500000);
COMMIT;

SELECT * FROM Auto1;

--c.) A 7 évnél idősebb autók árának csökkentése 10%-kal (KOR > 7)
declare
    x number(2) :=7;
BEGIN
    UPDATE Auto1 SET AR = AR * 0.9 WHERE KOR > x;
END;

SELECT * FROM Auto1;

--d.) Átlagár lekérdezése - oszlopváltozó (%TYPE)
DECLARE
    x Auto1.AR%TYPE;
BEGIN
    SELECT AVG(AR) INTO x FROM Auto1;
END;


--e.) Darabszám lekérdezése
SELECT * FROM Auto1;
DECLARE
    x int;
BEGIN
    SELECT COUNT(*) INTO x FROM Auto1;
    DBMS_OUTPUT.PUT_LINE('Autók száma: ' || x);
END;

--f.) ABC500 rendszámú autó ára - sorváltozó (%ROWTYPE)
DECLARE
    x Auto1%ROWTYPE;
BEGIN
    SELECT * INTO x FROM Auto1 WHERE RSZ = 'ABC500';
    DBMS_OUTPUT.PUT_LINE(x.AR);
END;
SELECT * FROM Auto1;

--g.) Új rekord beszúrása oszlopváltozók használatával
DECLARE
    a  Auto1.RSZ%TYPE   := 'RTF200';
    b  Auto1.TIPUS%TYPE := 'Toyota';
    c  Auto1.SZIN%TYPE  := 'szurke';
    d  Auto1.KOR%TYPE   := 3;
    e  Auto1.AR%TYPE    := 8200000;
BEGIN
    INSERT INTO Auto1 VALUES (a, b, c, d, e);
END;
/

SELECT * FROM Auto1;

--h.) A memóriaváltozóban megadott korú autó törlése
DECLARE
    x Auto1.KOR%TYPE := 3;
BEGIN
    DELETE FROM Auto1 WHERE KOR = x;
END;

SELECT * FROM Auto1;

--i.) Átlagár letárolása a Naplo táblába
CREATE TABLE Naplo (
    Adat   NUMBER(10,2)
    Datum DATE,
    Szemely  VARCHAR2(20),
);

DECLARE
    x auto1.ar%TYPE;
BEGIN
    SELECT AVG(AR) INTO x FROM Auto1;
    INSERT INTO Naplo VALUES ( X, SYSDATE, USER);
END;

--A Naplo tábla ellenőrzése
SELECT * FROM Naplo;