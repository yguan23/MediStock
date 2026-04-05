-- Medicines Table
CREATE TABLE IF NOT EXISTS Medicines (
 		MedicineID 		INT 			AUTO_INCREMENT PRIMARY KEY,
 		MedicineName  	VARCHAR(100)	NOT NULL DEFAULT '',
 		GenericName 	VARCHAR(100),
		CategoryID  	INT 			NOT NULL,
		BrandName		VARCHAR(100)	NOT NULL DEFAULT '',
		DosageForm		VARCHAR(100)	NOT NULL DEFAULT '',
		Strength		VARCHAR(100)	NOT NULL DEFAULT '',
 		SellingPrice 	DECIMAL(10,2) 	NOT NULL,
		ReorderLevel 	INT UNSIGNED	NOT NULL DEFAULT 0,
    
		CHECK (SellingPrice > 0),
    
		FOREIGN KEY (CategoryID) REFERENCES Categories(CategoryID)
);
-- Batches Table
CREATE TABLE IF NOT EXISTS Batches(
 		BatchID 			INT 			AUTO_INCREMENT PRIMARY KEY,
		MedicineID 			INT 			NOT NULL,
		SupplierID 			INT 			NOT NULL,
 		BatchNo  			VARCHAR(100)	NOT NULL DEFAULT '',
 		ManufactureDate		DATE			NOT NULL,
		ExpiryDate  		DATE			NOT NULL,
		UnitCost 			DECIMAL(10,2) 	NOT NULL,
		QuantityReceived 	INT UNSIGNED	NOT NULL DEFAULT 1,
    
		CHECK (ExpiryDate > ManufactureDate),
		CHECK (UnitCost > 0),
		CHECK (QuantityReceived > 0),
    
		FOREIGN KEY (MedicineID) REFERENCES Medicines(MedicineID),
		FOREIGN KEY (SupplierID) REFERENCES Suppliers(SupplierID)
);
-- Categories Table
CREATE TABLE IF NOT EXISTS Categories(
 		CategoryID 		INT 			AUTO_INCREMENT PRIMARY KEY,
		CategoryName	VARCHAR(100)	NOT NULL DEFAULT '',
);

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
