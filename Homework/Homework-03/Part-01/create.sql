-- First drop tables if they don't exists...
DROP TABLE IF EXISTS Reviews;
DROP TABLE IF EXISTS "Grant";
DROP TABLE IF EXISTS Sponsor;
DROP TABLE IF EXISTS Monitors;
DROP TABLE IF EXISTS Party;
DROP TABLE IF EXISTS ServeIn;
DROP TABLE IF EXISTS Role;
DROP TABLE IF EXISTS Participate;
DROP TABLE IF EXISTS Linking;
DROP TABLE IF EXISTS Opposes;
DROP TABLE IF EXISTS Asset;
DROP TABLE IF EXISTS Member;
DROP TABLE IF EXISTS Enemy;
DROP TABLE IF EXISTS People;

-- Create tables

CREATE TABLE People (
    ID SERIAL NOT NULL PRIMARY KEY,
    Name VARCHAR NOT NULL,
    Address VARCHAR NOT NULL,
    Phone VARCHAR(8) NOT NULL,
    DOB DATE NOT NULL,
    DOD DATE
);

CREATE TABLE Member (
    PID INT NOT NULL PRIMARY KEY REFERENCES People(ID),
    Start_date DATE NOT NULL
);

CREATE TABLE Enemy (
    PID INT NOT NULL PRIMARY KEY REFERENCES People(ID)
);

CREATE TABLE Asset (
    Name VARCHAR NOT NULL,
    MemberID INT NOT NULL REFERENCES Member(PID),
    Detail VARCHAR NOT NULL,
    Uses VARCHAR NOT NULL,
    PRIMARY KEY (Name, MemberID)
);

CREATE TABLE Opposes (
    MID INT NOT NULL REFERENCES Member(PID),
    EID INT NOT NULL REFERENCES Enemy(PID),
    Start_date DATE NOT NULL,
    End_date Date,
    PRIMARY KEY (MID, EID)
);

CREATE TABLE Linking (
    ID SERIAL NOT NULL PRIMARY KEY,
    Name VARCHAR NOT NULL,
    Type VARCHAR NOT NULL,
    Description VARCHAR NOT NULL
);

CREATE TABLE Participate (
    PID INT NOT NULL REFERENCES People(ID),
    LID INT NOT NULL REFERENCES Linking(ID),
    PRIMARY KEY (PID, LID)
);

CREATE TABLE Role (
    ID SERIAL NOT NULL PRIMARY KEY,
    Title VARCHAR NOT NULL UNIQUE
);

CREATE TABLE ServeIn (
    RID INT NOT NULL REFERENCES Role(ID),
    MID INT NOT NULL REFERENCES Member(PID),
    Start_date DATE NOT NULL,
    End_date DATE NOT NULL,
    Salary INT NOT NULL,
    PRIMARY KEY (RID, MID)
);

CREATE TABLE Party (
    ID SERIAL NOT NULL PRIMARY KEY,
    Country VARCHAR,
    Name VARCHAR,
    UNIQUE(Country, Name)
);


CREATE TABLE Monitors (
    PartyID INT NOT NULL REFERENCES Party(ID),
    MID INT NOT NULL REFERENCES Member(PID),
    Start_date DATE NOT NULL,
    End_date DATE NOT NULL,
    PRIMARY KEY (PartyID, MID, Start_date)
);

CREATE TABLE Sponsor (
    ID SERIAL NOT NULL PRIMARY KEY,
    Name VARCHAR NOT NULL,
    Address VARCHAR NOT NULL,
    Industry VARCHAR NOT NULL
);

CREATE TABLE "Grant" (
    ID SERIAL NOT NULL PRIMARY KEY,
    SID INT NOT NULL REFERENCES Sponsor(ID),
    MID INT NOT NULL REFERENCES Member(PID),
    Date DATE NOT NULL,
    Amount INT NOT NULL,
    PayBack INT NOT NULL,

    UNIQUE(SID, MID, Date)
);

CREATE TABLE Reviews (
    GID INT NOT NULL REFERENCES "Grant"(ID),
    MID INT NOT NULL REFERENCES Member(PID),
    Date DATE NOT NULL,
    Grade INT,
    PRIMARY KEY (GID, MID)
);