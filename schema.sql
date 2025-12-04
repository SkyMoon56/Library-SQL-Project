-- 1. members table
CREATE TABLE members (
    member_id INT PRIMARY KEY,
    first_name VARCHAR(50),
    last_name VARCHAR(50),
    email VARCHAR(100),
    phone VARCHAR(20),
    join_date DATE,
    membership_type VARCHAR(20), -- 'Standard', 'Student', 'Senior', 'Premium'
    address VARCHAR(200),
    city VARCHAR(50),
    birth_date DATE
);

-- 2. books table
CREATE TABLE books (
    book_id INT PRIMARY KEY,
    isbn VARCHAR(13),
    title VARCHAR(200),
    author VARCHAR(100),
    publisher VARCHAR(100),
    publication_year INT,
    category VARCHAR(50),
    pages INT,
    copies_available INT,
    copies_total INT
);

-- 3. loans table (when a member borrows a book)
CREATE TABLE loans (
    loan_id INT PRIMARY KEY,
    member_id INT,
    book_id INT,
    loan_date DATE,
    due_date DATE,
    return_date DATE,
    is_renewed BOOLEAN DEFAULT FALSE,
    fine_amount DECIMAL(5,2) DEFAULT 0,
    FOREIGN KEY (member_id) REFERENCES members(member_id),
    FOREIGN KEY (book_id) REFERENCES books(book_id)
);

-- 4. reviews table
CREATE TABLE reviews (
    review_id INT PRIMARY KEY,
    book_id INT,
    member_id INT,
    rating INT CHECK (rating >= 1 AND rating <= 5),
    review_text TEXT,
    review_date DATE,
    FOREIGN KEY (book_id) REFERENCES books(book_id),
    FOREIGN KEY (member_id) REFERENCES members(member_id)
);

-- 5. reservations table (waiting list for books)
CREATE TABLE reservations (
    reservation_id INT PRIMARY KEY,
    book_id INT,
    member_id INT,
    reservation_date DATE,
    status VARCHAR(20), -- 'Active', 'Fulfilled', 'Cancelled'
    notification_sent BOOLEAN DEFAULT FALSE,
    FOREIGN KEY (book_id) REFERENCES books(book_id),
    FOREIGN KEY (member_id) REFERENCES members(member_id)
);

-- Insert sample members (20 members)
INSERT INTO members (member_id, first_name, last_name, email, phone, join_date, membership_type, address, city, birth_date)
VALUES 
    (1, 'John', 'Smith', 'john.smith@email.com', '555-0101', '2023-01-15', 'Standard', '123 Main St', 'New York', '1985-03-20'),
    (2, 'Sarah', 'Johnson', 'sarah.j@email.com', '555-0102', '2023-02-20', 'Premium', '456 Oak Ave', 'Los Angeles', '1990-07-15'),
    (3, 'Mike', 'Williams', 'mike.w@email.com', '555-0103', '2023-03-10', 'Student', '789 Pine Rd', 'Chicago', '2002-11-30'),
    (4, 'Emma', 'Brown', 'emma.brown@email.com', '555-0104', '2023-01-20', 'Standard', '321 Elm St', 'Houston', '1988-05-10'),
    (5, 'David', 'Jones', 'david.j@email.com', '555-0105', '2023-04-05', 'Senior', '654 Maple Dr', 'Phoenix', '1955-09-25'),
    (6, 'Lisa', 'Garcia', 'lisa.g@email.com', '555-0106', '2023-02-15', 'Student', '987 Cedar Ln', 'Philadelphia', '2001-08-14'),
    (7, 'Robert', 'Miller', 'robert.m@email.com', '555-0107', '2023-05-01', 'Premium', '147 Spruce Ave', 'San Antonio', '1975-12-03'),
    (8, 'Jennifer', 'Davis', 'jen.davis@email.com', '555-0108', '2023-03-25', 'Standard', '258 Birch St', 'San Diego', '1992-06-18'),
    (9, 'William', 'Rodriguez', 'will.r@email.com', '555-0109', '2023-06-10', 'Student', '369 Willow Way', 'Dallas', '2003-01-22'),
    (10, 'Maria', 'Martinez', 'maria.m@email.com', '555-0110', '2023-04-15', 'Senior', '741 Ash Ct', 'San Jose', '1960-11-07'),
    (11, 'James', 'Anderson', 'james.a@email.com', '555-0111', '2023-01-05', 'Premium', '852 Poplar Rd', 'Austin', '1982-04-16'),
    (12, 'Patricia', 'Taylor', 'pat.taylor@email.com', '555-0112', '2023-07-20', 'Standard', '963 Sycamore Ln', 'Jacksonville', '1995-09-30'),
    (13, 'Charles', 'Thomas', 'charles.t@email.com', '555-0113', '2023-02-28', 'Student', '159 Hickory St', 'San Francisco', '2000-03-12'),
    (14, 'Linda', 'Hernandez', 'linda.h@email.com', '555-0114', '2023-05-15', 'Standard', '357 Chestnut Ave', 'Indianapolis', '1987-07-24'),
    (15, 'Christopher', 'Moore', 'chris.moore@email.com', '555-0115', '2023-03-05', 'Premium', '486 Beech Dr', 'Columbus', '1979-10-08'),
    (16, 'Barbara', 'Martin', 'barb.m@email.com', '555-0116', '2023-06-25', 'Senior', '624 Fir Ct', 'Fort Worth', '1958-02-14'),
    (17, 'Daniel', 'Jackson', 'dan.j@email.com', '555-0117', '2023-04-10', 'Standard', '753 Redwood Rd', 'Charlotte', '1991-12-27'),
    (18, 'Susan', 'Thompson', 'susan.t@email.com', '555-0118', '2023-01-25', 'Student', '951 Palm Ave', 'Detroit', '2002-05-09'),
    (19, 'Matthew', 'White', 'matt.white@email.com', '555-0119', '2023-07-05', 'Premium', '842 Cypress Ln', 'El Paso', '1986-08-21'),
    (20, 'Jessica', 'Lopez', 'jessica.l@email.com', '555-0120', '2023-02-10', 'Standard', '376 Magnolia St', 'Seattle', '1993-11-15');

-- Insert sample books (30 books)
INSERT INTO books (book_id, isbn, title, author, publisher, publication_year, category, pages, copies_available, copies_total)
VALUES 
    (1, '9780440238133', 'The Great Gatsby', 'F. Scott Fitzgerald', 'Scribner', 1925, 'Fiction', 180, 3, 5),
    (2, '9780061120084', 'To Kill a Mockingbird', 'Harper Lee', 'J.B. Lippincott', 1960, 'Fiction', 324, 2, 4),
    (3, '9780134685991', 'Database Systems', 'Elmasri & Navathe', 'Pearson', 2019, 'Technology', 1280, 1, 3),
    (4, '9780747532743', 'Harry Potter and the Philosophers Stone', 'J.K. Rowling', 'Bloomsbury', 1997, 'Fantasy', 223, 0, 6),
    (5, '9780451524935', '1984', 'George Orwell', 'Secker & Warburg', 1949, 'Fiction', 328, 4, 5),
    (6, '9780316769488', 'The Catcher in the Rye', 'J.D. Salinger', 'Little Brown', 1951, 'Fiction', 277, 2, 3),
    (7, '9780062316110', 'Sapiens', 'Yuval Noah Harari', 'Harper', 2011, 'History', 443, 3, 4),
    (8, '9780134190440', 'The Pragmatic Programmer', 'David Thomas', 'Addison-Wesley', 1999, 'Technology', 320, 2, 3),
    (9, '9780062457714', 'The Subtle Art of Not Giving a F*ck', 'Mark Manson', 'HarperOne', 2016, 'Self-Help', 224, 1, 2),
    (10, '9780743273565', 'The Great Gatsby', 'F. Scott Fitzgerald', 'Scribner', 2004, 'Fiction', 180, 2, 3),
    (11, '9780345803481', 'Fifty Shades of Grey', 'E.L. James', 'Vintage', 2011, 'Romance', 514, 0, 2),
    (12, '9780439708180', 'Harry Potter and the Sorcerers Stone', 'J.K. Rowling', 'Scholastic', 1998, 'Fantasy', 309, 1, 4),
    (13, '9781451673319', 'Fahrenheit 451', 'Ray Bradbury', 'Ballantine', 1953, 'Science Fiction', 249, 3, 3),
    (14, '9780671027032', 'How to Win Friends and Influence People', 'Dale Carnegie', 'Simon & Schuster', 1936, 'Self-Help', 291, 2, 3),
    (15, '9780385504201', 'The Da Vinci Code', 'Dan Brown', 'Doubleday', 2003, 'Mystery', 689, 0, 4),
    (16, '9780812981605', 'The Power of Habit', 'Charles Duhigg', 'Random House', 2012, 'Psychology', 371, 2, 2),
    (17, '9780141439518', 'Pride and Prejudice', 'Jane Austen', 'Penguin Classics', 1813, 'Romance', 432, 3, 4),
    (18, '9780525478812', 'The Fault in Our Stars', 'John Green', 'Dutton', 2012, 'Young Adult', 313, 1, 3),
    (19, '9780307588364', 'Gone Girl', 'Gillian Flynn', 'Crown', 2012, 'Mystery', 432, 2, 3),
    (20, '9780375842207', 'The Book Thief', 'Markus Zusak', 'Knopf', 2005, 'Historical Fiction', 552, 1, 2),
    (21, '9780596009205', 'Head First Java', 'Kathy Sierra', 'OReilly', 2005, 'Technology', 688, 2, 3),
    (22, '9781984801258', 'Becoming', 'Michelle Obama', 'Crown', 2018, 'Biography', 448, 0, 2),
    (23, '9780143127741', 'The Girl on the Train', 'Paula Hawkins', 'Riverhead', 2015, 'Mystery', 395, 1, 2),
    (24, '9780262033848', 'Introduction to Algorithms', 'Thomas Cormen', 'MIT Press', 2009, 'Technology', 1312, 1, 2),
    (25, '9780544003415', 'The Hobbit', 'J.R.R. Tolkien', 'Houghton Mifflin', 1937, 'Fantasy', 366, 3, 5),
    (26, '9780142000670', 'Of Mice and Men', 'John Steinbeck', 'Covici Friede', 1937, 'Fiction', 187, 2, 3),
    (27, '9780735619678', 'Code Complete', 'Steve McConnell', 'Microsoft Press', 2004, 'Technology', 960, 1, 2),
    (28, '9781501160769', 'The Seven Husbands of Evelyn Hugo', 'Taylor Jenkins Reid', 'Atria', 2017, 'Romance', 400, 0, 2),
    (29, '9780399501487', 'Lord of the Flies', 'William Golding', 'Faber & Faber', 1954, 'Fiction', 224, 3, 4),
    (30, '9780684801223', 'The Old Man and the Sea', 'Ernest Hemingway', 'Scribner', 1952, 'Fiction', 127, 2, 2);

-- Insert sample loans (50 loans)
INSERT INTO loans (loan_id, member_id, book_id, loan_date, due_date, return_date, is_renewed, fine_amount)
VALUES 
    (1, 1, 1, '2024-01-15', '2024-01-29', '2024-01-28', FALSE, 0.00),
    (2, 2, 4, '2024-01-20', '2024-02-03', '2024-02-05', FALSE, 1.00),
    (3, 3, 7, '2024-01-25', '2024-02-08', '2024-02-08', FALSE, 0.00),
    (4, 1, 12, '2024-02-01', '2024-02-15', '2024-02-14', FALSE, 0.00),
    (5, 4, 2, '2024-02-05', '2024-02-19', '2024-02-20', TRUE, 0.50),
    (6, 5, 8, '2024-02-10', '2024-02-24', '2024-02-24', FALSE, 0.00),
    (7, 6, 15, '2024-02-15', '2024-02-29', '2024-03-02', FALSE, 1.00),
    (8, 2, 3, '2024-02-20', '2024-03-05', '2024-03-04', FALSE, 0.00),
    (9, 7, 25, '2024-02-25', '2024-03-10', '2024-03-10', FALSE, 0.00),
    (10, 8, 17, '2024-03-01', '2024-03-15', '2024-03-14', FALSE, 0.00),
    (11, 9, 4, '2024-03-05', '2024-03-19', '2024-03-18', FALSE, 0.00),
    (12, 10, 11, '2024-03-10', '2024-03-24', '2024-03-26', FALSE, 1.00),
    (13, 3, 21, '2024-03-15', '2024-03-29', '2024-03-29', FALSE, 0.00),
    (14, 11, 6, '2024-03-20', '2024-04-03', '2024-04-03', FALSE, 0.00),
    (15, 12, 19, '2024-03-25', '2024-04-08', '2024-04-07', FALSE, 0.00),
    (16, 4, 14, '2024-04-01', '2024-04-15', '2024-04-15', TRUE, 0.00),
    (17, 13, 22, '2024-04-05', '2024-04-19', '2024-04-20', FALSE, 0.50),
    (18, 14, 9, '2024-04-10', '2024-04-24', '2024-04-24', FALSE, 0.00),
    (19, 15, 28, '2024-04-15', '2024-04-29', '2024-04-29', FALSE, 0.00),
    (20, 1, 30, '2024-04-20', '2024-05-04', '2024-05-04', FALSE, 0.00),
    (21, 5, 13, '2024-04-25', '2024-05-09', '2024-05-08', FALSE, 0.00),
    (22, 16, 26, '2024-05-01', '2024-05-15', '2024-05-15', FALSE, 0.00),
    (23, 17, 5, '2024-05-05', '2024-05-19', '2024-05-19', FALSE, 0.00),
    (24, 18, 18, '2024-05-10', '2024-05-24', '2024-05-23', FALSE, 0.00),
    (25, 2, 24, '2024-05-15', '2024-05-29', '2024-05-30', FALSE, 0.50),
    (26, 19, 10, '2024-05-20', '2024-06-03', '2024-06-03', FALSE, 0.00),
    (27, 20, 16, '2024-05-25', '2024-06-08', '2024-06-08', FALSE, 0.00),
    (28, 6, 23, '2024-06-01', '2024-06-15', '2024-06-14', FALSE, 0.00),
    (29, 8, 27, '2024-06-05', '2024-06-19', '2024-06-19', FALSE, 0.00),
    (30, 11, 29, '2024-06-10', '2024-06-24', '2024-06-24', FALSE, 0.00),
    (31, 3, 1, '2024-06-15', '2024-06-29', '2024-06-29', FALSE, 0.00),
    (32, 7, 20, '2024-06-20', '2024-07-04', '2024-07-03', FALSE, 0.00),
    (33, 14, 4, '2024-06-25', '2024-07-09', '2024-07-09', FALSE, 0.00),
    (34, 9, 25, '2024-07-01', '2024-07-15', '2024-07-15', FALSE, 0.00),
    (35, 12, 12, '2024-07-05', '2024-07-19', '2024-07-19', FALSE, 0.00),
    (36, 4, 7, '2024-07-10', '2024-07-24', '2024-07-24', FALSE, 0.00),
    (37, 10, 15, '2024-07-15', '2024-07-29', '2024-07-30', FALSE, 0.50),
    (38, 15, 2, '2024-07-20', '2024-08-03', '2024-08-03', FALSE, 0.00),
    (39, 1, 8, '2024-07-25', '2024-08-08', '2024-08-08', FALSE, 0.00),
    (40, 13, 3, '2024-08-01', '2024-08-15', '2024-08-15', FALSE, 0.00),
    -- Current active loans (not returned yet)
    (41, 5, 11, '2024-10-20', '2024-11-03', NULL, FALSE, 0.00),
    (42, 17, 22, '2024-10-22', '2024-11-05', NULL, FALSE, 0.00),
    (43, 2, 15, '2024-10-25', '2024-11-08', NULL, FALSE, 0.00),
    (44, 19, 4, '2024-10-27', '2024-11-10', NULL, FALSE, 0.00),
    (45, 8, 28, '2024-10-28', '2024-11-11', NULL, FALSE, 0.00),
    -- Overdue loans
    (46, 6, 19, '2024-10-01', '2024-10-15', NULL, FALSE, 0.00),
    (47, 11, 13, '2024-10-05', '2024-10-19', NULL, FALSE, 0.00),
    (48, 14, 9, '2024-10-08', '2024-10-22', NULL, FALSE, 0.00),
    (49, 3, 26, '2024-10-10', '2024-10-24', NULL, FALSE, 0.00),
    (50, 20, 30, '2024-10-12', '2024-10-26', NULL, FALSE, 0.00);

-- Insert sample reviews (30 reviews)
INSERT INTO reviews (review_id, book_id, member_id, rating, review_text, review_date)
VALUES 
    (1, 1, 1, 5, 'A classic! Beautifully written.', '2024-01-29'),
    (2, 4, 2, 5, 'Magical story that never gets old.', '2024-02-06'),
    (3, 7, 3, 4, 'Very insightful look at human history.', '2024-02-09'),
    (4, 12, 1, 5, 'My kids love this book!', '2024-02-15'),
    (5, 2, 4, 5, 'Powerful and moving story.', '2024-02-21'),
    (6, 8, 5, 4, 'Great for programmers.', '2024-02-25'),
    (7, 15, 6, 3, 'Entertaining but a bit overhyped.', '2024-03-03'),
    (8, 3, 2, 5, 'Best database textbook available.', '2024-03-05'),
    (9, 25, 7, 5, 'Tolkien at his best!', '2024-03-11'),
    (10, 17, 8, 4, 'Jane Austen never disappoints.', '2024-03-15'),
    (11, 4, 9, 5, 'Better than the movies!', '2024-03-19'),
    (12, 11, 10, 2, 'Not my cup of tea.', '2024-03-27'),
    (13, 21, 3, 4, 'Good for Java beginners.', '2024-03-30'),
    (14, 6, 11, 4, 'A coming-of-age classic.', '2024-04-04'),
    (15, 19, 12, 4, 'Thrilling mystery!', '2024-04-08'),
    (16, 14, 4, 5, 'Life-changing book.', '2024-04-16'),
    (17, 22, 13, 5, 'Inspiring autobiography.', '2024-04-21'),
    (18, 9, 14, 3, 'Some good points but repetitive.', '2024-04-25'),
    (19, 28, 15, 4, 'Surprisingly good!', '2024-04-30'),
    (20, 30, 1, 4, 'Hemingway''s best work.', '2024-05-05'),
    (21, 13, 5, 5, 'Dystopian masterpiece.', '2024-05-09'),
    (22, 26, 16, 4, 'Short but powerful.', '2024-05-16'),
    (23, 5, 17, 5, 'Eerily prophetic.', '2024-05-20'),
    (24, 18, 18, 4, 'Made me cry.', '2024-05-24'),
    (25, 24, 2, 3, 'Too technical for casual reading.', '2024-05-31'),
    (26, 10, 19, 5, 'Just as good as the original.', '2024-06-04'),
    (27, 16, 20, 4, 'Changed my daily routine.', '2024-06-09'),
    (28, 23, 6, 3, 'Good but predictable.', '2024-06-15'),
    (29, 27, 8, 5, 'Essential for developers.', '2024-06-20'),
    (30, 29, 11, 4, 'Disturbing but brilliant.', '2024-06-25');

-- Insert sample reservations (15 reservations)
INSERT INTO reservations (reservation_id, book_id, member_id, reservation_date, status, notification_sent)
VALUES 
    (1, 4, 7, '2024-10-28', 'Active', FALSE),
    (2, 4, 12, '2024-10-29', 'Active', FALSE),
    (3, 11, 3, '2024-10-25', 'Active', FALSE),
    (4, 15, 9, '2024-10-26', 'Active', FALSE),
    (5, 15, 16, '2024-10-27', 'Active', FALSE),
    (6, 22, 10, '2024-10-24', 'Active', FALSE),
    (7, 28, 4, '2024-10-23', 'Active', FALSE),
    (8, 1, 18, '2024-09-15', 'Fulfilled', TRUE),
    (9, 7, 13, '2024-09-20', 'Fulfilled', TRUE),
    (10, 12, 20, '2024-09-25', 'Cancelled', FALSE),
    (11, 4, 14, '2024-10-30', 'Active', FALSE),
    (12, 11, 15, '2024-10-28', 'Active', FALSE),
    (13, 22, 1, '2024-10-29', 'Active', FALSE),
    (14, 28, 6, '2024-10-30', 'Active', FALSE),
    (15, 15, 8, '2024-10-31', 'Active', FALSE);

-- Verify data was inserted
SELECT 'Members' as table_name, COUNT(*) as record_count FROM members
UNION ALL
SELECT 'Books', COUNT(*) FROM books
UNION ALL
SELECT 'Loans', COUNT(*) FROM loans
UNION ALL
SELECT 'Reviews', COUNT(*) FROM reviews
UNION ALL
SELECT 'Reservations', COUNT(*) FROM reservations;
