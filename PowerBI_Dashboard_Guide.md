# Power BI Dashboard Build Guide

## Load data
1. Open Power BI Desktop.
2. Home -> Get Data -> Text/CSV.
3. Select `retail_sales_analysis_dataset.csv`.
4. Select Transform Data.
5. Set `Order_Date` to Date; numeric fields to Decimal Number or Whole Number as appropriate.
6. Select Close & Apply.
7. Rename the table to `sales`.

## Measures
Copy measures from `PowerBI_DAX_Measures.txt` into Modeling -> New measure.
Create the Date table, mark it as a date table, and relate Date[Date] to sales[Order_Date].

## Recommended one-page dashboard layout
- Top row: Total Revenue, Total Profit, Total Orders, Profit Margin % cards.
- Left: Revenue by Month (line chart).
- Middle: Revenue by Category (clustered bar chart).
- Right: Revenue by City (bar chart).
- Bottom left: Top 10 Products by Profit (bar chart).
- Bottom middle: Orders by Payment Method (donut chart).
- Bottom right: Order Status distribution (donut or stacked bar chart).

## Slicers
- Date / Year-Month
- City
- Category
- Payment Method
- Order Status

## Formatting
- Use a consistent theme and readable labels.
- Format revenue/profit as currency (choose INR if presenting the practice project in India).
- Format Profit Margin %, Return Rate %, Cancellation Rate % as percentages.
- Sort Year-Month chronologically, not alphabetically.
- Add a title: `Retail Sales Performance Dashboard`.
- Add a footer note: `Practice project using synthetic data`.

## Important
A `.pbix` file must be created and saved inside Power BI Desktop. This project pack includes the source data, DAX measures and exact dashboard layout, but does not include a prebuilt PBIX file.
