-- Q1)1.
CREATE DATABASE TechShop;
USE TechShop;
--Q2)1.
CREATE TABLE Customers (
    CustomerID INT PRIMARY KEY,
    FirstName VARCHAR(50) ,
    LastName VARCHAR(50) ,
    Email VARCHAR(100) ,
    Phone VARCHAR(20),
    Address VARCHAR(255)
);

CREATE TABLE Products (
    ProductID INT PRIMARY KEY,
    ProductName VARCHAR(255) ,
	Description varchar (255),
    Price DECIMAL(10, 2) ,
);

CREATE TABLE Orders (
    OrderID INT PRIMARY KEY,
    CustomerID INT,
    OrderDate DATE ,
	TotalAmount Float,
    FOREIGN KEY (CustomerID) REFERENCES Customers(CustomerID)
);
CREATE TABLE OrderDetails (
    OrderDetailID INT PRIMARY KEY,
    OrderID INT,
    ProductID INT,
    Quantity INT ,
	FOREIGN KEY (OrderID) REFERENCES Orders(OrderID),
    FOREIGN KEY (ProductID) REFERENCES Products(ProductID)
);
CREATE TABLE Inventory(
    InventoryID INT PRIMARY KEY,
    ProductID INT ,
	QuantityInStock INT,
	LastStockUpdate Date,
    FOREIGN KEY (ProductID) REFERENCES Products(ProductID)
);

--Q3)a.
INSERT INTO Customers (CustomerID, FirstName, LastName, Email, Phone, Address)
VALUES
  (1, 'Raj', 'Sharma', 'rajsharma123@email.com', '456-789-1234', '123 Main St'),
  (2, 'Noddy', 'White', 'noddywhite745@email.com', '234-654-3210', '246 side ave'),
  (3, 'Sachin', 'Sharma', 'sachins101@email.com', '346-678-3654', '232 main ave'),
  (4, 'Rohit', 'Kohli', 'rkohli245@email.com', '567-365-1234', '245 happy street'),
  (5, 'Lionel', 'Messi', 'messilm10@email.com', '875-467-7909', '780 sad street'),
  (6, 'Sunil', 'Chetri', 'sunilc234@email.com', '245-790-4765', '456 croocs ave'),
  (7, 'Kylian', 'Mbappe', 'kymbappe999@email.com', '321-789-7689', '789 main street'),
  (8, 'Shubman', 'Gill', 'gill200@email.com', '786-468-9064', '245 long street'),
  (9, 'Ishan', 'Kishan', 'Ikishan95@email.com', '367-890-1567', '780 high ave'),
  (10, 'Virat', 'Singh', 'singhisking@email.com', '467-897-3456', '678 low street')

  INSERT INTO Products (ProductID, ProductName, Description, Price)
VALUES
  (1, 'Laptop', 'High-performance laptop with 16GB RAM', 53999.99),
  (2, 'Smartphone', 'Latest model with dual cameras', 15599.99),
  (3, 'Camera', 'Wildlife Camera', 99599.99),
  (4, 'Keyboard', 'extra durables', 1599.99),
  (5, 'Smartphone', 'high speed processor', 34599.99),
  (6, 'Laptop', 'Gaming Laptop', 123599.99),
  (7, 'Mouse', 'Wireless Mouse', 599.99),
  (8, 'Monitor', 'LED Display with Eye Protection', 3599.99),
  (9, 'Television', '4K Dolby Vision', 89599.99),
  (10, 'Projector', 'HD Projection', 45599.99)

INSERT INTO Orders (OrderID, CustomerID, OrderDate, TotalAmount)
VALUES
  (1, 1, '2023-11-01',53999.99),
  (2, 2, '2023-10-04',15599.99),
  (3, 3, '2023-11-04',99599.99),
  (4, 4, '2023-09-07',1599.99),
  (5, 5, '2023-08-08',34599.99),
  (6, 6, '2023-11-03',123599.99),
  (7, 7, '2023-11-07',3599.99),
  (8, 8, '2023-07-06',599.99),
  (9, 9, '2023-06-08',89599.99),
  (10,10,'2023-11-09',45599.99)

  INSERT INTO OrderDetails (OrderDetailID, OrderID, ProductID, Quantity)
VALUES
  (1, 1, 1, 1),
  (2, 2, 2, 1),
  (3, 3, 3, 1),
  (4, 4, 4, 1),
  (5, 5, 5, 1),
  (6, 6, 6, 1),
  (7, 7, 7, 1),
  (8, 8, 8, 1),
  (9, 9, 9, 1),
  (10,10,10,1)

  INSERT INTO Inventory (InventoryID, ProductID, QuantityInStock,LastStockUpdate)
VALUES
  (1, 1, 10,'2023-11-01'),
  (2, 2, 20,'2023-10-04'),
  (3, 3, 15,'2023-11-04'),
  (4, 4,25,'2023-09-07'),
  (5, 5, 20,'2023-08-08'),
  (6, 6, 15,'2023-11-03'),
  (7, 7, 10,'2023-11-07'),
  (8, 8, 25,'2023-07-06'),
  (9, 9, 15,'2023-06-08'),
  (10,10,20,'2023-11-09')

 --Task 3)b.1.
 SELECT FirstName, LastName, Email FROM Customers;

 --Task 3)b.2.
 SELECT 
    Orders.OrderID,
    Orders.OrderDate,
    Customers.FirstName,
    Customers.LastName
FROM 
    Orders
JOIN 
    Customers ON Orders.CustomerID = Customers.CustomerID;
 --Task 3)b.3
INSERT INTO Customers (CustomerID,FirstName, LastName, Email, Phone, Address)
VALUES (11,'Naman', 'Sharma', 'namans007@email.com', '803-379-7678', '789 Elm St');

 --Task 3)b.4
 update Products
 set Price=Price*1.1;
 Select*from OrderDetails;

  --Task 3)b.5
DELETE FROM OrderDetails WHERE OrderID =10 ;
DELETE FROM Orders WHERE OrderID = 10;

   --Task 3)b.6
INSERT INTO Orders (OrderID,CustomerID, OrderDate, TotalAmount)
VALUES (10,10, '2023-11-30', 12000.00);

  --Task 3)b.7
  UPDATE Customers
SET 
    Email = 'new.email@email.com',
    Address = '123 apple Street'
WHERE CustomerID = 1;
 
-- Task 4)1
SELECT 
    Orders.OrderID,
    Orders.OrderDate,
    Orders.TotalAmount,
    Customers.FirstName,
    Customers.LastName,
    Customers.Email,
    Customers.Phone,
    Customers.Address
FROM 
    Orders
JOIN 
    Customers ON Orders.CustomerID = Customers.CustomerID;

-- Task 4)2

	SELECT
    P.ProductID,
    P.ProductName,
    SUM(OD.Quantity * P.Price) AS TotalRevenue
FROM
    Products AS P
JOIN
    OrderDetails AS OD ON P.ProductID = OD.ProductID
	GROUP BY
    P.ProductID, P.ProductName;

--Task 4)3
SELECT DISTINCT
    C.CustomerID,
    C.FirstName,
    C.LastName,
    C.Email,
    C.Phone,
    C.Address
FROM
    Customers AS C
JOIN
    Orders AS O ON C.CustomerID = O.CustomerID;

--Task 4)4
SELECT
    P.ProductName,
    SUM(OD.Quantity) AS TotalQuantityOrdered
FROM
    Products AS P
JOIN
    OrderDetails AS OD ON P.ProductID = OD.ProductID
GROUP BY
    P.ProductName
ORDER BY
    TotalQuantityOrdered DESC;

-- adding a column category in table Products
ALTER TABLE Products
ADD  Category VARCHAR(50);
UPDATE Products
SET Category = 'Electronic Gadget'

	--Task 4)5
	SELECT
    ProductID,
    ProductName,
    Description,
    Price,
    Category
FROM
    Products
WHERE
    Category = 'Electronic Gadget';

	--Task 4)6
	SELECT
    C.CustomerID,
    C.FirstName,
    C.LastName,
    AVG(O.TotalAmount) AS AverageOrderValue
FROM
    Customers AS C
JOIN
    Orders AS O ON C.CustomerID = O.CustomerID
GROUP BY
    C.CustomerID, C.FirstName, C.LastName;

	--Task 4)7
SELECT
    O.OrderID,
    O.OrderDate,
    O.TotalAmount AS TotalRevenue,
    C.CustomerID,
    C.FirstName,
    C.LastName,
    C.Email,
    C.Phone,
    C.Address
FROM
    Orders AS O
JOIN
    Customers AS C ON O.CustomerID = C.CustomerID
ORDER BY
    TotalRevenue DESC

--Task 4)8
SELECT
    P.ProductID,
    P.ProductName,
    COUNT(OD.OrderID) AS OrderCount
FROM
    Products AS P
LEFT JOIN
    OrderDetails AS OD ON P.ProductID = OD.ProductID
WHERE
    P.Category = 'Electronic Gadget'
GROUP BY
    P.ProductID, P.ProductName;

	--Task 4)9
	--Task 4)10
	--Task 5)1
	SELECT
    C.CustomerID,
    C.FirstName,
    C.LastName,
    C.Email,
    C.Phone,
    C.Address
FROM
    Customers AS C
LEFT JOIN
    Orders AS O ON C.CustomerID = O.CustomerID
WHERE
    O.OrderID IS NULL;

	--Task 5)2
select sum([LastStockUpdate])
from [dbo].[Inventory];

  --Task 5)3
  SELECT
    SUM(TotalAmount) AS TotalRevenue
FROM
    Orders;
	--Task 5)4
	SELECT
    P.Category,
    AVG(OD.Quantity) AS AverageQuantityOrdered
FROM
    Products AS P
JOIN
    OrderDetails AS OD ON P.ProductID = OD.ProductID
WHERE
    P.Category = 'Electronic Gadget'
GROUP BY
    P.Category;

	--Task 5)5
	SELECT
    C.CustomerID,
    C.FirstName,
    C.LastName,
    SUM(O.TotalAmount) AS TotalRevenue
FROM
    Customers AS C
JOIN
    Orders AS O ON C.CustomerID = O.CustomerID
WHERE
    C.CustomerID = 1 -- You Can change the customer by changing the customer id
GROUP BY
    C.CustomerID, C.FirstName, C.LastName;

	--Task 5)6
	SELECT
    C.CustomerID,
    C.FirstName,
    C.LastName,
    COUNT(O.OrderID) AS NumberOfOrdersPlaced
FROM
    Customers AS C
JOIN
    Orders AS O ON C.CustomerID = O.CustomerID
GROUP BY
    C.CustomerID, C.FirstName, C.LastName
ORDER BY
    NumberOfOrdersPlaced DESC

	--Task 5)7
SELECT
    P.Category,
    SUM(OD.Quantity) AS TotalQuantityOrdered
FROM
    Products AS P
JOIN
    OrderDetails AS OD ON P.ProductID = OD.ProductID
GROUP BY
    P.Category
ORDER BY
    TotalQuantityOrdered DESC
OFFSET 0 ROWS
FETCH NEXT 1 ROWS ONLY;
	--Task 5)8
	SELECT
    C.CustomerID,
    C.FirstName,
    C.LastName,
    SUM(OD.Quantity * P.Price) AS TotalSpending
FROM
    Customers AS C
JOIN
    Orders AS O ON C.CustomerID = O.CustomerID
JOIN
    OrderDetails AS OD ON O.OrderID = OD.OrderID
JOIN
    Products AS P ON OD.ProductID = P.ProductID
WHERE
    P.Category = 'Electronic Gadget'
GROUP BY
    C.CustomerID, C.FirstName, C.LastName
ORDER BY
    TotalSpending DESC
OFFSET 0 ROWS
FETCH NEXT 1 ROWS ONLY;

--Task 5)9
SELECT
    C.CustomerID,
    C.FirstName,
    C.LastName,
    COUNT(O.OrderID) AS NumberOfOrders,
    SUM(O.TotalAmount) AS TotalRevenue,
    AVG(O.TotalAmount) AS AverageOrderValue
FROM
    Customers AS C
LEFT JOIN
    Orders AS O ON C.CustomerID = O.CustomerID
GROUP BY
    C.CustomerID, C.FirstName, C.LastName;

	--Task 5)10
SELECT
    C.CustomerID,
    C.FirstName,
    C.LastName,
    COUNT(O.OrderID) AS OrderCount
FROM
    Customers AS C
LEFT JOIN
    Orders AS O ON C.CustomerID = O.CustomerID
GROUP BY
    C.CustomerID, C.FirstName, C.LastName;



