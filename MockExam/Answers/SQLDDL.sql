DROP TABLE IF EXISTS Manages;
DROP TABLE IF EXISTS Writes;
DROP TABLE IF EXISTS Evaluates;
DROP TABLE IF EXISTS WorksOn;
DROP TABLE IF EXISTS Project;
DROP TABLE IF EXISTS Researcher;
DROP TABLE IF EXISTS Staff;
DROP TABLE IF EXISTS JournalArticle;
DROP TABLE IF EXISTS ConferenceArticle;
DROP TABLE IF EXISTS Article;

CREATE TABLE Project (
    PID SERIAL NOT NULL PRIMARY KEY,
    Name VARCHAR(50) NOT NULL
);

CREATE TABLE Researcher (
    RID SERIAL NOT NULL PRIMARY KEY, 
    Name VARCHAR(100) NOT NULL
);

CREATE TABLE WorksOn (
    PID INT NOT NULL REFERENCES Project(PID),
    RID INT NOT NULL REFERENCES Researcher(RID),
    WID SERIAL NOT NULL PRIMARY KEY,
    UNIQUE (PID, RID)
);

CREATE TABLE Staff (
    SID SERIAL NOT NULL PRIMARY KEY,
    Name VARCHAR(100) NOT NULL
);

CREATE TABLE Evaluates (
    WID INT NOT NULL REFERENCES WorksOn(WID),
    SID INT NOT NULL REFERENCES Staff(SID),
    Rating INT NOT NULL,
    PRIMARY KEY (WID, SID)
);

CREATE TABLE Article (
    AID SERIAL NOT NULL PRIMARY KEY,
    Year INT NOT NULL
);

CREATE TABLE Writes (
    AID INT NOT NULL REFERENCES Article(AID),
    RID INT NOT NULL REFERENCES Researcher(RID),
    PRIMARY KEY (AID, RID)
);

CREATE TABLE JournalArticle (
    AID INT NOT NULL REFERENCES Article(AID),
    Journal VARCHAR(200) NOT NULL,
    Volume INT NOT NULL,
    PRIMARY KEY (AID)
);

CREATE TABLE ConferenceArticle (
    AID INT NOT NULL REFERENCES Article(AID),
    Conference VARCHAR(100) NOT NULL,
    PRIMARY KEY (AID)
);

-- This is an error the Staff Id should have been assigned to a manages on the Journal Article so 
-- that we could keep the one to many relation. Therefore the manages relation / table 
-- should be deleted. 


CREATE TABLE Manages (
    SID INT NOT NULL REFERENCES Staff(SID),
    AID INT NOT NULL REFERENCES JournalArticle(AID),
    PRIMARY KEY (SID, AID)
);