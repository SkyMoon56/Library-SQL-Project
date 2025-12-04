-- Library usage trends by month
SELECT 
    DATE_FORMAT(loan_date, '%Y-%m') AS month,
    COUNT(loan_id) AS total_loans,
    COUNT(DISTINCT member_id) AS active_members,
    COUNT(DISTINCT book_id) AS unique_books_borrowed,
    COUNT(CASE WHEN is_renewed = TRUE THEN 1 END) AS renewed_loans,
    ROUND(AVG(DATEDIFF(return_date, loan_date)), 1) AS avg_loan_duration
FROM loans
WHERE loan_date >= DATE_SUB(CURRENT_DATE, INTERVAL 12 MONTH)
GROUP BY DATE_FORMAT(loan_date, '%Y-%m')
ORDER BY month DESC;
