DROP TABLE IF EXISTS Projects;
DROP TABLE IF EXISTS r1;
DROP TABLE IF EXISTS r2;
DROP TABLE IF EXISTS r3;
DROP TABLE IF EXISTS r4;

CREATE TABLE Projects (
    ID INT NOT NULL,
    PID INT NOT NULL,
    SID INT NOT NULL
    PRIMARY KEY (ID, PID, SID)
);

CREATE TABLE r1 (
    ID INT NOT NULL,
    MID INT NOT NULL,
    PRIMARY KEY (ID)
);

CREATE TABLE r2 (
    MID INT NOT NULL,
    MN VARCHAR(50) NOT NULL,
    PRIMARY KEY (MID)
);


CREATE TABLE r3 (
    PID INT NOT NULL,
    PN VARCHAR(50) NOT NULL,
    PRIMARY KEY (PID)
);

CREATE TABLE r4 (
    SID INT NOT NULL,
    SN VARCHAR(50) NOT NULL,
    PRIMARY KEY (SID)
);

-- INSERT r4 DATA
INSERT INTO r4 (SID, SN) 
VALUES (26, 'CDW'),
    (15, 'Micron Technology'),
    (4, 'Activision Blizzard'),
    (18, 'Sanmina'),
    (25, 'Hewlett Packard Enterprise'),
    (1, 'Microsoft');

-- INSERT r3 DATA
INSERT INTO Projects (PID, PN) 
VALUES (431, 'Control arm'),
    (378, 'Brake pump'),
    (429, 'Connecting rod bolt'),
    (407, 'Central-locking'),
    (386, 'Bumper'),
    (131, 'Control arm');

-- INSERT r2 DATA
INSERT INTO Projects (MID, MN) 
VALUES (29, 'Jonina Asta Arnadóttir'),
    (6, 'Anton Elvar Antonsson'),
    (23, 'Robert Mikaelsson'),
    (19, 'Isak Oskarsson'),
    (5, 'Johanna Lara Torvaldsdóttir'),
    (17, 'Solveig Tordardóttir');

-- INSERT r1 DATA
INSERT INTO Projects (ID, MID) 
VALUES (80, 29),
    (87, 6),
    (12, 23),
    (27, 19),
    (79, 5),
    (31, 17);

-- INSERT PROJECT DATA
INSERT INTO Projects (ID, PID, SID) 
VALUES (80, 431, 26),
    (87, 378, 15),
    (12, 429, 4),
    (27, 407, 18),
    (79, 386, 25),
    (31, 131, 1);
