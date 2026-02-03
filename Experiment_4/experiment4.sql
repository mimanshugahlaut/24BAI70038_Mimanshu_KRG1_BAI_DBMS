DECLARE
num NUMBER:=-3;

BEGIN
    IF num>0 THEN
    DBMS_OUTPUT.PUT_LINE('The number is positive');
    ELSE
    DBMS_OUTPUT.PUT_LINE('The number is not positive');
    END IF;
END;

/

DECLARE
marks NUMBER:=78;

BEGIN
    IF marks>=90 THEN
    DBMS_OUTPUT.PUT_LINE('Grade: A');
    ELSIF marks>=75 THEN
    DBMS_OUTPUT.PUT_LINE('Grade: B');
    ELSIF marks>=60 THEN
    DBMS_OUTPUT.PUT_LINE('Grade: C');
    ELSE
    DBMS_OUTPUT.PUT_LINE('Grade: D');
    END IF;
END;

/

DECLARE
marks NUMBER:=85;

BEGIN
    IF marks>=90 THEN
    DBMS_OUTPUT.PUT_LINE('Excellent Performance');
    ELSIF marks>=75 THEN
    DBMS_OUTPUT.PUT_LINE('Very Good Performance');
    ELSIF marks>=60 THEN
    DBMS_OUTPUT.PUT_LINE('Good Performance');
    ELSIF marks>=40 THEN
    DBMS_OUTPUT.PUT_LINE('Average Performance');
    ELSE
    DBMS_OUTPUT.PUT_LINE('Poor Performance');
    END IF;
END;

/

DECLARE
num NUMBER:=3;

BEGIN
    CASE num
    WHEN 1 THEN DBMS_OUTPUT.PUT_LINE('Monday');
    WHEN 2 THEN DBMS_OUTPUT.PUT_LINE('Tuesday');
    WHEN 3 THEN DBMS_OUTPUT.PUT_LINE('Wednesday');
    WHEN 4 THEN DBMS_OUTPUT.PUT_LINE('Thursday');
    WHEN 5 THEN DBMS_OUTPUT.PUT_LINE('Friday');
    WHEN 6 THEN DBMS_OUTPUT.PUT_LINE('Saturday');
    WHEN 7 THEN DBMS_OUTPUT.PUT_LINE('Sunday');
    ELSE
    DBMS_OUTPUT.PUT_LINE('Invalid Day Number');
    END CASE;
END; 
