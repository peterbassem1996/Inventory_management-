-- ---------------------------------------------------------------
-- Peter B Dawoud
-- CSC239-01
-- Spring 2020
-- Database System
-- “Inventory Management System”
-- Lab #13
-- ---------------------------------------------------------------
DROP TABLE Warehouse CASCADE CONSTRAINTS;
DROP TABLE Vendor CASCADE CONSTRAINTS;
DROP TABLE Product CASCADE CONSTRAINTS;
DROP TABLE Inventory CASCADE CONSTRAINTS;
DROP TABLE Purchase_Order CASCADE CONSTRAINTS;
DROP TABLE Purchase_Order_Line CASCADE CONSTRAINTS;
DROP TABLE Shipment CASCADE CONSTRAINTS;
DROP TABLE Shipment_Line CASCADE CONSTRAINTS;
DROP TABLE Customer CASCADE CONSTRAINTS;
DROP TABLE Sale CASCADE CONSTRAINTS;
DROP TABLE Sale_Line CASCADE CONSTRAINTS;

-- ---------------------------------------------------------------

CREATE TABLE Warehouse(
    "Warehouse_ID" varchar2(255),
    "Warehouse_City" varchar2(255),
    "Warehouse_State" varchar2(255),
    Constraint "Warehouse_Warehouse_ID_pk" primary key ("Warehouse_ID")
);

INSERT INTO Warehouse
("Warehouse_ID", "Warehouse_City", "Warehouse_State")
VALUES
('MEC914', 'Piscataway', 'NK');

INSERT INTO Warehouse
("Warehouse_ID", "Warehouse_City", "Warehouse_State" )
VALUES
('RDC100', 'Nichols', 'NY');

INSERT INTO Warehouse
("Warehouse_ID", "Warehouse_City", "Warehouse_State" )
VALUES
('MEC800', 'Compton', 'CA');

INSERT INTO Warehouse
("Warehouse_ID", "Warehouse_City", "Warehouse_State" )
VALUES
('MEC700', 'Jakarta', 'IL');

INSERT INTO Warehouse
("Warehouse_ID", "Warehouse_City", "Warehouse_State" )
VALUES
('MEC600', 'Seatle', 'WA');

SELECT * FROM Warehouse;

UPDATE Warehouse
SET "Warehouse_State" = 'NJ'
WHERE "Warehouse_ID" = 'MEC914';

SELECT * FROM Warehouse;

-- ---------------------------------------------------------------

CREATE TABLE Vendor(
    "Vendor_ID" varchar2(255),
    "Vendor_Name" varchar2(255),
    Constraint "Vendor_Vendor_ID_pk" primary key ("Vendor_ID")
);

INSERT INTO Vendor
("Vendor_ID", "Vendor_Name")
VALUES
('001', 'Bpple');

INSERT INTO Vendor
("Vendor_ID", "Vendor_Name")
VALUES
('002', 'Microsoft');

INSERT INTO Vendor
("Vendor_ID", "Vendor_Name")
VALUES
('003', 'Google');

INSERT INTO Vendor
("Vendor_ID", "Vendor_Name")
VALUES
('004', 'Amazon');

INSERT INTO Vendor
("Vendor_ID", "Vendor_Name")
VALUES
('005', 'Dell');

SELECT * FROM Vendor;

UPDATE Vendor
SET "Vendor_Name" = 'Apple'
WHERE "Vendor_ID" = '001';

SELECT * FROM Vendor;

-- ---------------------------------------------------------------

CREATE TABLE Product(
    "Product_SKU" varchar2(255),
    "Product_Name" varchar2(255),
    "Vendor_ID" varchar2(255),
    "Product_Purchase_Price" number(8,2),
    "Product_Sale_Price" number(8,2),
    Constraint "Product_Product_SKU_pk" primary key ("Product_SKU"),
    CONSTRAINT FK_Product_Vendor FOREIGN KEY ("Vendor_ID")
    REFERENCES Vendor("Vendor_ID")
);

INSERT INTO Product
("Product_SKU", "Product_Name", "Vendor_ID", "Product_Purchase_Price", "Product_Sale_Price")
VALUES
('0001', 'Macbook Air', '001', 899.99, 1099.99);

INSERT INTO Product
("Product_SKU", "Product_Name", "Vendor_ID", "Product_Purchase_Price", "Product_Sale_Price")
VALUES
('0002', 'Surface Laptop', '002', 1099.99, 1199.99);

INSERT INTO Product
("Product_SKU", "Product_Name", "Vendor_ID", "Product_Purchase_Price", "Product_Sale_Price")
VALUES
('0003', 'Google Pixel 4', '003', 649.99, 699.99);

INSERT INTO Product
("Product_SKU", "Product_Name", "Vendor_ID", "Product_Purchase_Price", "Product_Sale_Price")
VALUES
('0004', 'Amazon Kindle', '004', 59.99, 69.99);

INSERT INTO Product
("Product_SKU", "Product_Name", "Vendor_ID", "Product_Purchase_Price", "Product_Sale_Price")
VALUES
('0005', 'Dell XPS 13', '005', 1199.99, 1299.99);

SELECT * FROM Product;

UPDATE Product
SET "Product_Sale_Price" = 999.99
WHERE "Product_SKU" = '0001';

SELECT * FROM Product;

-- ---------------------------------------------------------------

CREATE TABLE Inventory(
    "Warehouse_ID" varchar2(255),
    "Product_SKU" varchar2(255),
    "Inv_Quantity" number(8, 0),
    Constraint "Inventory_pk" primary key ("Warehouse_ID", "Product_SKU"),
    CONSTRAINT FK_Inventory_Warehouse FOREIGN KEY ("Warehouse_ID")
    REFERENCES Warehouse("Warehouse_ID"),
    CONSTRAINT FK_Inventory_Vendor FOREIGN KEY ("Product_SKU")
    REFERENCES Product("Product_SKU")
);

INSERT INTO Inventory
("Warehouse_ID", "Product_SKU", "Inv_Quantity")
VALUES
('MEC914', '0001', 300);

INSERT INTO Inventory
("Warehouse_ID", "Product_SKU", "Inv_Quantity")
VALUES
('MEC914', '0002', 500);

INSERT INTO Inventory
("Warehouse_ID", "Product_SKU", "Inv_Quantity")
VALUES
('MEC914', '0003', 500);

INSERT INTO Inventory
("Warehouse_ID", "Product_SKU", "Inv_Quantity")
VALUES
('MEC914', '0004', 500);

INSERT INTO Inventory
("Warehouse_ID", "Product_SKU", "Inv_Quantity")
VALUES
('MEC914', '0005', 500);

INSERT INTO Inventory
("Warehouse_ID", "Product_SKU", "Inv_Quantity")
VALUES
('RDC100', '0001', 500);

INSERT INTO Inventory
("Warehouse_ID", "Product_SKU", "Inv_Quantity")
VALUES
('RDC100', '0002', 500);

INSERT INTO Inventory
("Warehouse_ID", "Product_SKU", "Inv_Quantity")
VALUES
('RDC100', '0003', 500);

INSERT INTO Inventory
("Warehouse_ID", "Product_SKU", "Inv_Quantity")
VALUES
('RDC100', '0004', 500);

INSERT INTO Inventory
("Warehouse_ID", "Product_SKU", "Inv_Quantity")
VALUES
('RDC100', '0005', 500);

SELECT * FROM Inventory;

UPDATE Inventory
SET "Inv_Quantity" = 500
WHERE "Warehouse_ID" = 'MEC914' AND "Product_SKU" = '0001';

SELECT * FROM Inventory;

-- ---------------------------------------------------------------

CREATE TABLE Purchase_Order(
    "Purchase_Order_ID" varchar2(255),
    "Vendor_ID" varchar2(255),
    "Warehouse_ID" varchar2(255),
    "Purchase_Date" date,
    Constraint "Purchase_Order_ID_pk" primary key ("Purchase_Order_ID"),
    CONSTRAINT FK_PO_Warehouse FOREIGN KEY ("Warehouse_ID")
    REFERENCES Warehouse("Warehouse_ID"),
    CONSTRAINT FK_PO_Vendor FOREIGN KEY ("Vendor_ID")
    REFERENCES Vendor("Vendor_ID")
);

INSERT INTO Purchase_Order
("Purchase_Order_ID", "Vendor_ID", "Warehouse_ID", "Purchase_Date")
VALUES
('P1', '001', 'RDC100', '12-May-2020');

INSERT INTO Purchase_Order
("Purchase_Order_ID", "Vendor_ID", "Warehouse_ID", "Purchase_Date")
VALUES
('P2', '002', 'RDC100', '12-May-2020');

INSERT INTO Purchase_Order
("Purchase_Order_ID", "Vendor_ID", "Warehouse_ID", "Purchase_Date")
VALUES
('P3', '003', 'RDC100', '12-May-2020');

INSERT INTO Purchase_Order
("Purchase_Order_ID", "Vendor_ID", "Warehouse_ID", "Purchase_Date")
VALUES
('P4', '004', 'RDC100', '12-May-2020');

INSERT INTO Purchase_Order
("Purchase_Order_ID", "Vendor_ID", "Warehouse_ID", "Purchase_Date")
VALUES
('P5', '005', 'RDC100', '12-May-2010');

SELECT * FROM Purchase_Order;

UPDATE Purchase_Order
SET "Purchase_Date" = '12-May-2020'
WHERE "Purchase_Order_ID" = 'P5';

SELECT * FROM Purchase_Order;


-- ---------------------------------------------------------------

CREATE TABLE Purchase_Order_Line(
    "Purchase_Order_ID" varchar2(255),
    "Product_SKU" varchar2(255),
    "Purchase_Quantity" number(8, 0),
    Constraint "POL_pk" primary key ("Purchase_Order_ID", "Product_SKU"),
    CONSTRAINT FK_POL_PO FOREIGN KEY ("Purchase_Order_ID")
    REFERENCES Purchase_Order("Purchase_Order_ID"),
    CONSTRAINT FK_POL_Product FOREIGN KEY ("Product_SKU")
    REFERENCES Product("Product_SKU")
);

INSERT INTO Purchase_Order_Line
("Purchase_Order_ID", "Product_SKU", "Purchase_Quantity")
VALUES
('P1', '0001', 100);

INSERT INTO Purchase_Order_Line
("Purchase_Order_ID", "Product_SKU", "Purchase_Quantity")
VALUES
('P2', '0002', 100);

INSERT INTO Purchase_Order_Line
("Purchase_Order_ID", "Product_SKU", "Purchase_Quantity")
VALUES
('P3', '0003', 100);

INSERT INTO Purchase_Order_Line
("Purchase_Order_ID", "Product_SKU", "Purchase_Quantity")
VALUES
('P4', '0004', 100);

INSERT INTO Purchase_Order_Line
("Purchase_Order_ID", "Product_SKU", "Purchase_Quantity")
VALUES
('P5', '0005', 10);

SELECT * FROM Purchase_Order_Line;

UPDATE Purchase_Order_Line
SET"Purchase_Quantity" = 100
WHERE "Purchase_Order_ID" = 'P5' AND "Product_SKU" = '0005';

SELECT * FROM Purchase_Order_Line;

-- ---------------------------------------------------------------

CREATE TABLE Shipment(
    "Shipment_ID" varchar2(255),
    "From_Warehouse_ID" varchar2(255),
    "To_Warehouse_ID" varchar2(255),
    "Shipment_Date" date,
    Constraint "Shipment_ID_pk" primary key ("Shipment_ID"),
    CONSTRAINT FK_Shipment_From_Warehouse FOREIGN KEY ("From_Warehouse_ID")
    REFERENCES Warehouse("Warehouse_ID"),
    CONSTRAINT FK_Shipment_To_Warehouse FOREIGN KEY ("To_Warehouse_ID")
    REFERENCES Warehouse("Warehouse_ID")
);

INSERT INTO Shipment
("Shipment_ID", "From_Warehouse_ID", "To_Warehouse_ID", "Shipment_Date")
VALUES
('S1', 'RDC100', 'MEC914', '12-May-2020');

INSERT INTO Shipment
("Shipment_ID", "From_Warehouse_ID", "To_Warehouse_ID", "Shipment_Date")
VALUES
('S2', 'RDC100', 'MEC600', '12-May-2020');

INSERT INTO Shipment
("Shipment_ID", "From_Warehouse_ID", "To_Warehouse_ID", "Shipment_Date")
VALUES
('S3', 'RDC100', 'MEC700', '12-May-2020');

INSERT INTO Shipment
("Shipment_ID", "From_Warehouse_ID", "To_Warehouse_ID", "Shipment_Date")
VALUES
('S4', 'RDC100', 'MEC800', '12-May-2020');

INSERT INTO Shipment
("Shipment_ID", "From_Warehouse_ID", "To_Warehouse_ID", "Shipment_Date")
VALUES
('S5', 'RDC100', 'MEC914', '13-Jul-2020');

SELECT * FROM Shipment;

UPDATE Shipment
SET "Shipment_Date" = '12-Jun-2020'
WHERE "Shipment_ID" = 'S5';

SELECT * FROM Shipment;

-- ---------------------------------------------------------------

CREATE TABLE Shipment_Line(
    "Shipment_ID" varchar2(255),
    "Product_SKU" varchar2(255),
    "Shipment_Quantity" number(8, 0),
    Constraint "SHL_pk" primary key ("Shipment_ID", "Product_SKU"),
    CONSTRAINT FK_SHL_SH FOREIGN KEY ("Shipment_ID")
    REFERENCES Shipment("Shipment_ID"),
    CONSTRAINT FK_SHL_Product FOREIGN KEY ("Product_SKU")
    REFERENCES Product("Product_SKU")
);

INSERT INTO Shipment_Line
("Shipment_ID", "Product_SKU", "Shipment_Quantity")
VALUES
('S1', '0001', 100);

INSERT INTO Shipment_Line
("Shipment_ID", "Product_SKU", "Shipment_Quantity")
VALUES
('S1', '0002', 100);

INSERT INTO Shipment_Line
("Shipment_ID", "Product_SKU", "Shipment_Quantity")
VALUES
('S1', '0003', 100);

INSERT INTO Shipment_Line
("Shipment_ID", "Product_SKU", "Shipment_Quantity")
VALUES
('S1', '0004', 100);

INSERT INTO Shipment_Line
("Shipment_ID", "Product_SKU", "Shipment_Quantity")
VALUES
('S1', '0005', 10);

SELECT * FROM Shipment_Line;

UPDATE Shipment_Line
SET "Shipment_Quantity" = 100
WHERE "Shipment_ID" = 'S1' AND "Product_SKU" = '0005';

SELECT * FROM Shipment_Line;

-- ---------------------------------------------------------------

CREATE TABLE Customer(
    "Customer_ID" varchar2(255),
    "Customer_Name" varchar2(255),
    "Customer_Street" varchar2(255),
    "Customer_City" varchar2(255),
    "Customer_State" varchar2(255),
    "Customer_Zip" varchar2(255),
    Constraint "Customer_ID_pk" primary key ("Customer_ID")
);

INSERT INTO Customer
("Customer_ID", "Customer_Name", "Customer_Street", "Customer_City", "Customer_State", "Customer_Zip")
VALUES
('C001', 'George washington', '2600 Woodbridge Ave', 'Edison', 'NJ', '08837');

INSERT INTO Customer
("Customer_ID", "Customer_Name", "Customer_Street", "Customer_City", "Customer_State", "Customer_Zip")
VALUES
('C002', 'John Adams', '2600 Woodbridge Ave', 'Edison', 'NJ', '08837');

INSERT INTO Customer
("Customer_ID", "Customer_Name", "Customer_Street", "Customer_City", "Customer_State", "Customer_Zip")
VALUES
('C003', 'Thomas Jefferson', '2601 Woodbridge Ave', 'Edison', 'NJ', '08837');

INSERT INTO Customer
("Customer_ID", "Customer_Name", "Customer_Street", "Customer_City", "Customer_State", "Customer_Zip")
VALUES
('C004', 'Andrew Jackson', '2602 Woodbridge Ave', 'Edison', 'NJ', '08837');

INSERT INTO Customer
("Customer_ID", "Customer_Name", "Customer_Street", "Customer_City", "Customer_State", "Customer_Zip")
VALUES
('C005', 'Benjamin Frankie', '2603 Woodbridge Ave', 'Edison', 'NJ', '08837');

SELECT * FROM Customer;

UPDATE Customer
SET "Customer_Name" = 'Benjamin Franklin'
WHERE "Customer_ID" = 'C005';

SELECT * FROM Customer;

-- ---------------------------------------------------------------

CREATE TABLE Sale(
    "Sale_ID" varchar2(255),
    "Customer_ID" varchar2(255),
    "Warehouse_ID" varchar2(255),
    "Sale_Date" date,
    Constraint "Sale_ID_pk" primary key ("Sale_ID"),
    CONSTRAINT FK_Sale_Customer FOREIGN KEY ("Customer_ID")
    REFERENCES Customer("Customer_ID"),
    CONSTRAINT FK_Sale_Warehouse FOREIGN KEY ("Warehouse_ID")
    REFERENCES Warehouse("Warehouse_ID")
);

INSERT INTO Sale
("Sale_ID", "Customer_ID", "Warehouse_ID", "Sale_Date")
VALUES
('SA001', 'C001', 'MEC914', '20-May-2020');

INSERT INTO Sale
("Sale_ID", "Customer_ID", "Warehouse_ID", "Sale_Date")
VALUES
('SA002', 'C002', 'MEC914', '20-May-2020');

INSERT INTO Sale
("Sale_ID", "Customer_ID", "Warehouse_ID", "Sale_Date")
VALUES
('SA003', 'C003', 'MEC914', '20-May-2020');

INSERT INTO Sale
("Sale_ID", "Customer_ID", "Warehouse_ID", "Sale_Date")
VALUES
('SA004', 'C004', 'MEC914', '20-May-2020');

INSERT INTO Sale
("Sale_ID", "Customer_ID", "Warehouse_ID", "Sale_Date")
VALUES
('SA005', 'C005', 'MEC914', '20-Aug-2020');

SELECT * FROM Sale;

UPDATE Sale
SET "Sale_Date" = '20-May-2020'
WHERE "Sale_ID" = 'SA005';

SELECT * FROM Sale;

-- ---------------------------------------------------------------

CREATE TABLE Sale_Line(
    "Sale_ID" varchar2(255),
    "Product_SKU" varchar2(255),
    "Sal_Quantity" number(8, 0),
    Constraint "SL_pk" primary key ("Sale_ID", "Product_SKU"),
    CONSTRAINT FK_SL_S FOREIGN KEY ("Sale_ID")
    REFERENCES Sale("Sale_ID"),
    CONSTRAINT FK_SL_Product FOREIGN KEY ("Product_SKU")
    REFERENCES Product("Product_SKU")
);

INSERT INTO Sale_Line
("Sale_ID", "Product_SKU", "Sal_Quantity")
VALUES
('SA001', '0001', 1);

INSERT INTO Sale_Line
("Sale_ID", "Product_SKU", "Sal_Quantity")
VALUES
('SA001', '0002', 1);

INSERT INTO Sale_Line
("Sale_ID", "Product_SKU", "Sal_Quantity")
VALUES
('SA001', '0003', 1);

INSERT INTO Sale_Line
("Sale_ID", "Product_SKU", "Sal_Quantity")
VALUES
('SA002', '0001', 1);

INSERT INTO Sale_Line
("Sale_ID", "Product_SKU", "Sal_Quantity")
VALUES
('SA002', '0002', 2);

INSERT INTO Sale_Line
("Sale_ID", "Product_SKU", "Sal_Quantity")
VALUES
('SA002', '0003', 6);

SELECT * FROM Sale_Line;

UPDATE Sale_Line
SET "Sal_Quantity" = 3
WHERE "Sale_ID" = 'SA002' AND "Product_SKU" = '0003';

SELECT * FROM Sale_Line;

-- ---------------------------------------------------------------

SELECT "Product_Name", "Product_Sale_Price" - "Product_Purchase_Price" AS "Profit"
FROM Product;

SELECT *
FROM Customer NATURAL JOIN Sale NATURAL JOIN Sale_Line;

SELECT "Warehouse_ID", "Warehouse_City", "Warehouse_State", "Product_Name", "Inv_Quantity"
FROM (Warehouse W NATURAL JOIN Inventory I NATURAL JOIN Product P)
WHERE "Inv_Quantity" > 200 AND "Product_Name" = 'Macbook Air';

SELECT *
FROM Customer NATURAL JOIN Sale NATURAL JOIN Sale_Line WHERE "Product_SKU" IN (SELECT "Product_SKU" FROM Product WHERE "Product_Sale_Price" > 1150);

SELECT S."Shipment_ID", S."From_Warehouse_ID", S."To_Warehouse_ID", L."Product_SKU", L."Shipment_Quantity", S."Shipment_Date"
FROM Shipment S, Shipment_Line L WHERE S."Shipment_ID" = L."Shipment_ID";
