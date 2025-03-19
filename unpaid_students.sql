
WITH unpaid_students AS (
    SELECT 
        s.id AS student_id,
        s.name AS student_name
    FROM 
        students s
    LEFT JOIN 
        payments p ON s.id = p.student_id 
        AND p.payment_date <= '2025-03-31' 
    WHERE 
        p.id IS NULL 
)
INSERT INTO fines (student_id, fine_amount, fine_date)
SELECT 
    us.student_id,
    100 AS fine_amount,  
    CURRENT_DATE AS fine_date  
FROM 
    unpaid_students us;
