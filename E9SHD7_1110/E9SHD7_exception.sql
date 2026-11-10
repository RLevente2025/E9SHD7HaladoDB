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

select * from auto2; 

**1,

CREATE OR REPLACE PROCEDURE KurzMintPld (szinbe VARCHAR2) as
pc int;
BEGIN
    UPDATE Auto2 SET AR = AR + 40000 WHERE szin = szinbe;
    if sql&notfound THEN
        DBMS_OUTPUT.PUT_LINE('Nincs '||szinbe||' színű autó!');
    ELSIF sql&found THEN
        pc := sql&rowcount;
        DBMS_OUTPUT.PUT_LINE(pc|| ' db '||szinbe||' autó ára módosítva);
    END IF;
END;

SELECt Rendszam, Szin, Ar FROM Auto2 Where TRIM(Lower(Szin) = 'Piros';

BEGIN
    KurzMintPld('Piros');
END;

CREATE OR REPLACE PROCEDURE KurzMintPld1 (szinbe VARCHAR2) as
    CURSOR cut IS SELECT RENDSZAM, AR FROM Auto2 WHERE szin= szinbe For Update Of Ar;
    cv cur&rowtype;
    pc int;
BEGIN
    OPEN cur;
    LOOP
    FETCH cur INTO cv;
        EXIT WHEN cur&notfound;
        UPDATE Auto2 SET Ar = cv.Ar - 200000 WHERE CURRENT OF cur;
END LOOP;
    pc := cur&rowcount;
    DBMS_OUTPUT.PUT_LINE(pc||' db '||szinbe autó ára módosítva!');
close cur;
end;
BEGIN
KurzMintPldl('piros');
END;

Begin
KurzMintPld2('szürke');
End;


CREATE OR REPLACE PROCEDURE DataOut (tipusbe VARCHAR2) IS
    CURSOR cur IS SELECT RENDSZAM, TIPUS, AR FROM Auto2 WHERE TIPUS LIKE tipusbe||'%';
    c_var cur%ROWTYPE;
    
BEGIN
 OPEN cur;
 loop
 fetch cur from c_var;
 exit when cur&notfound;
 dbms_output.put_line('valamivalaim');
 end loop; 
 CLOSE cur;
END



CREATE OR REPLACE PROCEDURE TipushozRendszám (betip in char) As
    rsz auto2.tipus%type;
BEGIN
    SELECT rENDSZAM INTO rsz FROM Auto2 where tipus= betip;
EXCEPTION
    WHEN NO_DATA_FOUND THEN
        DBMS_OUTPUT.PUT_LINE('Hiba: Hincs ilyen típus!');
    WHEN TOO_MANY_ROWS THEN
        DBMS_OUTPUT.PUT_LINE('Több ilyen típus létezik!');
END;

SELECT * FROm auto2;

BEGIN
Tipusrendszam("Suzuki");
END;
    
    
CREATE OR REPLACE PROCEDURE TorolRendszam (rszbe char) as
    db int;
    rsz_kivetel exeption;
BEGIN
    SELECT count(*) INTO db FROm Auto WHERE rendszam= rszbe;
    if db=0 then raise rsz_kivetel;
    else DELETE FROM Auto2 WHERE rednszam= rszbe;
    end if;
EXEPTION
    when rsz_kivetel then dbms_output.put_line('Hibás rendszám: '||rszbe);
end;
select * from  auto2;

CREATE OR REPLACE PROCEDURE Szamol (a IN INT, b IN INT, muv VARCHAR) IS
    ert float;
    jel char(1);
    hibas_muvelet EXCEPTION;
BEGIN
    CASE muv
        WHEN 'meg' THEN BEGIN ert:= a + b; jel:='+' END;
        WHEN 'bol' THEN BEGIN ert := a - b; jel:='-' END;
        WHEN 'szor' THEN BEGIN ert := a * b; jel:='*' END;
        WHEN 'oszt' THEN BEGIN ert := a / b; jel:='/' END;
        ELSE RAISE hibas_muvelet;
    END CASE;
    DBMS_OUTPUT.PUT_LINE(a||jel||b|| ' = ' || ert);
EXCEPTION
    WHEN hibas_muvelet THEN
        DBMS_OUTPUT.PUT_LINE('Hibás művelet! Lehet: meg, bol, szor, oszt!');
END;

BEGIN
SZAMOL(3,'oszt',5);
END;

BEGIN
SZAMOL(3,'szer',5);
END;

CREATE OR REPLACE PROCEDURE UjAuto (idbe in number, rszbe in char, tipbe in char, szinbe in char, korbe in number, arbe in number, muszbe in char) IS
BEGIN
    INSERT INTO Auto2 VALUE (idbe,rszbe,tipbe,szinbe,korbe,arbe,muszbe);
    COMMIT;
END;

CREATE OR REPLACE PROCEDURE AutoModosit (idbe in number, szinbe in char) IS
BEGIN
    UPDATE Auto2 SET SZIN = szinbe WHERE ID = idbe;
END;

CREATE OR REPLACE PROCEDURE AutoTorol (idbe in number) IS
BEGIN
    DELETE FROM Auto2 where id = idbe;
END ;

CREATE OR REPLACE PACKAGE AutoCsomag IS
    PROCEDURE UjAuto (idbe in number, rszbe in char, tipbe in char, szinbe in char, korbe in number, arbe in number, muszbe in char);
    PROCEDURE AutoModosit (idbe in number, szinbe in char);
    PROCEDURE AutoTorol (idbe in number);
END AutoCsomag;

CREATE OR REPLACE PACKAGE BODY AutoCsomag IS
    PROCEDURE UjAuto (idbe in number, rszbe in char, tipbe in char, szinbe in char, korbe in number, arbe in number, muszbe in char);    
    ) IS
BEGIN
    INSERT INTO Auto2 VALUE (idbe,rszbe,tipbe,szinbe,korbe,arbe,muszbe);
END;
    PROCEDURE AutoModosit (idbe in number, szinbe in char) IS
BEGIN
    UPDATE Auto2 SET SZIN = szinbe WHERE ID = idbe;       
END AutoModosit;
    PROCEDURE AutoTorol (idbe IN NUMBER) IS
BEGIN
    DELETE FROM Auto2 WHERE ID = idbe;
    COMMIT;
END AutoTorol;

SELECT * FROM auto2;

BEGIN
    AutoCsomag.UjAuto(16, 'RLA676', 'BWD', 'Hupikék', 4, 67000000, TO_DATE('03.12.2027', 'DD-MM-YYYY'));
END;
SELECT * FROM auto2;
BEGIN
    AutoCsomag.Automodosit(16,'YOLO');
END;

BEGIN
    AutoCsomag.AutoTorol(16);
END;