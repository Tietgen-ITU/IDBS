## Question
Consider the SQL script, and the associated description, in Section 2 of Homework 3. In
Homework 3, you normalised the Rentals relation. Now, you are asked to normalise the
Projects relation. For the Projects relation, take the following steps:
- 1. Find all the FDs in the relations, given the constraints and assumptions from Homework 3.
- 2. Decompose the relation until each sub-relation is in BCNF, or in 3NF but not BCNF,
while preserving all non-redundant FDs. Write down the results schema description
in a simple Relation(columns) format.
- 3. Write the detailed SQL commands to create the resulting tables (with primary keys
and foreign keys) and populate them, by extracting the relevant data from the original
relations.
- 4. Select the correct normal form for the decomposed schema.

You have to normalize the following relation

``` sql
CREATE TABLE Projects (
       ID INT NOT NULL,
       PID INT NOT NULL, 
       SID INT NOT NULL, 
       SN VARCHAR(50) NOT NULL, 
       PN VARCHAR(50) NOT NULL, 
       MID INT NOT NULL,
       MN VARCHAR(50) NOT NULL,
       PRIMARY KEY (ID, PID, SID)
);
```

### Detected Functional Dependencies
ID --> MID

~~ID --> MN~~ *(This is not necessary. because of FD:**** ID --> MID --> MN)*

PID --> PN

SID --> SN

SN --> SID

MID --> MN

MN --> MID


## Relation
Projects(ID, PID, SID, SN, PN, MID, MN)

> Answer: 
> 