# Retail Sales Data Analyst Portfolio Project

A complete practice project covering Excel, SQL, Python and Power BI.

## Files
- `retail_sales_analysis_dataset.csv` - source dataset (1,200 rows)
- `Retail_Sales_Analysis.xlsx` - Excel workbook with cleaned data and analysis tabs
- `analysis_queries.sql` - SQLite-compatible business queries
- `retail_sales_analysis.py` - Python EDA script
- `PowerBI_DAX_Measures.txt` - DAX measures
- `PowerBI_Dashboard_Guide.md` - dashboard layout and build steps
- `Project_Report.md` - summary, KPIs, findings and recommendations
- PNG charts - reference visuals

## Run Python
Install dependencies:
`pip install pandas numpy matplotlib`
Place the CSV in the same folder and run:
`python retail_sales_analysis.py`

## SQL
Import the CSV into SQLite (or another SQL database) as a table named `sales`, then run `analysis_queries.sql`.
Some date functions differ across database engines; the supplied monthly query is for SQLite.

## Power BI
Follow `PowerBI_Dashboard_Guide.md` and create/save your own `.pbix` in Power BI Desktop.

## Dataset disclaimer
This is synthetic sample data created for portfolio practice. Do not describe it as confidential or real company data.
