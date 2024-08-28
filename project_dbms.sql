drop database library_demo;
CREATE DATABASE library_demo;

USE library_demo;

CREATE TABLE readers (
    reader_id VARCHAR(15),
    fname VARCHAR(50),
    mname VARCHAR(50),
    ltname VARCHAR(50),
    city VARCHAR(30),
    mobilenum VARCHAR(20),
    occupation VARCHAR(30), 
    dob DATE,
    CONSTRAINT readers_pk PRIMARY KEY(reader_id)
);
INSERT INTO readers VALUES
('c0001','Ramesh','chandra','sharma','Delhi','9849421127','service','1976-12-08'),
('c0006','Amit','kumar','verma','Hyderabad','9849421132','doctor','1979-09-18'),
('c0007','Deepa','singh','','Pune','9849421133','software','1992-02-28'),
('c0008','Rajesh','sharma','','Ahmedabad','9849421134','business','1980-07-05'),
('c0024','Nitish','Kumar','','Bhopal','9482921135','Orange vendor','1986-04-23'),
('c0025','Nisha','sharma','','Guwahati','9849421151','chef','1983-10-07');

CREATE TABLE book (
    bid VARCHAR(15),
    bname VARCHAR(50),
    bdomin VARCHAR(50),
    CONSTRAINT book_bid_pk PRIMARY KEY(bid)
);

INSERT INTO book VALUES
('B00001','DO EPIC SHIT','SELF-HELPING'),
('B00002','The Great Gatsby','Fiction'),
('B00003','To Kill a Mockingbird','Classic'),
('B00004','Harry Potter and the Philosopher\'s Stone','Fantasy'),
('B00005','1984','Dystopian'),
('B00006','Pride and Prejudice','Romance'),
('B00007','The Catcher in the Rye','Coming-of-age'),
('B00008','The Hobbit','Adventure'),
('B00009','The Da Vinci Code','Thriller'),
('B00010','The Alchemist','Philosophical fiction');

CREATE TABLE active_readers (
    account_id VARCHAR(15),
    reader_id VARCHAR(15),
    bid VARCHAR(15),
    atype VARCHAR(20),
    astatus VARCHAR(20),
    CONSTRAINT activereaders_acnumber_pk PRIMARY KEY(account_id),
    CONSTRAINT account_readerid_fk FOREIGN KEY(reader_id) REFERENCES readers(reader_id),
    CONSTRAINT account_bid_fk FOREIGN KEY(bid) REFERENCES book(bid)
);

INSERT INTO active_readers(account_id, reader_id, bid, atype, astatus) VALUES
('A00001', 'c0001', 'B00001', 'Borrowed', 'Active'),
('A00002', 'c0006', 'B00002', 'Borrowed', 'Active'),
('A00003', 'c0008', 'B00003', 'Reserved', 'Active'),
('A00004', 'c0007', 'B00004', 'Borrowed', 'Active'),
('A00005', 'c0024', 'B00005', 'Reserved', 'Active'),
('A00006', 'c0024', 'B00006', 'Borrowed', 'Active'),
('A00007', 'c0001', 'B00007', 'Borrowed', 'Active'),
('A00008', 'c0007', 'B00008', 'Reserved', 'Active'),
('A00009', 'c0008', 'B00009', 'Borrowed', 'Active'),
('A00010', 'c0025', 'B00010', 'Borrowed', 'Active');

CREATE TABLE bookissue_details (
    issuenumber VARCHAR(6),
    account_id VARCHAR(6),
    bid VARCHAR(20),
    bookname VARCHAR(50),
    numbers_of_book_issued INT(7),
    CONSTRAINT trandetails_tnumber_pk PRIMARY KEY(issuenumber),
    CONSTRAINT trandetails_acnumber_fk FOREIGN KEY(account_id) REFERENCES active_readers(account_id)
);

INSERT INTO bookissue_details VALUES
('I00001', 'A00001', 'B00001', 'DO EPIC SHIT', 1),
('I00002', 'A00002', 'B00002', 'The Great Gatsby', 1),
('I00003', 'A00004', 'B00004', 'Harry Potter and the Philosopher\'s Stone', 1),
('I00004', 'A00006', 'B00006', 'Pride and Prejudice', 1),
('I00005', 'A00007', 'B00007', 'The Catcher in the Rye', 1),
('I00006', 'A00009', 'B00009', 'The Da Vinci Code', 1),
('I00007', 'A00010', 'B00010', 'The Alchemist', 1);

SELECT * FROM active_readers;
SELECT * FROM bookissue_details;
