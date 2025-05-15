CREATE TABLE [dbo].[Products] (
    [ProductID]     INT             IDENTITY (1, 1) NOT NULL,
    [ProductName]   NVARCHAR (255)  NOT NULL,
    [OriginalPrice] DECIMAL (10, 2) NOT NULL,  -- Fixed typo (OrignalPrice -> OriginalPrice)
    [RetailPrice]   DECIMAL (10, 2) NOT NULL,
    [StockQuantity] INT             NOT NULL,
    [ProductImage]  VARBINARY (MAX) NULL,
    [DateAdded]     DATETIME        DEFAULT GETDATE(),  -- Automatically stores the date when added
    PRIMARY KEY CLUSTERED ([ProductID] ASC)
);
INSERT INTO [dbo].[Products] (ProductName, OriginalPrice, RetailPrice, StockQuantity, ProductImage, DateAdded) 
VALUES 
('Ceramic Vase', 150.00, 200.00, 50, NULL, GETDATE()),
('Porcelain Cup Set', 300.00, 400.00, 30, NULL, GETDATE()),
('Decorative Plate', 120.00, 160.00, 40, NULL, GETDATE());
