-- Which book categories are most popular?
WITH category_stats AS (
    SELECT 
        b.category,
        COUNT(DISTINCT b.book_id) AS total_books,
        COUNT(l.loan_id) AS total_loans,
        AVG(r.rating) AS avg_category_rating
    FROM books b
    LEFT JOIN loans l ON b.book_id = l.book_id
    LEFT JOIN reviews r ON b.book_id = r.book_id
    GROUP BY b.category
)
SELECT 
    category,
    total_books,
    total_loans,
    ROUND(total_loans / total_books, 2) AS loans_per_book,
    ROUND(avg_category_rating, 2) AS avg_rating,
    RANK() OVER (ORDER BY total_loans DESC) AS popularity_rank
FROM category_stats
WHERE total_books > 0
ORDER BY total_loans DESC;
