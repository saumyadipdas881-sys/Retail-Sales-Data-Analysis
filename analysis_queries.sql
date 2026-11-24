-- Retail Sales Analysis Project (SQLite-compatible)
-- Import retail_sales_analysis_dataset.csv as a table named sales.
-- Note: Order_Date should be stored as YYYY-MM-DD text or DATE.

-- 1. Inspect the data
SELECT * FROM sales LIMIT 10;

-- 2. Overall KPIs
SELECT
  COUNT(DISTINCT Order_ID) AS total_orders,
  ROUND(SUM(Revenue), 2) AS total_revenue,
  ROUND(SUM(Profit), 2) AS total_profit,
  SUM(Quantity) AS units_sold,
  ROUND(AVG(Revenue), 2) AS average_order_revenue,
  ROUND(SUM(Profit) * 100.0 / NULLIF(SUM(Revenue), 0), 2) AS profit_margin_pct
FROM sales;

-- 3. Revenue and profit by category
SELECT Category, ROUND(SUM(Revenue),2) AS revenue,
       ROUND(SUM(Profit),2) AS profit, SUM(Quantity) AS units
FROM sales
GROUP BY Category
ORDER BY revenue DESC;

-- 4. City-wise performance
SELECT City, ROUND(SUM(Revenue),2) AS revenue,
       ROUND(SUM(Profit),2) AS profit, COUNT(DISTINCT Order_ID) AS orders
FROM sales
GROUP BY City
ORDER BY revenue DESC;

-- 5. Monthly sales trend (SQLite)
SELECT strftime('%Y-%m', Order_Date) AS month,
       ROUND(SUM(Revenue),2) AS revenue,
       ROUND(SUM(Profit),2) AS profit
FROM sales
GROUP BY strftime('%Y-%m', Order_Date)
ORDER BY month;

-- 6. Top 10 products by profit
SELECT Product, Category, SUM(Quantity) AS units,
       ROUND(SUM(Revenue),2) AS revenue, ROUND(SUM(Profit),2) AS profit
FROM sales
GROUP BY Product, Category
ORDER BY profit DESC
LIMIT 10;

-- 7. Payment method preference
SELECT Payment_Method, COUNT(*) AS orders,
       ROUND(SUM(Revenue),2) AS revenue
FROM sales
GROUP BY Payment_Method
ORDER BY orders DESC;

-- 8. Returned and cancelled order rates
SELECT Order_Status, COUNT(*) AS orders,
       ROUND(COUNT(*) * 100.0 / (SELECT COUNT(*) FROM sales), 2) AS order_pct
FROM sales
GROUP BY Order_Status;

-- 9. Discount impact by discount band
SELECT
  CASE
    WHEN Discount_Rate = 0 THEN '0%'
    WHEN Discount_Rate <= 0.05 THEN '1-5%'
    WHEN Discount_Rate <= 0.10 THEN '6-10%'
    WHEN Discount_Rate <= 0.15 THEN '11-15%'
    ELSE '16-20%'
  END AS discount_band,
  ROUND(SUM(Revenue),2) AS revenue,
  ROUND(SUM(Profit),2) AS profit,
  COUNT(*) AS orders
FROM sales
GROUP BY discount_band
ORDER BY discount_band;

-- 10. Customer-level value
SELECT Customer_ID, COUNT(DISTINCT Order_ID) AS orders,
       ROUND(SUM(Revenue),2) AS revenue,
       ROUND(SUM(Profit),2) AS profit
FROM sales
GROUP BY Customer_ID
ORDER BY revenue DESC
LIMIT 20;
