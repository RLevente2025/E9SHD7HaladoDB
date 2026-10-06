DECLARE
    x NUMBER := 25;
BEGIN
    IF x < 10 THEN
        DBMS_OUTPU.PUT_LINE('A szám kisebb mint 10');
    ELSIF x < 20 THEN
        DBMS_OUTPU.PUT_LINE('A szám 10 és 20 között van');
    ELSIF x > 20 THEN  
        DBMS_OUTPU.PUT_LINE('A szám kisebb min 20');
    ELSE 
        DBMS_OUTPU.PUT_LINE('A szám 20 vagy nagyobb');
    END IF;
END;


--3

declare
    beosztas VARCHAR(10) := 'dev';
BEGIN
    CASE
        WHEN beosztas = 'dev' THEN dbms_output.put_line('Fejleszto, tervezo');
        WHEN beosztas = 'root' THEN dbms_output.put_line('Fejleszto, tervezo');
        WHEN beosztas = 'admin' THEN dbms_output.put_line('Fejleszto, tervezo');
        WHEN beosztas = 'dba' THEN dbms_output.put_line('Fejleszto, tervezo');
        WHEN beosztas = 'cooder' THEN dbms_output.put_line('Fejleszto, tervezo');
        WHEN beosztas = 'sec' THEN dbms_output.put_line('Fejleszto, tervezo');
        ELSE dbms_output.put_line('egyedi munkakör);
    END CASE;
END;

--4

DECLARE
    n number := 10;
BEGIN
    FOR i IN 1..10 LOOP
        dbms_output.put_line(TO_CHAR(i));
    END LOOP;
END;

--5
declare
    TYPE tomb IS VARRAY(3) OF NUMBER;
    arak tomb := tomb(1500000, 22000000, 18000000);
BEGIN
    FOR i In 1..arak.count LOOp
        dbms_output.put_line(arak(i));
    END LOOP;
END;