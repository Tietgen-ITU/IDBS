/*
Create	a trigger	on	the	AccountRecords table	that	does	the	following	for	
each	insertion: a)	checks whether	the	amount	is	available	(taking	the	
overdraft	into	account)	on	the account	being	withdrawn	from,	b)	updates
the	balance	on	the	account and	c)	installs the	correct	balance	into	the	
AccountRecords	entry.
*/

CREATE TRIGGER CheckRecord
BEFORE INSERT
ON AccountRecords

