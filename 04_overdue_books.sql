-- Find currently overdue books and calculate fines
SELECT 
    CONCAT(m.first_name, ' ', m.last_name) AS member_name,
    m.email,
    m.phone,
    b.title,
    b.author,
    l.loan_date,
    l.due_date,
    DATEDIFF(CURRENT_DATE, l.due_date) AS days_overdue,
    DATEDIFF(CURRENT_DATE, l.due_date) * 0.50 AS fine_amount -- $0.50 per day
FROM loans l
JOIN members m ON l.member_id = m.member_id
JOIN books b ON l.book_id = b.book_id
WHERE l.return_date IS NULL 
    AND l.due_date < CURRENT_DATE
ORDER BY days_overdue DESC;
