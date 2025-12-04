-- Which authors are most popular in the library?
SELECT 
    b.author,
    COUNT(DISTINCT b.book_id) AS books_in_library,
    COUNT(l.loan_id) AS total_loans,
    AVG(r.rating) AS avg_rating,
    COUNT(DISTINCT l.member_id) AS unique_readers,
    SUM(res.reservation_count) AS total_reservations
FROM books b
LEFT JOIN loans l ON b.book_id = l.book_id
LEFT JOIN reviews r ON b.book_id = r.book_id
LEFT JOIN (
    SELECT book_id, COUNT(*) AS reservation_count
    FROM reservations
    WHERE status = 'Active'
    GROUP BY book_id
) res ON b.book_id = res.book_id
GROUP BY b.author
HAVING COUNT(l.loan_id) > 5
ORDER BY total_loans DESC
LIMIT 20;
