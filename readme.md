# Lab-05 資料庫正規化整合文件

## Lab-05_1：圖書館資料庫設計

### 第一步：題目情境

 -設計一個圖書館管理系統，需追蹤書籍、會員與借閱記錄。

### 第二步：函數相依性分析

- ISBN → 書名、出版社名稱、出版社地址、出版年份、書籍類別

- AuthorID → 作者姓名

- ISBN + AuthorID → 關聯

- MemberID → 姓名、地址、電話、Email

- MemberID + ISBN + 借閱日期 → 應還日期、實際歸還日期

### 第三步：3NF（第三正規形式）

- Book（ISBN 為主鍵）

- Author（AuthorID 為主鍵）

- Book_Author（複合主鍵 ISBN + AuthorID）

- Member（MemberID 為主鍵）

- Borrow（複合主鍵 MemberID + ISBN + borrow_date）

### 第四步：資料表設計

Book(ISBN, title, publisher_name, publisher_address, publish_year, category)
Author(AuthorID, name)
Book_Author(ISBN, AuthorID)
Member(MemberID, name, address, phone, email)
Borrow(MemberID, ISBN, borrow_date, due_date, return_date)



## Lab-05_2：線上商店訂單系統

### 第一步：題目情境

- 設計一個線上商店資料庫系統，需管理顧客、產品與訂單。

### 第二步：函數相依性分析

- CustomerID → Name, Email, Phone, Address

- ProductID → Name, Description, UnitPrice, Stock, SupplierName, SupplierContact

- OrderID → CustomerID, OrderDate, TotalAmount

- OrderID + ProductID → Quantity, UnitPrice（訂購當下）

### 第三步：3NF（第三正規形式）

- Customer（CustomerID 為主鍵）

- Product（ProductID 為主鍵）

- OrderHeader（OrderID 為主鍵）

- OrderItem（複合主鍵 OrderID + ProductID）

### 第四步：資料表設計

Customer(CustomerID, Name, Email, Phone, Street, City, PostalCode, Country)
Product(ProductID, Name, Description, UnitPrice, Stock, SupplierName, SupplierContact)
OrderHeader(OrderID, CustomerID, OrderDate, TotalAmount)
OrderItem(OrderID, ProductID, Quantity, UnitPrice)

### 第五步：查詢語句範例

-- 1. 查特定顧客的所有訂單
SELECT o.OrderID, o.OrderDate, o.TotalAmount
FROM OrderHeader o
WHERE o.CustomerID = 'C001';

-- 2. 查特定訂單的所有項目與商品名稱
SELECT oi.OrderID, p.Name AS ProductName, oi.Quantity, oi.UnitPrice
FROM OrderItem oi
JOIN Product p ON oi.ProductID = p.ProductID
WHERE oi.OrderID = 'O1001';

-- 3. 查每個商品總銷售數
SELECT p.ProductID, p.Name AS ProductName, SUM(oi.Quantity) AS TotalSold
FROM OrderItem oi
JOIN Product p ON oi.ProductID = p.ProductID
GROUP BY p.ProductID, p.Name;

-- 4. 找出花最多錢的前三位顧客
SELECT c.CustomerID, c.Name, SUM(o.TotalAmount) AS TotalSpent
FROM Customer c
JOIN OrderHeader o ON c.CustomerID = o.CustomerID
GROUP BY c.CustomerID, c.Name
ORDER BY TotalSpent DESC
LIMIT 3;

## Lab-05_3：大學課程註冊系統

### 第一步：題目情境

設計一套大學學生課程與選課管理系統，需追蹤學生、講師、課程與成績。

### 第二步：函數相依性分析

學號 → 姓名、主修系所、系所辦公室

課程代碼 → 課名、學分、開課系所代碼、系所名

講師編號 → 姓名、系所代碼、系所名稱、辦公室

課程代碼 + 學期 + 講師編號 → 成績

學號 + 課程代碼 + 學期 + 講師編號 → 成績

第三步：BCNF（Boyce-Codd 正規形式）

Department（DeptID 為主鍵）

Student（StudentID 為主鍵）

Course（CourseID 為主鍵）

Instructor（InstructorID 為主鍵）

Section（CourseID + InstructorID + Semester 為主鍵）

Enrollment（StudentID + CourseID + InstructorID + Semester 為主鍵）

### 第四步：資料表設計

Department(DeptID, DeptName, OfficeLocation)
Student(StudentID, Name, MajorDeptID)
Course(CourseID, CourseName, Credits, DeptID)
Instructor(InstructorID, Name, DeptID, OfficeNumber)
Section(CourseID, InstructorID, Semester)
Enrollment(StudentID, CourseID, InstructorID, Semester, Grade)

### 第五步：設計結論

- 此設計使用 Section 與 Enrollment 拆解出複合對應表，消除所有非主鍵依賴與傳遞依賴，達成 BCNF。