-- 書籍資料表 Book
CREATE TABLE Book (
    ISBN VARCHAR(20) PRIMARY KEY,
    title VARCHAR(255) NOT NULL,
    publisher_name VARCHAR(100),
    publisher_address VARCHAR(255),
    publish_year INT,
    category VARCHAR(50)
);

-- 作者資料表 Author
CREATE TABLE Author (
    AuthorID VARCHAR(10) PRIMARY KEY,
    name VARCHAR(100) NOT NULL
);

-- 書籍與作者對應表 Book_Author
CREATE TABLE Book_Author (
    ISBN VARCHAR(20),
    AuthorID VARCHAR(10),
    PRIMARY KEY (ISBN, AuthorID),
    FOREIGN KEY (ISBN) REFERENCES Book(ISBN),
    FOREIGN KEY (AuthorID) REFERENCES Author(AuthorID)
);

-- 會員資料表 Member
CREATE TABLE Member (
    MemberID VARCHAR(10) PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    address VARCHAR(255),
    phone VARCHAR(20),
    email VARCHAR(100)
);

-- 借閱紀錄表 Borrow
CREATE TABLE Borrow (
    MemberID VARCHAR(10),
    ISBN VARCHAR(20),
    borrow_date DATE,
    due_date DATE,
    return_date DATE,
    PRIMARY KEY (MemberID, ISBN, borrow_date),
    FOREIGN KEY (MemberID) REFERENCES Member(MemberID),
    FOREIGN KEY (ISBN) REFERENCES Book(ISBN)
);

-- 書籍資料 Book
INSERT INTO Book (ISBN, title, publisher_name, publisher_address, publish_year, category)
VALUES 
('978-123456', '資料庫系統概論', '明日出版社', '台北市中山區', 2020, '教科書'),
('978-987654', 'Java 程式設計', '星星出版社', '高雄市鼓山區', 2022, '電腦書');

-- 作者 Author
INSERT INTO Author (AuthorID, name)
VALUES 
('A001', '王大明'),
('A002', '陳小綠');

-- 書籍與作者 Book_Author
INSERT INTO Book_Author (ISBN, AuthorID)
VALUES 
('978-123456', 'A001'),
('978-123456', 'A002'),
('978-987654', 'A002');

-- 會員 Member
INSERT INTO Member (MemberID, name, address, phone, email)
VALUES 
('M001', '張曉華', '台北市信義區', '0912345678', 'hsiao@gmail.com'),
('M002', '李宗翰', '桃園市中壢區', '0922123456', 'zonghan@yahoo.com.tw');

-- 借閱 Borrow
INSERT INTO Borrow (MemberID, ISBN, borrow_date, due_date, return_date)
VALUES 
('M001', '978-123456', '2025-04-01', '2025-04-15', '2025-04-12'),
('M002', '978-987654', '2025-04-03', '2025-04-17', NULL);

