# 📚 Library Management System (MySQL)

## 📌 Overview
This is a **beginner-friendly SQL project** that simulates a **Library Management System** using MySQL.  
It allows you to manage books, library members, and track borrowed books.  
The project demonstrates **table creation, relationships, CRUD operations, and views**.

---

## 🛠 Features
- Add, update, and delete books
- Register new library members
- Borrow and return books with automatic stock updates
- View all borrowed books with member details
- Demonstrates **JOINs, Views, and Foreign Keys**

---

## 📂 Database Structure

### **Tables**
1. **Books**
   - Stores book details and available copies  
   - `book_id`, `title`, `author`, `genre`, `available_copies`

2. **Members**
   - Stores member details  
   - `member_id`, `name`, `phone`, `email`

3. **BorrowedBooks**
   - Tracks which books are borrowed and by whom  
   - `borrow_id`, `member_id`, `book_id`, `borrow_date`, `return_date`

---

## 💻 SQL Operations Demonstrated
- **DDL**: `CREATE TABLE`, `DROP DATABASE`, constraints
- **DML**: `INSERT`, `UPDATE`, `DELETE`
- **JOINS**: Combining data from multiple tables
- **VIEWS**: `CREATE VIEW` for borrowed books report
- **CHECK Constraints**: Ensuring available copies are non-negative

---

## 🚀 How to Run

1. Open **MySQL Command Line** or a GUI like **phpMyAdmin** / **MySQL Workbench**.
2. Copy the entire SQL script from `library_management.sql`.
3. Paste and execute the script.
4. Run queries like:
   ```sql
   SELECT * FROM Books;
   SELECT * FROM Members;
   SELECT * FROM BorrowedList;
