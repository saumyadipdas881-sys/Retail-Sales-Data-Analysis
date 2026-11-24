# Retail Sales Performance Analysis
## Project Report

### 1. Executive Summary
This project analyses a simulated retail sales dataset containing 1,200 unique order records across 8 cities and 5 product categories during calendar year 2025.

### 2. Business Objective
Understand sales, profitability, product/category performance, city performance, monthly trends, payment preferences and order outcomes.

### 3. Dataset
- Rows after de-duplication and required-field checks: 1,200
- Columns in source: 14
- Date range: 2025-01-01 to 2025-12-31
- Cities: 8
- Categories: 5
- Data note: this is a generated practice dataset, not actual company data.

### 4. Key Performance Indicators
| KPI | Result |
|---|---:|
| Total orders | 1,200 |
| Total revenue | 4,185,855.00 |
| Total profit | 1,163,028.49 |
| Units sold | 3,568 |
| Average order value | 3,488.21 |
| Profit margin | 27.78% |
| Return rate | 5.75% |
| Cancellation rate | 4.00% |

### 5. Findings
1. Highest-revenue category: **Electronics** with revenue of 1,786,725.68.
2. Highest-revenue city: **Kolkata** with revenue of 632,951.07.
3. Highest-revenue month: **2025-05** with revenue of 431,302.07.
4. Highest-profit product: **Power Bank** (Electronics) with profit of 119,715.15.
5. Most-used payment method by order count: **UPI** (501 orders).

### 6. Recommendations
- Review stock availability and supplier terms for the highest-revenue categories.
- Investigate lower-performing cities and categories before changing marketing spend.
- Compare monthly performance to identify seasonal peaks and plan inventory.
- Monitor return and cancellation reasons with operational teams.
- Evaluate discount bands using both revenue and profit, not revenue alone.

### 7. Limitations
- Data is synthetic and suitable for learning/demo purposes only.
- No customer demographics, marketing spend, shipping cost or return reason fields are included.
- Revenue and profit values are simulated; business recommendations should be validated with real data.

### 8. Deliverables
- CSV dataset
- Excel workbook with cleaned data, KPI summary and analysis sheets
- SQL analysis queries
- Python EDA script
- Power BI DAX measures and dashboard build guide
