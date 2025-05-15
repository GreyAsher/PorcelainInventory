CREATE TABLE Suppliers (
    SupplierID INT PRIMARY KEY IDENTITY(1,1),
    Name NVARCHAR(255) NOT NULL,
    ContactNumber NVARCHAR(50) NOT NULL,
    Address NVARCHAR(500) NOT NULL
);

INSERT INTO Suppliers (Name, ContactNumber, Address) VALUES
('Elite Porcelain Co.', '123-456-7890', '123 Ceramic St, Pottery City'),
('Royal Clayworks', '987-654-3210', '456 Artisan Ave, Claytown'),
('Vintage Potters', '555-123-6789', '789 Handmade Rd, Oldtown'),
('Elegant Ceramics', '333-444-5555', '321 Luxury Ln, Glazeville'),
('Artisan Kilns', '777-888-9999', '654 Firebrick Blvd, Craftsville');