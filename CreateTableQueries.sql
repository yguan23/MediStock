-- Queries to create tables for Supplier, Purchases and Purchase details.

CREATE TABLE Supplier (
    SupplierID INT PRIMARY KEY AUTO_INCREMENT,
    Name VARCHAR(255) NOT NULL,
    ContactInfo VARCHAR(255)
);

CREATE TABLE Purchases (
    PurchaseID INT PRIMARY KEY AUTO_INCREMENT,
    SupplierID INT,
    PurchaseDate DATE,
    TotalAmount DECIMAL(10, 2),
    FOREIGN KEY (SupplierID) REFERENCES Supplier(SupplierID)
);

CREATE TABLE PurchaseDetails (
    PurchaseDetailID INT PRIMARY KEY AUTO_INCREMENT,
    PurchaseID INT,
    ProductID INT,
    Quantity INT,
    UnitPrice DECIMAL(10, 2),
    FOREIGN KEY (PurchaseID) REFERENCES Purchases(PurchaseID)
);