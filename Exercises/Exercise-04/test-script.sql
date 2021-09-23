-- Sample bills testing script
-- Copyright (C) 2016-2021, Bjorn Thor Jonsson

-- ---------------------------------------------------------------------
select '1. View AllAccountRecords' as now_testing;

select 'This should find two accounts, 21 and 85, both of which are OK' as result;

select PID, AID, sum(rAmount), max(aBalance), case sum(rAmount) = max(aBalance) when true then 'OK' else 'Not OK' end
from AllAccountRecords 
where PID = 50
group by PID, AID;

select 'This should find 21 accounts with no records (check on outer join)' as result;

select count(*)
from AllAccountRecords 
where rAmount is null;

-- ---------------------------------------------------------------------
select '2. Trigger on Bills' as now_checking;

begin transaction;

select 'This should give error on date' as result;

insert into Bills ( PID, bDueDate, bAmount, bIsPaid )
values ( 5, CURRENT_DATE, 10000, FALSE );

rollback; 

begin transaction;

select 'This should give error on amount' as result;

insert into Bills ( PID, bDueDate, bAmount, bIsPaid )
values ( 5, CURRENT_DATE + 30, -10000, FALSE );

rollback; 

begin transaction;

select 'This should give error as updates are forbidden' as result;

update Bills
set bAmount = 5000
where BID = 3;

rollback; 

begin transaction;

select 'This should give error as deletes are forbidden' as result;

delete 
from Bills
where BID = 3;

rollback; 

begin transaction;

select 'This insert should work' as result;

insert into Bills ( PID, bDueDate, bAmount, bIsPaid )
values ( 5, CURRENT_DATE + 30, 10000, FALSE );

select 'This should show one account' as result;

select count(*)
from Bills
where PID = 5
and bDueDate > CURRENT_DATE;

rollback;

select 'This should show no account' as result;

select count(*)
from Bills
where PID = 5
and bDueDate > CURRENT_DATE;

-- ---------------------------------------------------------------------
select '3. Trigger on AccountRecords' as now_testing;

select 'Creating a function to find bogus accounts' as message;

CREATE OR REPLACE FUNCTION FindBogusAccounts() 
RETURNS TABLE (AID INTEGER, PID INTEGER, aDate DATE, aBalance INTEGER, aOver INTEGER)
AS 
$$
	SELECT *
	FROM Accounts A
	WHERE (
		A.aBalance <> 0 OR
		EXISTS (
			SELECT * 
			FROM AccountRecords R1 
			WHERE R1.AID = A.AID))
	AND NOT EXISTS(
		SELECT *
		FROM AccountRecords R
		WHERE A.AID = R.AID 
		  AND A.aDate = R.rdate
		  AND A.aBalance = R.rBalance
		  AND R.RID = (
			SELECT MAX(R2.RID)
			FROM AccountRecords R2
			WHERE R2.AID = A.AID)) 
$$ 
LANGUAGE sql;

select 'There should be 0 bogus accounts' as result;

select count(*) as bogus
from FindBogusAccounts()
where AID <> 90;

begin transaction;

select 'This should give error on amount' as result;

insert into AccountRecords ( AID, rType, rAmount )
values ( 5, 'T', -100000 );

rollback; 

select 'There should be 0 bogus accounts' as result;

select count(*) as bogus
from FindBogusAccounts()
where AID <> 90;

begin transaction;

select 'This should give error as updates are forbidden' as result;

update AccountRecords
set rAmount = 5000
where RID = 3;

rollback; 

begin transaction;

select 'This should give error as deletes are forbidden' as result;

delete 
from AccountRecords
where RID = 3;

rollback; 

begin transaction;

select 'This deposit should work fine' as result;

insert into AccountRecords ( AID, rType, rAmount )
values ( 5, 'T', 100000 );

select 'BONUS: This should still return 0' as result;

select count(*) as bogus
from FindBogusAccounts()
where AID <> 90;

select 'Just in case we do not get an empty result, then check it was account 5' as result;

select *
from FindBogusAccounts() A left outer join AccountRecords R on A.AID = R.AID
where A.AID <> 90;

rollback; 

-- ---------------------------------------------------------------------
select '4. Function Transfer' as now_testing;

begin transaction;

select 'Transfer from 8 to 2 should not work (insufficient funds)' as result;

select Transfer ( 2, 8, 1 );

rollback; 

begin transaction;

select 'BONUS: Transfer from 2 to 8 of negative amount should NOT work' as result;

select Transfer ( 2, 8, -1 );

rollback; 

begin transaction;

select 'Transfer from 8 to 2 of 0 amount should work' as result;

select Transfer ( 8, 2, 0 );

select 'These are the most recent entries' as result;

select * 
from AccountRecords
where RID >= -1 + (select max(RID) from AccountRecords);

rollback; 

begin transaction;

select 'Transfer from 2 to 200000 should NOT work' as result;

select Transfer ( 2, 200000, 1 );

rollback; 

-- ---------------------------------------------------------------------
select '5. View DebtorStatus' as now_checking;

select 'Should return 28 debtors' as result;

select count(*)
from DebtorStatus;

select 'Two women owe more than 10K' as result;

select *
from DebtorStatus
where totalbalance < -10000;

-- ---------------------------------------------------------------------
select '6. Trigger on Persons' as now_testing;

begin transaction;

select 'This insert should work' as result;

insert into People (pName, pGender, pHeight)  
values ('Gummi', 'M', 1.74);

select 'This should return Gummi and one account with overdraft of 10000' as result;

select *
from People P
	join Accounts A on A.PID = P.PID 
where A.AID = (select max (A1.AID) from Accounts A1);

select 'This should return 0 account records for the new person' as result;

select count(*) as count
from AccountRecords R
where R.AID = (select max (A1.AID) from Accounts A1);

rollback; 

-- ---------------------------------------------------------------------
select '7. Function InsertPerson' as now_testing;

begin transaction;

select 'This insert should work' as result;

select InsertPerson ('Gummi', 'M', 1.74, 21000);

select 'This should return Gummi and one account with balance of 21000' as result;

select *
from People P
	join Accounts A on A.PID = P.PID 
where A.AID = (select max (A1.AID) from Accounts A1);

select 'This should return 1 account record for Gummi' as result;

select *
from AccountRecords R
where R.AID = (select max (A1.AID) from Accounts A1);

rollback; 

-- ---------------------------------------------------------------------
select '8. Function PayOneBill' as now_testing;

begin transaction;

select 'Payment of bill 12 should work (over = 22000)' as result;

select PayOneBill ( 12 );

select 'Bill 12 should now be paid' as result;

select * 
from Bills
where BID = 12;

select 'Amount of bill 12 was 207, so account ramount should be -207 and balance -3809' as result;

select *
from AccountRecords 
where RID = (select max(RID) from AccountRecords);

rollback; 

begin transaction;

select 'Making a person with two identically valued accounts' as message;

update Accounts
set aOver = 63000
where AID = 5;

select 'Note the lastval' as result;

select lastval();

select 'Payment of bill 29 should work' as result;

select PayOneBill ( 29 );

select 'Compare with the new lastval -- should be one higher' as result;

select lastval();

select 'Check the accounts of PID 10 - one should be 0, the other -8405' as result;

select *
from Accounts
where PID = 10;

rollback; 

begin transaction;

select 'Payment of bill 108 should not work (already paid)' as result;

select PayOneBill (108);

rollback; 

begin transaction;

select 'Payment of bill 20000 should not work (does not exist)' as result;

select PayOneBill (20000);

rollback; 

begin transaction;

select 'Payment of bill 3 should not work (no account)' as result;

select PayOneBill (3);

rollback; 

begin transaction;

select 'Payment of bill 107 should not work (insufficient funds)' as result;

select PayOneBill (107);

rollback; 

-- ---------------------------------------------------------------------
select '9. Function LoanMoney' as now_testing;

begin transaction;

select 'Loaning a negative amount should not work' as result;

select LoanMoney ( 6, -1, CURRENT_DATE );

rollback; 

begin transaction;

select 'Loaning with due date today should not work' as result;

select LoanMoney ( 6, 1, CURRENT_DATE );

rollback; 

begin transaction;

select 'This loan should work' as result;

select LoanMoney ( 6, 10000, CURRENT_DATE+100 );

select 'The account should contain 10000' as result;

select * from Accounts where PID = 100;

select 'The most recent bill should be for 10000 for PID 100' as result;

select * from Bills 
where BID = (select max(BID) from Bills);

rollback; 

-- ---------------------------------------------------------------------
select '10. View FinancialStatus' as now_checking;

select 'This should return 79 people' as result;

select count(*)
from FinancialStatus;

select 'Return person 78 with 18073 as balance, 0 as unpaid' as result;

select *
from FinancialStatus
where PID = 78;

-- ---------------------------------------------------------------------


