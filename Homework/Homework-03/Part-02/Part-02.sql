DROP TABLE IF EXISTS Rentals;
DROP TABLE IF EXISTS Person;
DROP TABLE IF EXISTS Address;
DROP TABLE IF EXISTS City;

CREATE TABLE Person (
    PID INT NOT NULL,
    PN VARCHAR(50) NOT NULL,
    PRIMARY KEY (PID)
);


CREATE TABLE City (
    HZ INT NOT NULL,
    HC VARCHAR(50) NOT NULL,
    PRIMARY KEY (HZ)
);

CREATE TABLE Address (
    HID INT NOT NULL,
    HS VARCHAR(50) NOT NULL,
    HZ INT NOT NULL REFERENCES City(HZ),
    PRIMARY KEY (HID)
);

CREATE TABLE Rentals (
    PID INT NOT NULL REFERENCES Person(PID),
    HID INT NOT NULL REFERENCES Address(HID),
    S INT NOT NULL,
    PRIMARY KEY (PID, HID)
);


-- Populate tables

-- Person

INSERT INTO Person (PID, PN)
VALUES (18521, 'Sigurjon Elvarsson'),
        (4812, 'Agust Dagur Reynisson'),
        (24279, 'Telma Tinna Savarsdóttir'),
        (23482, 'Isak Helgason'),
        (3245, 'Tomas Aron Elvarsson'),
        (27331, 'Asa Vilhjalmsdóttir'),
        (10408, 'Inga Hauksdóttir'),
        (22659, 'Matthias Hjaltason'),
        (15641, 'Gretar Karason'),
        (10478, 'Bryndis Steinarsdóttir'),
        (20515, 'Kristin Ragnarsdóttir'),
        (25542, 'Magnus Snorri Kristofersson'),
        (29020, 'Hildur Bjarnadóttir'),
        (10325, 'Steinar Pall Axelsson'),
        (10456, 'Robert Agustsson');

-- City
INSERT INTO City (HZ, HC) 
VALUES (109, 'Reykjavik (Breidholt)'),
        (465, 'Bildudalur'),
        (720, 'Borgarfjordur eystri'),
        (680, 'Torshofn'),
        (580, 'Siglufjordur'),
        (104, 'Reykjavik (Laugardalur)'),
        (415, 'Bolungarvik'),
        (300, 'Akranes'),
        (545, 'Skagastrond'),
        (675, 'Raufarhofn'),
        (232, 'Reykjanesbar, PO boxes'),
        (871, 'Vik'),
        (600, 'Akureyri'),
        (620, 'Dalvik');

-- Address
INSERT INTO Address (HID, HS, HZ) 
VALUES (21301, 'Galghard Road', 109),
        (21009, 'Abby Park Street', 465),
        (7941, 'Oceana Side-street', 720),
        (8686, 'Prachstreet', 680),
        (15469, 'Overbanken Road', 580),
        (18784, 'Subway Street', 104),
        (14628, 'Abby Park Street', 415),
        (23668, 'Andreas Avenue', 300),
        (3837, 'Mayores Road', 545),
        (17126, 'School Street', 675),
        (10972, 'Innovation Avenue', 232),
        (2331, 'Dock Street', 871),
        (26596, 'Gold Street', 600),
        (22874, 'Law Street', 675),
        (23266, 'Bus Avenue', 620);

-- Rentals
INSERT INTO Rentals (PID, HID, S) 
VALUES (18521, 21301, 1984),
        (4812, 21009, 1979),
        (24279, 7941, 1981),
        (23482, 8686, 1985),
        (3245, 15469, 2003),
        (27331, 18784, 2003),
        (10408, 14628, 2012),
        (22659, 23668, 2004),
        (15641, 3837, 1993),
        (10478, 17126, 1999),
        (20515, 10972, 1992),
        (25542, 2331, 1981),
        (29020, 26596, 2000),
        (10325, 22874, 1990),
        (10456, 23266, 1980);