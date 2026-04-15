# Agricultural Crop Yield Analysis

An end-to-end data analysis project focusing on exploring agricultural crop production patterns. This project integrates **Excel, Python, SQL, and Power BI** to identify trends in yield, production, and cultivated area for better agricultural decision-making.

## 📊 Project Overview
This project analyzes historical crop data to determine which factors influence agricultural productivity. It follows a structured data pipeline from raw data cleaning to interactive visualization.

### Key Insights:
* **Production Trends:** Analysis of crop growth over different years and seasons.
* **State-wise Performance:** Identifying high-performing states for specific crops.
* **Yield Efficiency:** Calculating the ratio of production to cultivated area.

## 🛠️ Tech Stack & Workflow

### 1. Data Source (Excel/CSV)
* **Raw Data:** `apy.csv` containing raw historical crop records.
* **Processed Data:** `crop_production_cleaned(1).csv` and `crop_production_dashboard.xlsx`.

### 2. Data Cleaning & EDA (Python)
* **File:** `Crop_production.ipynb`
* **Process:** Performed using Pandas to handle missing values, remove outliers, and prepare the dataset for visualization.

### 3. Structured Querying (SQL)
* **File:** `crop_analysis.sql`
* **Process:** Used SQL for deep-dive analysis, such as aggregating production by season and calculating state-wise totals.

### 4. Interactive Dashboard (Power BI)
* **File:** `crop_analysis.pbix`
* **Features:** Interactive maps, season-based filters, and crop-specific yield analysis.

## 📁 Repository Structure
* `Crop_production.ipynb`: Python Notebook for data cleaning.
* `crop_analysis.sql`: SQL scripts for data analysis.
* `crop_analysis.pbix`: Final Power BI Dashboard.
* `apy.csv`: Raw dataset.
* `crop_production_cleaned(1).csv`: Cleaned dataset.

## 🚀 How to Use
1. **Python:** Run the `.ipynb` file to see the data cleaning steps.
2. **SQL:** Use the `.sql` file to recreate the analysis in your database.
3. **Power BI:** Open the `.pbix` file (requires Power BI Desktop) to explore the visual dashboard.

---
Developed by [Harsh Jadav](https://github.com/jadavharsh109)
