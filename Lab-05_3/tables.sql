-- 系所表 Department
CREATE TABLE Department (
    DeptID VARCHAR(10) PRIMARY KEY,
    DeptName VARCHAR(100),
    OfficeLocation VARCHAR(100)
);

-- 學生表 Student
CREATE TABLE Student (
    StudentID VARCHAR(10) PRIMARY KEY,
    Name VARCHAR(100),
    MajorDeptID VARCHAR(10),
    FOREIGN KEY (MajorDeptID) REFERENCES Department(DeptID)
);

-- 課程表 Course
CREATE TABLE Course (
    CourseID VARCHAR(10) PRIMARY KEY,
    CourseName VARCHAR(100),
    Credits INT,
    DeptID VARCHAR(10),
    FOREIGN KEY (DeptID) REFERENCES Department(DeptID)
);

-- 講師表 Instructor
CREATE TABLE Instructor (
    InstructorID VARCHAR(10) PRIMARY KEY,
    Name VARCHAR(100),
    DeptID VARCHAR(10),
    OfficeNumber VARCHAR(20),
    FOREIGN KEY (DeptID) REFERENCES Department(DeptID)
);

-- 課程開課表 Section（課程 + 講師 + 學期）
CREATE TABLE Section (
    CourseID VARCHAR(10),
    InstructorID VARCHAR(10),
    Semester VARCHAR(10),
    PRIMARY KEY (CourseID, InstructorID, Semester),
    FOREIGN KEY (CourseID) REFERENCES Course(CourseID),
    FOREIGN KEY (InstructorID) REFERENCES Instructor(InstructorID)
);

-- 修課紀錄表 Enrollment
CREATE TABLE Enrollment (
    StudentID VARCHAR(10),
    CourseID VARCHAR(10),
    InstructorID VARCHAR(10),
    Semester VARCHAR(10),
    Grade VARCHAR(5),
    PRIMARY KEY (StudentID, CourseID, InstructorID, Semester),
    FOREIGN KEY (StudentID) REFERENCES Student(StudentID),
    FOREIGN KEY (CourseID, InstructorID, Semester) REFERENCES Section(CourseID, InstructorID, Semester)
);
