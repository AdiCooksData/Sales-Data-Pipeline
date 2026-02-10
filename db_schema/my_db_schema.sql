CREATE TABLE dim_date (
    date_id DATE PRIMARY KEY,
    year INT,
    month INT,
    day INT,
    month_name TEXT,
    day_name TEXT
);

CREATE TABLE dim_customer (
    customer_id SERIAL PRIMARY KEY,
    customer_name TEXT,
    email TEXT,
    city TEXT,
    country TEXT
);


CREATE TABLE dim_product (
    product_id SERIAL PRIMARY KEY,
    product_name TEXT,
    category TEXT,
    price NUMERIC(10,2)
);


CREATE TABLE dim_store (
    store_id SERIAL PRIMARY KEY,
    store_name TEXT,
    city TEXT,
    region TEXT
);


CREATE TABLE fact_sales (
    sales_id SERIAL PRIMARY KEY,
    date_id DATE REFERENCES dim_date(date_id),
    customer_id INT REFERENCES dim_customer(customer_id),
    product_id INT REFERENCES dim_product(product_id),
    store_id INT REFERENCES dim_store(store_id),
    quantity INT,
    total_amount NUMERIC(10,2)
);