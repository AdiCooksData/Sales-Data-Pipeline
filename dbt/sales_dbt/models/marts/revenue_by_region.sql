SELECT t2.region
      , COUNT(customer_id) as num_of_cust
      , SUM(total_amount) as total_sales
FROM {{ref('stg_fact_sales')}} as t1 INNER JOIN {{ref('stg_dim_store')}} as t2
ON t1.store_id = t2.store_id
GROUP BY t2.region
ORDER BY t2.region ASC