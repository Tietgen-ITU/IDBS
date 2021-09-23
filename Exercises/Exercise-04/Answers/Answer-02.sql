/*
Create	a trigger	CheckBills	for	insertions	to Bills	that	enforces	a)	the	rule	
that	bills	cannot	have	a	negative	amount,	and	b)	that	the	due	date	must	be	
in	the	future (tomorrow	or	later).
*/
DROP TRIGGER IF EXISTS CheckBills ON bills;
DROP FUNCTION IF EXISTS CheckBills();
CREATE FUNCTION CheckBills()
RETURNS TRIGGER 
AS $$ 
BEGIN
    IF NEW.bamount < 0 OR NEW.bduedate < CURRENT_DATE THEN 
        RAISE EXCEPTION 'amount cannot be negative and due date need to be set in the future'
        USING ERRCODE = '45000';
    ELSE
        RETURN NEW;
    END IF;

END; $$ LANGUAGE plpgsql;

CREATE TRIGGER CheckBills
BEFORE INSERT
ON bills
FOR EACH ROW EXECUTE PROCEDURE CheckBills();

