-- Understand reading patterns by age group
-- For MySQL: Use TIMESTAMPDIFF for age calculation and GROUP_CONCAT for string aggregation
WITH member_age AS (
    SELECT 
        member_id,
        CONCAT(first_name, ' ', last_name) AS member_name,
        TIMESTAMPDIFF(YEAR, birth_date, CURRENT_DATE) AS age,
        CASE 
            WHEN TIMESTAMPDIFF(YEAR, birth_date, CURRENT_DATE) < 18 THEN 'Youth (Under 18)'
            WHEN TIMESTAMPDIFF(YEAR, birth_date, CURRENT_DATE) BETWEEN 18 AND 25 THEN 'Young Adult (18-25)'
            WHEN TIMESTAMPDIFF(YEAR, birth_date, CURRENT_DATE) BETWEEN 26 AND 40 THEN 'Adult (26-40)'
            WHEN TIMESTAMPDIFF(YEAR, birth_date, CURRENT_DATE) BETWEEN 41 AND 60 THEN 'Middle Age (41-60)'
            ELSE 'Senior (60+)'
        END AS age_group
    FROM members
)
SELECT 
    ma.age_group,
    COUNT(DISTINCT ma.member_id) AS total_members,
    COUNT(l.loan_id) AS total_loans,
    ROUND(COUNT(l.loan_id) / COUNT(DISTINCT ma.member_id), 1) AS avg_books_per_member,
    GROUP_CONCAT(DISTINCT b.category ORDER BY b.category SEPARATOR ', ') AS popular_categories
FROM member_age ma
LEFT JOIN loans l ON ma.member_id = l.member_id
LEFT JOIN books b ON l.book_id = b.book_id
GROUP BY ma.age_group
ORDER BY 
    CASE ma.age_group
        WHEN 'Youth (Under 18)' THEN 1
        WHEN 'Young Adult (18-25)' THEN 2
        WHEN 'Adult (26-40)' THEN 3
        WHEN 'Middle Age (41-60)' THEN 4
        ELSE 5
    END;
