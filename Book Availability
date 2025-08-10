-- Real-time book availability with reservation queue
WITH book_status AS (
    SELECT 
        b.book_id,
        b.title,
        b.author,
        b.copies_total,
        b.copies_available,
        COUNT(DISTINCT l.loan_id) AS current_loans,
        COUNT(DISTINCT r.reservation_id) AS active_reservations
    FROM books b
    LEFT JOIN loans l ON b.book_id = l.book_id AND l.return_date IS NULL
    LEFT JOIN reservations r ON b.book_id = r.book_id AND r.status = 'Active'
    GROUP BY b.book_id, b.title, b.author, b.copies_total, b.copies_available
)
SELECT 
    title,
    author,
    copies_total,
    copies_available,
    current_loans,
    active_reservations,
    CASE 
        WHEN copies_available > 0 THEN 'Available'
        WHEN active_reservations > 0 THEN CONCAT('Reserved (Waitlist: ', active_reservations, ')')
        ELSE 'All Copies Out'
    END AS availability_status,
    CASE 
        WHEN copies_available = 0 AND active_reservations > 2 THEN 'High Demand'
        WHEN copies_available <= 1 THEN 'Limited Availability'
        ELSE 'Good Availability'
    END AS demand_indicator
FROM book_status
ORDER BY active_reservations DESC, title;
