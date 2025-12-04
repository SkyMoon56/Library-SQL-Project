-- Executive Dashboard - Key Library Metrics
SELECT 
    -- Collection Metrics
    (SELECT COUNT(*) FROM books) AS total_books,
    (SELECT SUM(copies_total) FROM books) AS total_copies,
    (SELECT COUNT(DISTINCT category) FROM books) AS total_categories,
    
    -- Member Metrics
    (SELECT COUNT(*) FROM members) AS total_members,
    (SELECT COUNT(DISTINCT member_id) FROM loans 
     WHERE loan_date >= DATEADD('month', -1, CURRENT_DATE)) AS active_members_last_month,
    
    -- Loan Metrics
    (SELECT COUNT(*) FROM loans WHERE return_date IS NULL) AS books_currently_out,
    (SELECT COUNT(*) FROM loans 
     WHERE return_date IS NULL AND due_date < CURRENT_DATE) AS overdue_books,
    
    -- Financial Metrics
    (SELECT SUM(fine_amount) FROM loans WHERE return_date IS NOT NULL) AS total_fines_collected,
    
    -- Satisfaction Metrics
    (SELECT ROUND(AVG(rating), 2) FROM reviews) AS avg_book_rating,
    (SELECT COUNT(*) FROM reviews) AS total_reviews;
