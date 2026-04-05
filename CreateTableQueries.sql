-- Queries to create tables for Supplier, Purchases and Purchase details.

CREATE TABLE IF NOT EXISTS Suppliers (
    SupplierID           INT AUTO_INCREMENT PRIMARY KEY,
    SupplierName         VARCHAR(100) NOT NULL DEFAULT '',
    Phone                VARCHAR(20)  NOT NULL DEFAULT '',
    Email                VARCHAR(100) NOT NULL UNIQUE,
    Address              VARCHAR(255) NOT NULL DEFAULT '',
    ContactPersonName    VARCHAR(100) NOT NULL DEFAULT ''
);

CREATE TABLE IF NOT EXISTS Purchases (
    PurchaseID       INT AUTO_INCREMENT PRIMARY KEY,
    SupplierID       INT NOT NULL,
    PurchaseDate     DATE NOT NULL,
    TotalAmount      DECIMAL(10,2) NOT NULL,
    PharmacyID       INT NOT NULL,
    UserID           INT NOT NULL,

    CHECK (TotalAmount > 0),

    FOREIGN KEY (SupplierID) REFERENCES Suppliers(SupplierID),
    FOREIGN KEY (PharmacyID) REFERENCES Pharmacies(PharmacyID),
    FOREIGN KEY (UserID) REFERENCES Users(UserID)
);

CREATE TABLE IF NOT EXISTS Purchase_Details (
    PurchaseDetailID   INT AUTO_INCREMENT PRIMARY KEY,
    PurchaseID         INT NOT NULL,
    BatchID            INT NOT NULL,
    Quantity           INT UNSIGNED NOT NULL,
    UnitCost           DECIMAL(10,2) NOT NULL,

    CHECK (Quantity > 0),
    CHECK (UnitCost > 0),

    FOREIGN KEY (PurchaseID) REFERENCES Purchases(PurchaseID),
    FOREIGN KEY (BatchID) REFERENCES Batches(BatchID)
);