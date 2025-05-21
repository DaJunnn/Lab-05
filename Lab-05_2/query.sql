-- 查詢特定顧客的所有訂單（例如 C001）
SELECT
    oi.OrderID,
    p.Name AS ProductName,
    oi.Quantity,
    oi.UnitPrice
FROM OrderItem oi
JOIN Product p ON oi.ProductID = p.ProductID
WHERE oi.OrderID = 'O1001';
-- 查詢特定訂單的所有訂單項目及其商品名稱（例如 O1001）
SELECT
    oi.OrderID,
    p.Name AS ProductName,
    oi.Quantity,
    oi.UnitPrice
FROM OrderItem oi
JOIN Product p ON oi.ProductID = p.ProductID
WHERE oi.OrderID = 'O1001';
-- 計算每個產品的總銷售數量（所有訂單中被買幾次）
SELECT
    p.ProductID,
    p.Name AS ProductName,
    SUM(oi.Quantity) AS TotalSold
FROM OrderItem oi
JOIN Product p ON oi.ProductID = p.ProductID
GROUP BY p.ProductID, p.Name;

-- 找出購買總金額最高的前三位顧客
SELECT
    c.CustomerID,
    c.Name,
    SUM(o.TotalAmount) AS TotalSpent
FROM Customer c
JOIN OrderHeader o ON c.CustomerID = o.CustomerID
GROUP BY c.CustomerID, c.Name
ORDER BY TotalSpent DESC
LIMIT 3;
