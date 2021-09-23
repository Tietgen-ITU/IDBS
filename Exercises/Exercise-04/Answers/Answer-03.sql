/*
Create	a trigger	on	the	AccountRecords table	that	does	the	following	for	
each	insertion: a)	checks whether	the	amount	is	available	(taking	the	
overdraft	into	account)	on	the account	being	withdrawn	from,	b)	updates
the	balance	on	the	account and	c)	installs the	correct	balance	into	the	
AccountRecords	entry.
*/


DROP FUNCTION IF EXISTS CheckRecord();
DROP TRIGGER IF EXISTS CheckRecord ON accountrecords;

CREATE FUNCTION CheckRecord()
RETURNS TRIGGER
AS $$ BEGIN
    
    IF (NEW.ramount < (SELECT (A.abalance + A.aover) as balance  FROM accounts A WHERE A.aid = NEW.aid))  THEN
        RAISE EXCEPTION 'Not a sufficent amount in balance' USING ERRCODE = '45000';
    END IF;

    UPDATE accounts 
    SET abalance = abalance + NEW.ramount, adate = CURRENT_DATE
    WHERE aid = NEW.aid;

    return NEW;
END; $$ LANGUAGE plpgsql;

CREATE TRIGGER CheckRecord
BEFORE INSERT
ON accountrecords
FOR EACH ROW EXECUTE PROCEDURE CheckRecord();