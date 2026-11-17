CREATE TABLE Auto2 (
    ID number(4) PRIMARY KEY,
    Rendszam Varchar2 (6),
    Tipus varchar2 (30),
    Szin varchar2 (20),
    Kor number(3),
    Ar number(10),
    Muszaki_erv date
);

desc auto2;

INSERT INTO Auto2 VALUES (1, 'ABC123', 'Opel Corsa', 'Piros', 6, 3200000, TO_DATE('05.08.2024','DD-MM-YYYY'));
INSERT INTO Auto2 VALUES (2, 'OWJ612', 'Suzuki Alto', 'Kék', 15, 50000, TO_DATE('03.12.2024','DD.MM.YYYY'));
INSERT INTO Auto2 VALUES (3, 'PHD229', 'Skoda Scala', 'Fehér', 1, 680000, TO_DATE('10.06.2025','DD.MM.YYYY'));
INSERT INTO Auto2 VALUES (5, 'RWE611', 'Ford Focus', 'Sárga', 4, 530000, TO_DATE('05.12.2025','DD.MM.YYYY'));
INSERT INTO Auto2 VALUES (6, 'MNS418', 'Skoda Karoq', 'Kék', 2, 700000, TO_DATE('25.11.2025','DD.MM.YYYY'));
INSERT INTO Auto2 VALUES (7, 'MUX312', 'Suzuki Swift', 'Piros', 8, 160000, TO_DATE('05.09.2025','DD.MM.YYYY'));
INSERT INTO Auto2 VALUES (8, 'NCO927', 'Tesla Y', 'Fehér', 3, 2600000, TO_DATE('12.03.2024','DD.MM.YYYY'));

select * from auto2;

SELECT sysdate From dual;

CREATE OR REPLACE PROCEDURE Atlag AS
    b Auto2.Ar%Type;
    
BEGIN
    SELECT AVG(AR) INTO b FROM Auto2;
    DBMS_OUTPUT.PUT_LINE(b);
END Atlag;


BEGIN
    Atlag;
END;

CREATE OR REPLACE PROCEDURE Atlag AS
x Auto2.Ar%TYPE;
    xrl varchar(30);
Begin
    SELECT AVG(Ar) INTO x FROM Auto2;
    xbl:= TO_CHAR(x, '9G999G999G999');
    xbl:= LTRIM(REPLACE(xrl, ',', ' '));
    DBMS_OUTPUT.PUT_LINE('EREDMÉNY: '||xrl||'Huf');
END;

BEGIN
    Atlag;
END;

Create procedure negyzet (a in number; b out number) is
begin
    b :=a*a;
end;

declare
    a int:=10;
    b int ;
begin
    negyzet(a, b);
    DBMS_OUTPUT.PUT_LINE(b);
end;
CREATE OR REPLACE FUNCTION RendszamSzin (rszbe IN CHAR) RETURN CHAR AS
    b Auto2.SZIN%TYPE;
BEGIN
    SELECT SZIN INTO b FROM Auto2 WHERE RENDSZAM = rszbe;
    RETURN b;
END;
SELCET RendszamSzin('ABC123') FRom Dual;
Declare
    b char(40);
begin
    b := RednszamSzin('ABC123');
    DBMS_OUTPUT.PUT_LINE(b);
END;
CREATE OR REPLACE PROCEDURE UjRekord (idbe in number, rszbe in char,
tibe in char, szinbe in char, korbe in number,
arbe in number, muszbe in date) is
begin
insert into Auto2 values (idbe, rszbe, tipbe, szinbe, korbe, arbe, muszbe);
end;

select * from auto2;
Begin
    UjRekord(13, 'RRR555', 'Ford Kuga', 'szürke', 5, 5200000, DATE '2017-06-05');
end;
select * from auto2;

CREATE OR REPLACE PROCEDURE AutoModosit (idbe in number, szinbe in char) is
begin
    UPDATE Auto2 SET Szin = szinbe WHERE ID = idbe;
end;


---triggerek

CREATE TABLE AutoNaplo {
    Datum timestamp,
    Esemeny varchar2(30),
    Adat varchar2
};

describe AutoNaplo;

select * from AutoNaplo;

Delete from AutoNaplo;

Trigger neve; AutoInsert
Create OR REPLACE Trigger TriggerAutoInsert AFTER INSERT ON Auto2 FOR EACH ROW
BEGIN
    Insert Into Trigger AutoNaplo Values(sysdate , 'Beszúrás', :new.ID||'_'
        ||:new.Rendszam||'_':new.Tipus||'_'||new.Szin||'_'||:new.Kor
            ||'_'||:new.Ar||'_'||:new.Muszaki_erv);
end;

CREATE OR REPLACE TRIGGER AutoNaplo
AFTER UPDATE ON Auto2
FOR EACH ROW
BEGIN
    INSERT INTO AutoNaplo VALUES (SYSTIMESTAMP, 'Módosítás', :new.ID||'_'
        ||:new.Rendszam||'_':new.Tipus||'_'||new.Szin||'_'||:new.Kor
            ||'_'||:new.Ar||'_'||:new.Muszaki_erv);
end;

CREATE OR REPLACE TRIGGER AutoDelete
AFTER DELETE ON Auto2
FOR EACH ROW
BEGIN
    INSERT INTO AutoNaplo VALUES (SYSTIMESTAMP, 'Törlés',  :new.ID||'_'
        ||:new.Rendszam||'_':new.Tipus||'_'||new.Szin||'_'||:new.Kor
            ||'_'||:new.Ar||'_'||:new.Muszaki_erv);
end;

BEGIN
    AutoCsomag.UjAuto(16,'SKL226','Mercedes','Piros',',6,7000000, TO_DATE('15-11-2026', 'DD-MM-YYYY'));
    AutoCsomag.AutoModosit(19,'Ezüst');
    AutoCsomag.AutoTorol(19);
End;


CREATE OR REPLACE Trigger AFTER INSERT OR UPDATE OR DELETE ON Auto2 FOR EACH ROW

BEGIN
    IF INSERTING THEN INSERT INTO AutoNaplo Values (sysdate , 'Beszúrás', :new.ID||'_'
        ||:new.Rendszam||'_':new.Tipus||'_'||new.Szin||'_'||:new.Kor
            ||'_'||:new.Ar||'_'||:new.Muszaki_erv);
    ELSIF updating THEN INSERT INTO AutoNaplo VALUES (SYSTIMESTAMP, 'Módosítás', :new.ID||'_'
        ||:new.Rendszam||'_':new.Tipus||'_'||new.Szin||'_'||:new.Kor
            ||'_'||:new.Ar||'_'||:new.Muszaki_erv);
    ELSIF Deleting THEN INSERT INTO AutoNaplo VALUES (SYSTIMESTAMP, 'Törlés',  :new.ID||'_'
        ||:new.Rendszam||'_':new.Tipus||'_'||new.Szin||'_'||:new.Kor
            ||'_'||:new.Ar||'_'||:new.Muszaki_erv);
    END IF;
END;

BEGIN
    AutoCsomag.UjAuto(17,'SLK228','Toyota Pirus','Piros',',29,7000000, TO_DATE('15-11-2013', 'DD-MM-YYYY'));
    AutoCsomag.AutoModosit(29,'Ezüst');
    AutoCsomag.AutoTorol(29);
END;