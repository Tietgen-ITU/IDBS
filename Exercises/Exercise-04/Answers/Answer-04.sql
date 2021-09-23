/*
Create	a	procedure Transfer,	which	takes	three	parameters,	iToAID,	
iFromAID,	and	iAmount,	and	transfers	the	given	amount	between	the	two	
given	accounts	in	a	single	transaction.	If	the	amount	is	not	available	in	the	
iFromAID account,	then	the	operation	should	be	aborted	(this	should	
happen	via	the	trigger	from	#3). No	return	value.
*/
DROP FUNCTION IF EXISTS Transfer(iToAID IN INTEGER, iFromAID IN INTEGER, iAmount IN INTEGER);

CREATE FUNCTION Transfer(iToAID IN INTEGER, iFromAID IN INTEGER, iAmount IN INTEGER)
RETURNS VOID
AS $$ BEGIN
    IF iAmount < 0 THEN
        RAISE EXCEPTION 'Amount may not be negative' USING ERRCODE = '45000';
    END IF;

    INSERT INTO accountrecords (AID, rAmount, rDate, rType)
    VALUES (iFromAID, -iAmount, CURRENT_DATE, 'T'),             -- Withdraw 
            (iToAID, iAmount, CURRENT_DATE, 'T');               -- Deposit

END; $$ LANGUAGE plpgsql;