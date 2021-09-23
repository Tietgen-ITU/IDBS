/*
Create	a	view	AllAccountRecords	that	joins	the	Accounts	and	
AccountRecords	and	shows	one	entry	for	each	record	for	each account.
The	view	should	show	all	columns	from	both	tables,	first	Accounts	and	
then	AccountRecords,	except	the	AccountRecords.AID	column. Accounts	
with	no	entry	in	AccountRecords should	be	shown	with	NULLs	in	the	
columns	for	AccountRecords.
*/

DROP VIEW IF EXISTS AllAccountRecords;

Create VIEW AllAccountRecords AS
SELECT A.*, AR.rid, AR.rdate, AR.rtype, AR.ramount, AR.rbalance
FROM accounts A 
LEFT OUTER JOIN AccountRecords AR ON AR.aid = A.aid