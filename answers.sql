CREATE DATABASE normalizationDB;
USE normalizationDB;

CREATE TABLE ProductDetail_1NF (
    OrderID INT,
    CustomerName VARCHAR(100),
    Product VARCHAR(50)
);

-- Order 101 - John Doe
INSERT INTO ProductDetail_1NF VALUES (101, 'John Doe', 'Laptop');
INSERT INTO ProductDetail_1NF VALUES (101, 'John Doe', 'Mouse');

-- Order 102 - Jane Smith
INSERT INTO ProductDetail_1NF VALUES (102, 'Jane Smith', 'Tablet');
INSERT INTO ProductDetail_1NF VALUES (102, 'Jane Smith', 'Keyboard');
INSERT INTO ProductDetail_1NF VALUES (102, 'Jane Smith', 'Mouse');

-- Order 103 - Emily Clark
INSERT INTO ProductDetail_1NF VALUES (103, 'Emily Clark', 'Phone');

-- Create table for products and quantities in each order
CREATE TABLE OrderItems (
    OrderID INT,
    Product VARCHAR(100),
    Quantity INT,
    FOREIGN KEY (OrderID) REFERENCES Orders(OrderID)
);

-- Insert products and quantities linked to each order
INSERT INTO OrderItems (OrderID, Product, Quantity)
VALUES
(101, 'Laptop', 2),
(101, 'Mouse', 1),
(102, 'Tablet', 3),
(102, 'Keyboard', 1),
(102, 'Mouse', 2),
(103, 'Phone', 1);

-- Step 1: Create the Products table to hold product-specific information
CREATE TABLE Products (
    ProductID INT AUTO_INCREMENT PRIMARY KEY,
    ProductName VARCHAR(100),
    ProductVendor VARCHAR(100)
);

-- Step 2: Insert unique products into the Products table
INSERT INTO Products (ProductName, ProductVendor)
VALUES
('Laptop', 'TechCorp'),
('Mouse', 'ClickMakers'),
('Tablet', 'GadgetPro'),
('Keyboard', 'KeyTek'),
('Phone', 'Smartify');

-- Step 3: Create the Orders table (already exists if you've done 2NF, but included here for completeness)
CREATE TABLE Orders (
    OrderID INT PRIMARY KEY,
    CustomerName VARCHAR(100)
);

-- Step 4: Insert data into Orders table
INSERT INTO Orders (OrderID, CustomerName)
VALUES
(101, 'John Doe'),
(102, 'Jane Smith'),
(103, 'Emily Clark');

-- Step 5: Create the OrderItems table with a reference to ProductID
CREATE TABLE OrderItems (
    OrderItemID INT AUTO_INCREMENT PRIMARY KEY,
    OrderID INT,
    ProductID INT,
    Quantity INT,
    FOREIGN KEY (OrderID) REFERENCES Orders(OrderID),
    FOREIGN KEY (ProductID) REFERENCES Products(ProductID)
);

-- Step 6: Insert data into OrderItems using ProductID references
INSERT INTO OrderItems (OrderID, ProductID, Quantity)
VALUES
(101, 1, 2),  -- Laptop
(101, 2, 1),  -- Mouse
(102, 3, 3),  -- Tablet
(102, 4, 1),  -- Keyboard
(102, 2, 2),  -- Mouse
(103, 5, 1);  -- Phone
