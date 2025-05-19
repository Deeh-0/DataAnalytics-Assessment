WITH monthly_transactions AS (
	SELECT 
		u.id AS customer_id,
		MONTH(s.transaction_date) AS month,
		COUNT(*) AS transaction_count
    FROM 
		users_customuser u
	JOIN
		savings_savingsaccount s ON u.id = s.owner_id
	GROUP BY 
		customer_id, MONTH(s.transaction_date)
),

customer_avg_transactions AS (
	SELECT 
		customer_id,
        AVG(transaction_count) AS avg_transaction_per_month,
        CASE
			WHEN AVG(transaction_count) >= 10 THEN 'High Frequency'
            WHEN AVG(transaction_count) BETWEEN 3 AND 9 THEN 'Medium Frequency'
            ELSE 'Low Frequency'
		END AS frequency_category
	FROM
		monthly_transactions
	GROUP BY
		customer_id
)

SELECT 
	frequency_category,
    COUNT(*) AS customer_count,
    ROUND(AVG(avg_transaction_per_month),1) AS avg_transaction_per_month
FROM
	customer_avg_transactions
GROUP BY
	frequency_category
ORDER BY
	CASE
		WHEN frequency_category = 'High Frequency' THEN 1
        WHEN frequency_category = 'Medium Frequency' THEN 2
        ELSE 3
	END;