-- Analyze member borrowing patterns
SELECT 
    m.member_id,
    CONCAT(m.first_name, ' ', m.last_name) AS member_name,
    m.membership_type,
    COUNT(l.loan_id) AS books_borrowed,
    COUNT(CASE WHEN l.return_date > l.due_date THEN 1 END) AS late_returns,
    SUM(l.fine_amount) AS total_fines,
    AVG(DATEDIFF(l.return_date, l.loan_date)) AS avg_borrow_duration,
    MAX(l.loan_date) AS last_borrow_date
FROM members m
LEFT JOIN loans l ON m.member_id = l.member_id
GROUP BY m.member_id, m.first_name, m.last_name, m.membership_type
ORDER BY books_borrowed DESC;
