create table Departments (
    DepartmentID  varchar2(60) primary key,
    DepartmentName varchar2(60)
);

create table Students (
    StudentID varchar2(60) PRIMARY KEY,
    StudentName varchar2(60),
    PhoneNumber number(11),
    Mail varchar2(200),
    LevelNumber number,
    GPA float,
    AvailableHours number,
    CompletedHours number,
    DepartmentID varchar2(60) references Departments(DepartmentID)
);

create table Courses (
    CourseID varchar2(60) primary key,
    CourseName varchar2(255),
    DepartmentID varchar2(60) references Departments(DepartmentID),
    CreditHours number
);

create table Grades (
    StudentID varchar2(60),
    CourseID varchar2(60),
    CourseGrades float,
    primary key (StudentID, CourseID),
    
    foreign key (StudentID) references Students(StudentID),
    foreign key (CourseID) references Courses(CourseID)
);

create table OldCourses (
    StudentID varchar2(60),
    CourseID varchar2(60),
    CourseGrades float
);