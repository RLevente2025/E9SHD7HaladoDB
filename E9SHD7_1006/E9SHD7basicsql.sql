--1. Írjon egy olyan PL/SQL programot, ami kiírja a kimenetre, hogy "Vezetéknév Keresztnév"! 

BEGIN
dbms_output.put_line('Répási Levente Ádám')
END;


--2. Írjon egy olyan PL/SQL programot, amely összead két számot és kiírja a DBMS kimenetre! 

DECLARE
    a number;
BEGIN
    a := (10+3)
    dbms_output.put_line(TO_CHAR(a));
END;

--3. Írjon egy olyan PL/SQL programot, amely összeszoroz két számot és kiírja a DBMS kimenetre!

DECLARE
    a number default 10;
    b number default 20;
    s number;
BEGIN
    s:= a*b;
    dbms_output.put_line(TO_CHAR(s));
END;

--4. Írjon egy olyan PL/SQL programot, amely kiírja a "Vezetéknév Keresztnév" szövegetcsupa nagy ill. kis betűkkel a DBMS kimenetére!

declare
    t VARCHAR(20) := 'Répási Levente';
begin
    SELECT UPPER(t) INTO t FROM dual;
    dbms_output.put_line((t));
    
    SELECT LOWER(t) INTO t FROM dual;
    dbms_output.put_line((t));
    
    SELECT INITCAP(t) INTO t FROM dual;
    dbms_output.put_line((t));
end;

--5. Írjon egy olyan PL/SQL programot, amely összefűzve kiírja a kimenetére a "Vezetéknév" és a "Keresztnév" string-eket (nagybetű, kisbetű, nagy kisbetű)!
declare
    t1 VARCHAR(10) := 'Répási';
    t2 VARCHAR(10) := 'Levente';
    t VARCHAR(20) := '';
begin
    SELECT CONCAT(t1,t2) INTO t FROM dual;
    dbms_output.put_line(t);
end;

--6. Írjon egy olyan PL/SQL programot, amely kiírja az aktuális rendszeridőt!

declare 
    d DATE;
begin
    SELCET sysdate INTO d FROM dual;
    dbms_outpu.put_line(d);
end;

--7. Írjon egy olyan PL/SQL programot, amely egy logikai változó értéket kiírja a DBMS kimenetre

declare
    igaz BOOLEAN := TRUE;
BEGIN
    IF igaz THEN
        DBMS_OUTPUT.PU_LINE('IGAZ')
    ELSE
        DBMS_OUTPUT.PU_LINE('HAMIS')
    END IF;
END;
    