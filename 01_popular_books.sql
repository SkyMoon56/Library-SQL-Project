-- Find the most borrowed books with ratings
SELECT 
    b.title,
    b.author,
    b.category,
    COUNT(l.loan_id) AS times_borrowed,
    ROUND(AVG(CAST(r.rating AS DECIMAL(3,2))), 2) AS avg_rating,
    COUNT(DISTINCT r.review_id) AS total_reviews,
    b.copies_total AS total_copies
FROM books b
LEFT JOIN loans l ON b.book_id = l.book_id
LEFT JOIN reviews r ON b.book_id = r.book_id
GROUP BY b.book_id, b.title, b.author, b.category, b.copies_total
ORDER BY times_borrowed DESC
LIMIT 20;
