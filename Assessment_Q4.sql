SELECT 
	u.id AS customer_id,
    CONCAT(u.first_name, ' ', u.last_name) AS name,
    TIMESTAMPDIFF(MONTH, u.created_on, CURRENT_DATE()) AS tenure_month,
    COUNT(s.id) AS total_transaction,
    ROUND(
		(COUNT(s.id)/NULLIF(TIMESTAMPDIFF(MONTH, u.created_on, CURRENT_DATE()),0)) * 12 * (AVG(s.confirmed_amount)/100 *0.001)
    ,2) AS estimated_clv
FROM users_customuser u
JOIN savings_savingsaccount s ON u.id = s.owner_id
WHERE s.confirmed_amount > 0
GROUP BY u.id, name 
ORDER BY estimated_clv DESC;