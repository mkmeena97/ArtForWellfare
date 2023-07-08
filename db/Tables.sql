CREATE DATABASE artforwelfare;

USE artforwelfare;

CREATE TABLE Customer (
  CustomerID INT PRIMARY KEY,
  CustomerName VARCHAR(255),
  Password VARCHAR(255),
  Email VARCHAR(255),
  Address VARCHAR(255)
);

CREATE TABLE Artist (
  ArtistID INT PRIMARY KEY,
  Name VARCHAR(255),
  ContactNumber VARCHAR(255),
  Email VARCHAR(255),
  Address VARCHAR(255)
);

CREATE TABLE NGO (
  NGOID INT PRIMARY KEY,
  Name VARCHAR(255),
  ContactNumber VARCHAR(255),
  Email VARCHAR(255),
  Address VARCHAR(255)
);

CREATE TABLE ArtDetail (
  ArtID INT PRIMARY KEY,
  ArtistID INT,
  Title VARCHAR(255),
  Price DECIMAL(10, 2),
  Description VARCHAR(255),
  ImageURL VARCHAR(255),
  Availability BOOLEAN,
  FOREIGN KEY (ArtistID) REFERENCES Artist(ArtistID)
);

CREATE TABLE Event (
  EventID INT PRIMARY KEY,
  ArtistID INT,
  NGOID INT,
  Title VARCHAR(255),
  Description VARCHAR(255),
  StartDate DATE,
  EndDate DATE,
  FOREIGN KEY (ArtistID) REFERENCES Artist(ArtistID),
  FOREIGN KEY (NGOID) REFERENCES NGO(NGOID)
);

CREATE TABLE OrderTable (
  OrderID INT PRIMARY KEY,
  CustomerID INT,
  Total_Price DECIMAL(10, 2),
  Order_Date DATE,
  Order_Status VARCHAR(255),
  FOREIGN KEY (CustomerID) REFERENCES Customer(CustomerID)
);

CREATE TABLE OrderDetails (
  OrderDetailsID INT PRIMARY KEY,
  OrderID INT,
  ArtID INT,
  FOREIGN KEY (OrderID) REFERENCES OrderTable(OrderID),
  FOREIGN KEY (ArtID) REFERENCES ArtDetail(ArtID)
);

CREATE TABLE Cart (
  CartID INT PRIMARY KEY,
  CustomerID INT,
  FOREIGN KEY (CustomerID) REFERENCES Customer(CustomerID)
);

CREATE TABLE CartDetails (
  CartDetailsID INT PRIMARY KEY,
  CartID INT,
  ArtID INT,
  FOREIGN KEY (CartID) REFERENCES Cart(CartID),
  FOREIGN KEY (ArtID) REFERENCES ArtDetail(ArtID)
);

CREATE TABLE PaymentDetails (
  PaymentID INT PRIMARY KEY,
  PaymentMode VARCHAR(255),
  Date DATE,
  Status VARCHAR(255),
  OrderID INT,
  FOREIGN KEY (OrderID) REFERENCES OrderTable(OrderID)
);

CREATE TABLE Transaction (
  TransactionID INT PRIMARY KEY,
  PaymentID INT,
  CustomerID INT,
  From_Account_Number VARCHAR(255),
  From_IFSC_Code VARCHAR(255),
  To_Account_Number VARCHAR(255),
  To_IFSC_Code VARCHAR(255),
  TransactionDate DATE,
  ShippingAddress VARCHAR(255),
  FOREIGN KEY (PaymentID) REFERENCES PaymentDetails(PaymentID),
  FOREIGN KEY (CustomerID) REFERENCES Customer(CustomerID)
);