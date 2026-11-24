"""
Retail Sales Analysis - Python EDA
Run:
  pip install pandas numpy matplotlib
  python retail_sales_analysis.py
Keep retail_sales_analysis_dataset.csv in the same folder.
"""
import pandas as pd
import numpy as np
import matplotlib.pyplot as plt

df = pd.read_csv("retail_sales_analysis_dataset.csv", parse_dates=["Order_Date"])

print("DATA SHAPE:", df.shape)
print("\nMISSING VALUES:\n", df.isna().sum())
print("\nDUPLICATE ORDER IDs:", df["Order_ID"].duplicated().sum())

df = df.drop_duplicates(subset=["Order_ID"]).dropna(
    subset=["Order_ID", "Order_Date", "Revenue", "Profit"]
)
df["Month"] = df["Order_Date"].dt.to_period("M").astype(str)
df["Profit_Margin"] = np.where(df["Revenue"] != 0, df["Profit"] / df["Revenue"], 0)

print("\nOVERALL KPIs")
print("Orders:", df["Order_ID"].nunique())
print("Revenue:", round(df["Revenue"].sum(), 2))
print("Profit:", round(df["Profit"].sum(), 2))
print("Units sold:", int(df["Quantity"].sum()))
print("Average order value:", round(df["Revenue"].sum() / df["Order_ID"].nunique(), 2))
print("Profit margin (%):", round(df["Profit"].sum() / df["Revenue"].sum() * 100, 2))

category = df.groupby("Category")[["Revenue", "Profit", "Quantity"]].sum().sort_values("Revenue", ascending=False)
city = df.groupby("City")[["Revenue", "Profit"]].sum().sort_values("Revenue", ascending=False)
monthly = df.groupby("Month")[["Revenue", "Profit"]].sum().sort_index()
products = df.groupby(["Product", "Category"])[["Revenue", "Profit", "Quantity"]].sum().sort_values("Profit", ascending=False)

print("\nCATEGORY ANALYSIS:\n", category)
print("\nCITY ANALYSIS:\n", city)
print("\nTOP 10 PRODUCTS BY PROFIT:\n", products.head(10))

category["Revenue"].plot(kind="bar", title="Revenue by Category", ylabel="Revenue")
plt.tight_layout()
plt.savefig("python_revenue_by_category.png", dpi=150)
plt.show()

monthly["Revenue"].plot(kind="line", marker="o", title="Monthly Revenue Trend", ylabel="Revenue")
plt.tight_layout()
plt.savefig("python_monthly_revenue.png", dpi=150)
plt.show()
