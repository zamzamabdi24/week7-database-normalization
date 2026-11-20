-- =====================================================
-- Week 7 Assignment: Database Design and Normalization
-- =====================================================

CREATE DATABASE IF NOT EXISTS week7_assignment;
USE week7_assignment;

-- =====================================================
-- QUESTION 1: Achieving First Normal Form (1NF)
-- =====================================================
-- Each product is stored in its own row.

DROP TABLE IF EXISTS ProductDetail1NF;

CREATE TABLE ProductDetail1NF (
    OrderID INT NOT NULL,
    CustomerName VARCHAR(100) NOT NULL,
    Product VARCHAR(100) NOT NULL,

    PRIMARY KEY (OrderID, Product)
);

INSERT INTO ProductDetail1NF
    (OrderID, CustomerName, Product)
VALUES
    (101, 'John Doe', 'Laptop'),
    (101, 'John Doe', 'Mouse'),
    (102, 'Jane Smith', 'Tablet'),
    (102, 'Jane Smith', 'Keyboard'),
    (102, 'Jane Smith', 'Mouse'),
    (103, 'Emily Clark', 'Phone');

SELECT * FROM ProductDetail1NF;

-- =====================================================
-- QUESTION 2: Achieving Second Normal Form (2NF)
-- =====================================================
-- CustomerName is moved to Orders because it depends only
-- on OrderID, removing the partial dependency.

DROP TABLE IF EXISTS OrderItems;
DROP TABLE IF EXISTS Orders;

CREATE TABLE Orders (
    OrderID INT NOT NULL,
    CustomerName VARCHAR(100) NOT NULL,

    PRIMARY KEY (OrderID)
);

CREATE TABLE OrderItems (
    OrderID INT NOT NULL,
    Product VARCHAR(100) NOT NULL,
    Quantity INT NOT NULL,

    PRIMARY KEY (OrderID, Product),

    CONSTRAINT fk_orderitems_orders
        FOREIGN KEY (OrderID)
        REFERENCES Orders (OrderID)
);

INSERT INTO Orders
    (OrderID, CustomerName)
VALUES
    (101, 'John Doe'),
    (102, 'Jane Smith'),
    (103, 'Emily Clark');

INSERT INTO OrderItems
    (OrderID, Product, Quantity)
VALUES
    (101, 'Laptop', 2),
    (101, 'Mouse', 1),
    (102, 'Tablet', 3),
    (102, 'Keyboard', 1),
    (102, 'Mouse', 2),
    (103, 'Phone', 1);

SELECT * FROM Orders;
SELECT * FROM OrderItems;