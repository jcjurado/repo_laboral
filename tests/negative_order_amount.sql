SELECT * 
FROM {{ ref('fact_orders') }} 
WHERE GrossLineAmount < 0