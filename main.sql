

-- Step 1: Create database
DROP DATABASE IF EXISTS library_db;
CREATE DATABASE library_db;
USE library_db;

-- Step 2: Create tables
CREATE TABLE Books (
    book_id INT PRIMARY KEY AUTO_INCREMENT,
    title VARCHAR(150) NOT NULL,
    author VARCHAR(100),
    genre VARCHAR(50),
    available_copies INT NOT NULL CHECK (available_copies >= 0)
);

CREATE TABLE Members (
    member_id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(100) NOT NULL,
    phone VARCHAR(15),
    email VARCHAR(100)
);

CREATE TABLE BorrowedBooks (
    borrow_id INT PRIMARY KEY AUTO_INCREMENT,
    member_id INT,
    book_id INT,
    borrow_date DATE,
    return_date DATE,
    FOREIGN KEY (member_id) REFERENCES Members(member_id),
    FOREIGN KEY (book_id) REFERENCES Books(book_id)
);

-- Step 3: Insert sample data
INSERT INTO Books (title, author, genre, available_copies) VALUES
('The Great Gatsby', 'F. Scott Fitzgerald', 'Fiction', 5),
('1984', 'George Orwell', 'Dystopian', 3),
('Clean Code', 'Robert C. Martin', 'Programming', 2);

INSERT INTO Members (name, phone, email) VALUES
('Rahul Verma', '9991112222', 'rahul@example.com'),
('Aisha Khan', '9993334444', 'aisha@example.com');

-- Step 4: Borrowing a book (reduce available copies)
INSERT INTO BorrowedBooks (member_id, book_id, borrow_date, return_date)
VALUES (1, 2, CURDATE(), NULL);

UPDATE Books
SET available_copies = available_copies - 1
WHERE book_id = 2;

-- Step 5: Returning a book (increase available copies)
UPDATE BorrowedBooks
SET return_date = CURDATE()
WHERE borrow_id = 1;

UPDATE Books
SET available_copies = available_copies + 1
WHERE book_id = 2;

-- Step 6: Create a view for borrowed books list
CREATE VIEW BorrowedList AS
SELECT m.name AS MemberName, b.title AS BookTitle, bb.borrow_date, bb.return_date
FROM BorrowedBooks bb
JOIN Members m ON bb.member_id = m.member_id
JOIN Books b ON bb.book_id = b.book_id;

-- Step 7: Query examples
SELECT * FROM Books;
SELECT * FROM Members;
SELECT * FROM BorrowedList;
