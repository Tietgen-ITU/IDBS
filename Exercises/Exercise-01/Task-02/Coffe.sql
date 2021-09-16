DROP TABLE IF EXISTS Sells;
DROP TABLE IF EXISTS Coffee;
DROP TABLE IF EXISTS CoffeeHouse;

CREATE TABLE Coffee (
    name VARCHAR(100) PRIMARY KEY,
    manufacturer VARCHAR
); 

INSERT INTO Coffee VALUES ('Latte', 'Gevalia');


CREATE TABLE CoffeeHouse (
    name VARCHAR(100) PRIMARY KEY,
    address VARCHAR,
    license VARCHAR DEFAULT 'Fødevarestyrelsens Licens'
);

INSERT INTO CoffeeHouse (name, address) 
VALUES ('Brewstars', 'Brysselgade 1, 2300 København S'),
        ('Late Late Latte', 'Kongens Nytorv 23, 2300 København S');


CREATE TABLE Sells (
    coffeeHouse VARCHAR(100) REFERENCES CoffeeHouse(name),
    coffee VARCHAR(100) REFERENCES Coffee(name),
    price FLOAT,
    PRIMARY KEY (coffeeHouse, coffee)
);


INSERT INTO Sells (coffeeHouse, coffee, price) 
VALUES ('Brewstars', 'Latte', 19.99), 
        ('Late Late Latte', 'Latte', 49.99);

CREATE DOMAIN Licenses 