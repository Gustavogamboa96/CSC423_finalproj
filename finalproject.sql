CREATE TABLE Tutor (
tutorID NUMBER GENERATED by default on null as IDENTITY,
tfname VARCHAR(50),
tlname VARCHAR(50),
tStreet VARCHAR(100),
tCity VARCHAR(100),
tZipcode VARCHAR(100),
tTelephone NUMBER(10),
noOfStudents NUMBER(10),
CONSTRAINT Tutor_pk PRIMARY KEY (tutorID)
);

CREATE TABLE Course(
courseID NUMBER GENERATED by default on null as IDENTITY,
courseTitle VARCHAR(100),
courseDuration NUMBER,
CONSTRAINT Course_pk PRIMARY KEY (courseID)
);

CREATE TABLE Offering(
courseID NUMBER,
tutorID NUMBER,
dayOffered VARCHAR(2) CHECK (dayOffered IN ('M', 'T', 'W', 'Th', 'F', 'S', 'Su')),
timeOfDay VARCHAR(20) CHECK (timeOfDay IN ('morning', 'evening')),
startMonth VARCHAR(3) CHECK (startMonth IN ('Jan', 'Feb', 'Mar', 'Apr', 'May','Jun', 'Jul', 'Aug', 'Sep', 'Oct', 'Nov', 'Dec')),
endMonth VARCHAR(3) CHECK (endMonth IN ('Jan', 'Feb', 'Mar', 'Apr', 'May','Jun', 'Jul', 'Aug', 'Sep', 'Oct', 'Nov', 'Dec')),
optionalWeek VARCHAR(3) CHECK (optionalWeek IN ('Y', 'N')),
CONSTRAINT Offering_pk PRIMARY KEY (courseID, tutorID, startMonth),
CONSTRAINT courseID_fk FOREIGN KEY (courseID) REFERENCES Course,
CONSTRAINT tutorID_fk FOREIGN KEY (tutorID) REFERENCES Tutor
);

CREATE TABLE Student(
studentID NUMBER GENERATED by default on null as IDENTITY,
courseID NUMBER,
enrolled VARCHAR(1) check (enrolled in ('Y', 'N')),
sfname VARCHAR(50),
slname VARCHAR(50),
sStreet VARCHAR(100),
sCity VARCHAR(100),
sZipcode VARCHAR(100),
sTelephone NUMBER(10),
CONSTRAINT Student_pk PRIMARY KEY (studentID),
CONSTRAINT courseID_st_fk FOREIGN KEY (courseID) REFERENCES Course
);

INSERT INTO Tutor (tfname, tlname, tStreet, tCity, tZipcode, tTelephone, noOfStudents) 
VALUES ('Maria', 'Fernandez', '88 sw 3rd st', 'miami', '33136', 7867787788, 25);

INSERT INTO Tutor (tfname, tlname, tStreet, tCity, tZipcode, tTelephone, noOfStudents) 
VALUES ('Joe', 'Perez', '108 sw 3rd st', 'miami', '33130', 7867788888, 20);

INSERT INTO Tutor (tfname, tlname, tStreet, tCity, tZipcode, tTelephone, noOfStudents) 
VALUES ('Marc', 'Lopez', '34 nw 7th ave', 'miami', '33130', 3057787728, 10);

INSERT INTO Tutor (tfname, tlname, tStreet, tCity, tZipcode, tTelephone, noOfStudents) 
VALUES ('Juan', 'Gutierrez', '200 main st', 'doral', '10136', 2837787788, 18);

INSERT INTO Tutor (tfname, tlname, tStreet, tCity, tZipcode, tTelephone, noOfStudents) 
VALUES ('Kira', 'Almeida', '202 S 34th st', 'kendall', '33132', 3054040088, 15);


INSERT INTO Course ( courseTitle, courseDuration) 
VALUES ('modern Art', 8);

INSERT INTO Course ( courseTitle, courseDuration) 
VALUES ('spanish', 10);

INSERT INTO Course ( courseTitle, courseDuration) 
VALUES ('business analytics', 12);

INSERT INTO Course ( courseTitle, courseDuration) 
VALUES ('sociology', 6);

INSERT INTO Course ( courseTitle, courseDuration) 
VALUES ('drawing', 2);




INSERT INTO Student (courseID, sfname, slname, sStreet, sCity, sZipcode, sTelephone)
VALUES (1, 'Jose', 'Martinez', '33 W 23 ave', 'miami', '33012', 3547465775); 

INSERT INTO Student (courseID, sfname, slname, sStreet, sCity, sZipcode, sTelephone)
VALUES (2, 'Pedro', 'Garcia', '44 SW 24 ave', 'miami', '33011', 3547343775); 

INSERT INTO Student (courseID, sfname, slname, sStreet, sCity, sZipcode, sTelephone)
VALUES (3, 'Joel', 'McKnight', '16 S 40 st', 'miami', '33142', 7865465765); 

INSERT INTO Student (courseID, sfname, slname, sStreet, sCity, sZipcode, sTelephone)
VALUES (4, 'Mario', 'Viel', '35 W 22 ave', 'miami', '33012',5432534335); 

INSERT INTO Student (courseID, sfname, slname, sStreet, sCity, sZipcode, sTelephone)
VALUES (5, 'James', 'Lotera', '32 N 3rd st', 'miami', '33112', 3544124375); 


INSERT INTO OFFERING (courseID, tutorID, dayOffered, timeOfDay, startMonth, endMonth, optionalWeek) 
VALUES(1, 5, 'M', 'morning', 'Feb', 'Apr', 'N');

INSERT INTO OFFERING (courseID, tutorID, dayOffered, timeOfDay, startMonth, endMonth, optionalWeek) 
VALUES(2, 6, 'W', 'evening', 'Feb', 'Apr', 'N');

INSERT INTO OFFERING (courseID, tutorID, dayOffered, timeOfDay, startMonth, endMonth, optionalWeek) 
VALUES(3, 7, 'T', 'evening', 'Feb', 'May', 'N');

INSERT INTO OFFERING (courseID, tutorID, dayOffered, timeOfDay, startMonth, endMonth, optionalWeek) 
VALUES(4, 8, 'F', 'morning', 'Feb', 'Mar', 'N');

INSERT INTO OFFERING (courseID, tutorID, dayOffered, timeOfDay, startMonth, endMonth, optionalWeek) 
VALUES(5, 9, 'S', 'morning', 'Feb', 'Feb', 'N');
