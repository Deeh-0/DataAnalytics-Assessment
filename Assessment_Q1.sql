WITH funded_savings AS(
	SELECT
		p.owner_id,
        COUNT(DISTINCT p.id) AS savings_count,
        SUM(s.confirmed_amount) AS total_deposit_kobo
	FROM plans_plan p 
    JOIN savings_savingsaccount s ON p.id = s.plan_id
    WHERE p.is_regular_savings = 1
		AND s.confirmed_amount > 0
    GROUP BY p.owner_id
),

investment AS (
	SELECT
		owner_id,
        COUNT(DISTINCT id) AS investment_count
	FROM plans_plan
	WHERE is_a_fund = 1
    GROUP BY owner_id
),

qualified_customers AS (
	SELECT 
		fs.owner_id,
		fs.savings_count,
        iv.investment_count,
        fs.total_deposit_kobo
	FROM funded_savings fs
    JOIN investment iv on fs.owner_id = iv.owner_id
    WHERE fs.savings_count >= 1
		AND iv.investment_count = 1
)

SELECT 
	qc.owner_id AS customer_id,
    CONCAT(u.first_name, ' ', u.last_name) AS name,
    qc.savings_count,
    qc.investment_count,
    qc.total_deposit_kobo/ 100 AS total_deposit
FROM qualified_customers qc
JOIN users_customuser u ON qc.owner_id = u.id
ORDER BY total_deposit DESC;