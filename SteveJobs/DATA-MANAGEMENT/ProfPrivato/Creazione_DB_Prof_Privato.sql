DROP DATABASE IF EXISTS prof_privato;
CREATE DATABASE prof_privato;

USE prof_privato;


CREATE TABLE Student
(
   StudentID INT NOT NULL AUTO_INCREMENT,
   FirstName VARCHAR(50) NOT NULL,
   LastName VARCHAR(50) NOT NULL,
   Address VARCHAR(100) NOT NULL,
   City VARCHAR(50) NOT NULL,
   PhoneNumber VARCHAR(20) NOT NULL,
   CONSTRAINT pkStudentID PRIMARY KEY (StudentID)
);
CREATE INDEX idxStudent ON Student(StudentID);


CREATE TABLE Category
(
   CategoryID INT NOT NULL AUTO_INCREMENT,
   CategoryStudent VARCHAR(50) NOT NULL,
   Price DECIMAL(10,2) NOT NULL,
   CONSTRAINT pkCategoryID PRIMARY KEY (CategoryID),
   CONSTRAINT ukCategoryStudent UNIQUE (CategoryStudent)
);
CREATE INDEX idxCategory ON Category(CategoryID);


CREATE TABLE Subject
(
   SubjectID INT NOT NULL AUTO_INCREMENT,
   SubjectName VARCHAR(50) NOT NULL,
   CONSTRAINT pkSubjectID PRIMARY KEY (SubjectID),
   CONSTRAINT ukSubjectName UNIQUE (SubjectName)
);
CREATE INDEX idxSubject ON Subject(SubjectID);


CREATE TABLE Payment (
   PaymentID INT NOT NULL AUTO_INCREMENT,
   StudentID INT NOT NULL, 
   Amount DECIMAL(10,2) NOT NULL,
   PaymentMethod VARCHAR(30) NOT NULL,
   PaymentDate DATE NOT NULL,
   CONSTRAINT pkPaymentID PRIMARY KEY (PaymentID),
   CONSTRAINT fkPaymentStudentID FOREIGN KEY (StudentID) REFERENCES Student(StudentID)
);
CREATE INDEX idxPayment ON Payment(PaymentID);
CREATE INDEX idxPaymentStudent ON Payment(StudentID);


CREATE TABLE Lesson
(
   LessonID INT NOT NULL AUTO_INCREMENT,
   StudentID INT NOT NULL,
   SubjectID INT NOT NULL,
   PaymentID INT,
   CategoryID INT NOT NULL,
   StartDate DATE NOT NULL,
   StartTime TIME NOT NULL,
   LessonType VARCHAR(30) NOT NULL,
   CONSTRAINT pkLessonID PRIMARY KEY (LessonID),
   CONSTRAINT fkLessonStudentID FOREIGN KEY (StudentID) REFERENCES Student(StudentID),
   CONSTRAINT fkLessonSubjectID FOREIGN KEY (SubjectID) REFERENCES Subject(SubjectID),
   CONSTRAINT fkLessonPaymentID FOREIGN KEY (PaymentID) REFERENCES Payment(PaymentID),
   CONSTRAINT fkLessonCategoryID FOREIGN KEY (CategoryID) REFERENCES Category(CategoryID),
   CONSTRAINT chkStartTime CHECK (StartTime IN ('15:00:00', '16:30:00', '18:00:00'))
);
CREATE INDEX idxLesson ON Lesson(LessonID);
CREATE INDEX idxLessonStudent ON Lesson(StudentID);
CREATE INDEX idxLessonSubject ON Lesson(SubjectID);
CREATE INDEX idxLessonPayment ON Lesson(PaymentID);
CREATE INDEX idxLessonCategory ON Lesson(CategoryID);