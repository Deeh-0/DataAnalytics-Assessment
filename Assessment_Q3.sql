SELECT 
    p.id AS plan_id,
    p.owner_id,
    CASE
        WHEN p.is_regular_savings = 1 THEN 'Savings'
        WHEN p.is_a_fund = 1 THEN 'Investment'
        ELSE 'Unknown'
    END AS type,
    MAX(s.transaction_date) AS last_transaction_date,
    DATEDIFF(CURDATE(), MAX(s.transaction_date)) AS inactivity_days
FROM
    plans_plan p
        LEFT JOIN
    savings_savingsaccount s ON p.id = s.plan_id
        AND s.confirmed_amount > 0
WHERE
    (p.is_regular_savings = 1
        OR p.is_a_fund = 1)
GROUP BY p.id , p.owner_id , type
HAVING last_transaction_date IS NULL
    OR DATEDIFF(CURDATE(), last_transaction_date) > 365
ORDER BY inactivity_days DESC;
