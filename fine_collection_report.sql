-- Track fine collection and outstanding amounts
WITH fine_summary AS (
    SELECT 
        m.member_id,
        CONCAT(m.first_name, ' ', m.last_name) AS member_name,
        m.email,
        COUNT(CASE WHEN l.fine_amount > 0 THEN 1 END) AS total_fines,
        SUM(CASE WHEN l.return_date IS NOT NULL THEN l.fine_amount ELSE 0 END) AS paid_fines,
        SUM(CASE WHEN l.return_date IS NULL AND l.due_date < CURRENT_DATE 
            THEN DATEDIFF(CURRENT_DATE, l.due_date) * 0.50 ELSE 0 END) AS outstanding_fines
    FROM members m
    LEFT JOIN loans l ON m.member_id = l.member_id
    GROUP BY m.member_id, member_name, m.email
    HAVING SUM(l.fine_amount) > 0 OR 
           SUM(CASE WHEN l.return_date IS NULL AND l.due_date < CURRENT_DATE THEN 1 ELSE 0 END) > 0
)
SELECT 
    member_name,
    email,
    total_fines,
    ROUND(paid_fines, 2) AS paid_fines,
    ROUND(outstanding_fines, 2) AS outstanding_fines,
    ROUND(paid_fines + outstanding_fines, 2) AS total_fine_amount,
    CASE 
        WHEN outstanding_fines > 10 THEN 'High Priority'
        WHEN outstanding_fines > 5 THEN 'Medium Priority'
        ELSE 'Low Priority'
    END AS collection_priority
FROM fine_summary
ORDER BY outstanding_fines DESC;
