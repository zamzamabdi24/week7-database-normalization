<<<<<<< HEAD
-- =====================================================
-- Week 8 Assignment: MySQL Database Backup and Restore
-- File: answer.sql
-- =====================================================

-- =====================================================
-- QUESTION 1: Creating a Complete Database Backup
-- =====================================================
--
-- Command:
-- mysqldump -u root -p sales > sales_backup.sql
--
-- Explanation:
-- mysqldump is the MySQL command-line backup utility.
-- -u root connects as the root MySQL user.
-- -p tells MySQL to prompt for the password.
-- sales is the database being backed up.
-- > sales_backup.sql saves the backup output into a file
-- named sales_backup.sql.
--
-- This command creates a complete backup of the sales database.
-- It includes the database structure, tables, and data.
--
-- Regular backups are important because they protect data from
-- accidental deletion, hardware failure, software errors, corruption,
-- security incidents, and human mistakes. If something goes wrong,
-- the database can be restored from the backup file.

-- =====================================================
-- QUESTION 2: Backing Up All Databases
-- =====================================================
--
-- Command:
-- mysqldump -u root -p --all-databases > all_databases_backup.sql
--
-- Explanation:
-- mysqldump is the MySQL command-line backup utility.
-- -u root connects as the root MySQL user.
-- -p tells MySQL to prompt for the password.
-- --all-databases backs up every database on the MySQL server.
-- > all_databases_backup.sql saves the backup output into a file
-- named all_databases_backup.sql.
--
-- This command creates a complete backup of all databases on the server.
--
-- Backing up all databases before migration is important because it
-- preserves the entire MySQL server environment. If an error occurs
-- during migration, the administrator can restore the databases and
-- avoid losing application data, table structures, and important
-- database information.
=======
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
    (103, 'Phone', 1);-- =====================================================
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
>>>>>>> b952025b141b761cbe8fb255b90465da321a88ef
