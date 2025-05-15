ALTER TABLE SalesTransactions  
ADD CONSTRAINT FK_SalesTransaction_Product  
FOREIGN KEY (ProductID) REFERENCES Products(ProductID)  
ON DELETE CASCADE;
