
-- DATABASE SCHEMA - Sistema Gestionale Corsi
-- VERSIONE AGGIORNATA con Enrollment e BirthDate
-- Ordine di creazione: tabelle senza FK prima, poi quelle con FK

-- DROP delle tabelle in ordine inverso (per ricreazione pulita)
DROP TABLE IF EXISTS Vote;
DROP TABLE IF EXISTS Module;
DROP TABLE IF EXISTS Enrollment;
DROP TABLE IF EXISTS FormativeUnit;
DROP TABLE IF EXISTS Course;
DROP TABLE IF EXISTS Teacher;
DROP TABLE IF EXISTS Tutor;
DROP TABLE IF EXISTS Student;
DROP TABLE IF EXISTS Location;
DROP TABLE IF EXISTS UserInfo;
DROP TABLE IF EXISTS City;
DROP TABLE IF EXISTS Province;
DROP TABLE IF EXISTS ModuleState;

-- TABELLE SENZA FK (Base)

-- Tabella Province
CREATE TABLE Province (
    ProvinceID INT NOT NULL AUTO_INCREMENT,
    ProvinceName VARCHAR(100) NOT NULL,
    IsDeleted BOOLEAN NOT NULL DEFAULT FALSE,
    PRIMARY KEY (ProvinceID)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Tabella City (con FK a Province)
CREATE TABLE City (
    CityID INT NOT NULL AUTO_INCREMENT,
    ProvinceID INT NOT NULL,
    CityName VARCHAR(100) NOT NULL,
    IsDeleted BOOLEAN NOT NULL DEFAULT FALSE,
    PRIMARY KEY (CityID),
    FOREIGN KEY (ProvinceID) REFERENCES Province(ProvinceID) ON DELETE RESTRICT ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Tabella ModuleState
CREATE TABLE ModuleState (
    ModuleStateID INT NOT NULL AUTO_INCREMENT,
    State VARCHAR(50) NOT NULL,
    IsDeleted BOOLEAN NOT NULL DEFAULT FALSE,
    PRIMARY KEY (ModuleStateID)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Tabella FormativeUnit (materie)
CREATE TABLE FormativeUnit (
    FormativeUnitID INT NOT NULL AUTO_INCREMENT,
    UnitName VARCHAR(150) NOT NULL,
    TotalHour INT NOT NULL,
    RemainderHour INT NOT NULL,
    IsDeleted BOOLEAN NOT NULL DEFAULT FALSE,
    PRIMARY KEY (FormativeUnitID)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- TABELLE CON FK di PRIMO LIVELLO

-- Tabella UserInfo (dipende da City) - AGGIORNATA con BirthDate
CREATE TABLE UserInfo (
    UserInfoID INT NOT NULL AUTO_INCREMENT,
    CityID INT NOT NULL,
    FirstName VARCHAR(100) NOT NULL,
    LastName VARCHAR(100) NOT NULL,
    BirthDate DATE NOT NULL,
    Email VARCHAR(255) NOT NULL,
    PhoneNumber VARCHAR(20),
    Password VARCHAR(255) NOT NULL,
    IsDeleted BOOLEAN NOT NULL DEFAULT FALSE,
    PRIMARY KEY (UserInfoID),
    UNIQUE KEY unique_email (Email),
    FOREIGN KEY (CityID) REFERENCES City(CityID) ON DELETE RESTRICT ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Tabella Location (dipende da City)
CREATE TABLE Location (
    LocationID INT NOT NULL AUTO_INCREMENT,
    CityID INT NOT NULL,
    LocationName VARCHAR(150) NOT NULL,
    PostCode VARCHAR(10) NOT NULL,
    Street VARCHAR(200) NOT NULL,
    PhoneNumber VARCHAR(20),
    CreatedAt DATE NOT NULL,
    UpdatedAt DATE NOT NULL,
    IsDeleted BOOLEAN NOT NULL DEFAULT FALSE,
    PRIMARY KEY (LocationID),
    FOREIGN KEY (CityID) REFERENCES City(CityID) ON DELETE RESTRICT ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- TABELLE CON FK di SECONDO LIVELLO

-- Tabella Student (dipende da UserInfo)
CREATE TABLE Student (
    StudentID INT NOT NULL AUTO_INCREMENT,
    UserInfoID INT NOT NULL,
    IsDeleted BOOLEAN NOT NULL DEFAULT FALSE,
    PRIMARY KEY (StudentID),
    UNIQUE KEY unique_userinfo_student (UserInfoID),
    FOREIGN KEY (UserInfoID) REFERENCES UserInfo(UserInfoID) ON DELETE RESTRICT ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Tabella Tutor (dipende da UserInfo)
CREATE TABLE Tutor (
    TutorID INT NOT NULL AUTO_INCREMENT,
    UserInfoID INT NOT NULL,
    IsDeleted BOOLEAN NOT NULL DEFAULT FALSE,
    PRIMARY KEY (TutorID),
    UNIQUE KEY unique_userinfo_tutor (UserInfoID),
    FOREIGN KEY (UserInfoID) REFERENCES UserInfo(UserInfoID) ON DELETE RESTRICT ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Tabella Teacher (dipende da UserInfo)
CREATE TABLE Teacher (
    TeacherID INT NOT NULL AUTO_INCREMENT,
    UserInfoID INT NOT NULL,
    IsDeleted BOOLEAN NOT NULL DEFAULT FALSE,
    PRIMARY KEY (TeacherID),
    UNIQUE KEY unique_userinfo_teacher (UserInfoID),
    FOREIGN KEY (UserInfoID) REFERENCES UserInfo(UserInfoID) ON DELETE RESTRICT ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- TABELLE CON FK di TERZO LIVELLO

-- Tabella Course (dipende da Tutor e Location)
CREATE TABLE Course (
    CourseID INT NOT NULL AUTO_INCREMENT,
    TutorID INT NOT NULL,
    LocationID INT NOT NULL,
    TotalHour INT NOT NULL,
    SchoolYear VARCHAR(9) NOT NULL,
    CreatedAt DATE NOT NULL,
    UpdatedAt DATE NOT NULL,
    IsDeleted BOOLEAN NOT NULL DEFAULT FALSE,
    PRIMARY KEY (CourseID),
    FOREIGN KEY (TutorID) REFERENCES Tutor(TutorID) ON DELETE RESTRICT ON UPDATE CASCADE,
    FOREIGN KEY (LocationID) REFERENCES Location(LocationID) ON DELETE RESTRICT ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- TABELLE CON FK di QUARTO LIVELLO

-- Tabella Enrollment (dipende da Student e Course)
CREATE TABLE Enrollment (
    EnrollmentID INT NOT NULL AUTO_INCREMENT,
    StudentID INT NOT NULL,
    CourseID INT NOT NULL,
    EnrollmentDate DATE NOT NULL,
    CompletionDate DATE,
    IsDeleted BOOLEAN NOT NULL DEFAULT FALSE,
    PRIMARY KEY (EnrollmentID),
    FOREIGN KEY (StudentID) REFERENCES Student(StudentID) ON DELETE RESTRICT ON UPDATE CASCADE,
    FOREIGN KEY (CourseID) REFERENCES Course(CourseID) ON DELETE RESTRICT ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Tabella Module (dipende da Teacher, FormativeUnit, ModuleState, Course)
CREATE TABLE Module (
    ModuleID INT NOT NULL AUTO_INCREMENT,
    TeacherID INT NOT NULL,
    FormativeUnitID INT NOT NULL,
    ModuleStateID INT NOT NULL,
    CourseID INT NOT NULL,
    ModuleName VARCHAR(150) NOT NULL,
    StartDate DATE NOT NULL,
    EndDate DATE,
    IsDeleted BOOLEAN NOT NULL DEFAULT FALSE,
    PRIMARY KEY (ModuleID),
    FOREIGN KEY (TeacherID) REFERENCES Teacher(TeacherID) ON DELETE RESTRICT ON UPDATE CASCADE,
    FOREIGN KEY (FormativeUnitID) REFERENCES FormativeUnit(FormativeUnitID) ON DELETE RESTRICT ON UPDATE CASCADE,
    FOREIGN KEY (ModuleStateID) REFERENCES ModuleState(ModuleStateID) ON DELETE RESTRICT ON UPDATE CASCADE,
    FOREIGN KEY (CourseID) REFERENCES Course(CourseID) ON DELETE RESTRICT ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- TABELLE CON FK di QUINTO LIVELLO

-- Tabella Vote (dipende da Student e Module)
CREATE TABLE Vote (
    VoteID INT NOT NULL AUTO_INCREMENT,
    StudentID INT NOT NULL,
    ModuleID INT NOT NULL,
    FirstVote INT,
    SecondVote INT,
    FinalVote INT,
    IsDeleted BOOLEAN NOT NULL DEFAULT FALSE,
    PRIMARY KEY (VoteID),
    FOREIGN KEY (StudentID) REFERENCES Student(StudentID) ON DELETE RESTRICT ON UPDATE CASCADE,
    FOREIGN KEY (ModuleID) REFERENCES Module(ModuleID) ON DELETE RESTRICT ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- INDICI per ottimizzare le query

CREATE INDEX idx_city_province ON City(ProvinceID);
CREATE INDEX idx_userinfo_city ON UserInfo(CityID);
CREATE INDEX idx_location_city ON Location(CityID);
CREATE INDEX idx_course_tutor ON Course(TutorID);
CREATE INDEX idx_course_location ON Course(LocationID);
CREATE INDEX idx_enrollment_student ON Enrollment(StudentID);
CREATE INDEX idx_enrollment_course ON Enrollment(CourseID);
CREATE INDEX idx_module_teacher ON Module(TeacherID);
CREATE INDEX idx_module_course ON Module(CourseID);
CREATE INDEX idx_module_formativeunit ON Module(FormativeUnitID);
CREATE INDEX idx_vote_student ON Vote(StudentID);
CREATE INDEX idx_vote_module ON Vote(ModuleID);
