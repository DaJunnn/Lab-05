-- 顧客資料表 Customer
CREATE TABLE Customer (
    CustomerID VARCHAR(10) PRIMARY KEY,
    Name VARCHAR(100) NOT NULL,
    Email VARCHAR(100),
    Phone VARCHAR(20),
    Street VARCHAR(100),
    City VARCHAR(50),
    PostalCode VARCHAR(20),
    Country VARCHAR(50)
);

-- 商品資料表 Product
CREATE TABLE Product (
    ProductID VARCHAR(10) PRIMARY KEY,
    Name VARCHAR(100) NOT NULL,
    Description TEXT,
    UnitPrice DECIMAL(10,2),
    Stock INT,
    SupplierName VARCHAR(100),
    SupplierContact VARCHAR(100)
);

-- 訂單主表 OrderHeader
CREATE TABLE OrderHeader (
    OrderID VARCHAR(10) PRIMARY KEY,
    CustomerID VARCHAR(10),
    OrderDate DATE,
    TotalAmount DECIMAL(10,2),
    FOREIGN KEY (CustomerID) REFERENCES Customer(CustomerID)
);

-- 訂單明細表 OrderItem
CREATE TABLE OrderItem (
    OrderID VARCHAR(10),
    ProductID VARCHAR(10),
    Quantity INT,
    UnitPrice DECIMAL(10,2),
    PRIMARY KEY (OrderID, ProductID),
    FOREIGN KEY (OrderID) REFERENCES OrderHeader(OrderID),
    FOREIGN KEY (ProductID) REFERENCES Product(ProductID)
);


-- 顧客資料 Customer
INSERT INTO Customer (CustomerID, Name, Email, Phone, Street, City, PostalCode, Country)
VALUES
('C001', '王小明', 'ming@gmail.com', '0912345678', '中山路100號', '台北市', '100', '台灣'),
('C002', '李小美', 'mei@yahoo.com.tw', '0922333444', '忠孝東路200號', '新北市', '220', '台灣');

-- 商品資料 Product
INSERT INTO Product (ProductID, Name, Description, UnitPrice, Stock, SupplierName, SupplierContact)
VALUES
('P001', '無線滑鼠', '2.4G 無線光學滑鼠', 450.00, 100, '捷科技有限公司', '02-12345678'),
('P002', '鍵盤', '機械式鍵盤青軸', 1200.00, 50, '數位星球股份有限公司', '02-87654321'),
('P003', '耳機', '降噪藍牙耳機', 980.00, 70, '音感企業社', '03-33445566');

-- 訂單主表 OrderHeader
INSERT INTO OrderHeader (OrderID, CustomerID, OrderDate, TotalAmount)
VALUES
('O1001', 'C001', '2025-05-01', 1650.00),
('O1002', 'C002', '2025-05-02', 980.00);

-- 訂單明細表 OrderItem
INSERT INTO OrderItem (OrderID, ProductID, Quantity, UnitPrice)
VALUES
('O1001', 'P001', 1, 450.00),
('O1001', 'P002', 1, 1200.00),
('O1002', 'P003', 1, 980.00);

