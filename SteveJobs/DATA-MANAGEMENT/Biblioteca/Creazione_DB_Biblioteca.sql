DROP DATABASE IF EXISTS LibraryDB;
CREATE DATABASE LibraryDB;

USE LibraryDB;

-- Tabelle senza Foreign Key 

CREATE TABLE User
(
    UserID INT NOT NULL AUTO_INCREMENT,
    FirstName VARCHAR(50) NOT NULL,
    LastName VARCHAR(50) NOT NULL,
    Email VARCHAR(100),
    Address VARCHAR(100),
    Phone VARCHAR(20),
    IsDeleted BOOLEAN DEFAULT 0,
    CONSTRAINT pkUserID PRIMARY KEY (UserID)
);
CREATE INDEX idxUser ON User(UserID);


CREATE TABLE Category
(
    CategoryID INT NOT NULL AUTO_INCREMENT,
    Name VARCHAR(50) NOT NULL,
    CreationDate DATE NOT NULL,
    UpdationDate DATE,
    CONSTRAINT pkCategoryID PRIMARY KEY (CategoryID)
);
CREATE INDEX idxCategory ON Category(CategoryID);


CREATE TABLE Supplier
(
    SupplierID INT NOT NULL AUTO_INCREMENT,
    Name VARCHAR(100) NOT NULL,
    Address VARCHAR(100),
    Phone VARCHAR(20),
    IsDeleted BOOLEAN DEFAULT 0,
    CONSTRAINT pkSupplierID PRIMARY KEY (SupplierID)
);
CREATE INDEX idxSupplier ON Supplier(SupplierID);


CREATE TABLE Author
(
    AuthorID INT NOT NULL AUTO_INCREMENT,
    FirstName VARCHAR(50) NOT NULL,
    LastName VARCHAR(50) NOT NULL,
    Birth DATE,
    Bio VARCHAR(500),
    IsDeleted BOOLEAN DEFAULT 0,
    CONSTRAINT pkAuthorID PRIMARY KEY (AuthorID)
);
CREATE INDEX idxAuthor ON Author(AuthorID);


CREATE TABLE Book
(
    BookID INT NOT NULL AUTO_INCREMENT,
    Title VARCHAR(200) NOT NULL,
    Description VARCHAR(500),
    PublicationYear DATE,
    Language VARCHAR(30),
    Summary VARCHAR(1000),
    IsAvailable BOOLEAN DEFAULT 1,
    IsDeleted BOOLEAN DEFAULT 0,
    CONSTRAINT pkBookID PRIMARY KEY (BookID)
);
CREATE INDEX idxBook ON Book(BookID);


-- Tabelle con una Foreign Key

CREATE TABLE Employee
(
    EmployeeID INT NOT NULL AUTO_INCREMENT,
    UserID INT NOT NULL,
    Birth DATE,
    TypeOfContract VARCHAR(50),
    StartDate DATE NOT NULL,
    TerminationDate DATE,
    WorkHour INT,
    ExtraHour INT,
    IsDeleted BOOLEAN DEFAULT 0,
    CONSTRAINT pkEmployeeID PRIMARY KEY (EmployeeID),
    CONSTRAINT fkEmployeeUserID FOREIGN KEY (UserID) REFERENCES User(UserID)
);
CREATE INDEX idxEmployee ON Employee(EmployeeID);


CREATE TABLE Customer
(
    CustomerID INT NOT NULL AUTO_INCREMENT,
    UserID INT NOT NULL,
    IsDeleted BOOLEAN DEFAULT 0,
    CONSTRAINT pkCustomerID PRIMARY KEY (CustomerID),
    CONSTRAINT fkCustomerUserID FOREIGN KEY (UserID) REFERENCES User(UserID)
);
CREATE INDEX idxCustomer ON Customer(CustomerID);


CREATE TABLE Review
(
    ReviewID INT NOT NULL AUTO_INCREMENT,
    CustomerID INT NOT NULL,
    Rating INT,
    Message VARCHAR(500),
    CreationDate DATE NOT NULL,
    UpdationDate DATE,
    IsDeleted BOOLEAN DEFAULT 0,
    CONSTRAINT pkReviewID PRIMARY KEY (ReviewID),
    CONSTRAINT fkReviewCustomerID FOREIGN KEY (CustomerID) REFERENCES Customer(CustomerID)
);
CREATE INDEX idxReview ON Review(ReviewID);


-- Tabelle con più Foreign Key

CREATE TABLE BookInfo
(
    BookInfoID INT NOT NULL AUTO_INCREMENT,
    BookID INT NOT NULL,
    SupplierID INT NOT NULL,
    AuthorID INT NOT NULL,
    ReviewID INT,
    CategoryID INT NOT NULL,
    Copy INT DEFAULT 1,
    CONSTRAINT pkBookInfoID PRIMARY KEY (BookInfoID),
    CONSTRAINT fkBookInfoBookID FOREIGN KEY (BookID) REFERENCES Book(BookID),
    CONSTRAINT fkBookInfoSupplierID FOREIGN KEY (SupplierID) REFERENCES Supplier(SupplierID),
    CONSTRAINT fkBookInfoAuthorID FOREIGN KEY (AuthorID) REFERENCES Author(AuthorID),
    CONSTRAINT fkBookInfoReviewID FOREIGN KEY (ReviewID) REFERENCES Review(ReviewID),
    CONSTRAINT fkBookInfoCategoryID FOREIGN KEY (CategoryID) REFERENCES Category(CategoryID)
);
CREATE INDEX idxBookInfo ON BookInfo(BookInfoID);


CREATE TABLE RentalDetail
(
    RentalDetailID INT NOT NULL AUTO_INCREMENT,
    EmployeeID INT NOT NULL,
    CustomerID INT NOT NULL,
    BookInfoID INT NOT NULL,
    CONSTRAINT pkRentalDetailID PRIMARY KEY (RentalDetailID),
    CONSTRAINT fkRentalDetailEmployeeID FOREIGN KEY (EmployeeID) REFERENCES Employee(EmployeeID),
    CONSTRAINT fkRentalDetailCustomerID FOREIGN KEY (CustomerID) REFERENCES Customer(CustomerID),
    CONSTRAINT fkRentalDetailBookInfoID FOREIGN KEY (BookInfoID) REFERENCES BookInfo(BookInfoID)
);
CREATE INDEX idxRentalDetail ON RentalDetail(RentalDetailID);


CREATE TABLE Rental
(
    RentalID INT NOT NULL AUTO_INCREMENT,
    EmployeeID INT NOT NULL,
    CustomerID INT NOT NULL,
    RentalDetailID INT NOT NULL,
    StartDate DATE NOT NULL,
    TerminationDate DATE,
    CONSTRAINT pkRentalID PRIMARY KEY (RentalID),
    CONSTRAINT fkRentalEmployeeID FOREIGN KEY (EmployeeID) REFERENCES Employee(EmployeeID),
    CONSTRAINT fkRentalCustomerID FOREIGN KEY (CustomerID) REFERENCES Customer(CustomerID),
    CONSTRAINT fkRentalRentalDetailID FOREIGN KEY (RentalDetailID) REFERENCES RentalDetail(RentalDetailID)
);
CREATE INDEX idxRental ON Rental(RentalID);