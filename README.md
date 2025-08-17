**🍽️ Zomato Restaurant Data Analysis**
**📌 Project Overview**

This project analyzes Zomato restaurant data using SQL, Python, and Power BI to extract actionable business insights.
It covers:

SQL Queries → Extract insights from raw data (engagement, pricing bands, outliers).

Python Analysis → Data cleaning, EDA, hypothesis testing, clustering, and feature importance.

Power BI Dashboard → Interactive visual storytelling with KPIs, filters, and funnel analysis.

⚙️ Tech Stack

SQL (MySQL Workbench) → Data extraction, aggregations, funnel queries

Python → pandas, matplotlib, sklearn, scipy

Power BI → Dashboard creation & storytelling

**📊 Analysis Workflow**
**1️⃣ SQL Analysis**

Key queries include:

Restaurant count by Type

Avg Rating by Online Order & Table Booking

Top Restaurants by Votes

Pricing Band Performance (<₹300, ₹300–599, ₹600–899, ₹900+)

Online × Type interaction (pivot)

Rating distribution bins


**2️⃣ Python Analysis**

Data Cleaning:

Fixed inconsistent ratings ("4.1/5" → 4.1, "NEW"/"-" → NULL)

Converted cost (with commas) to numeric

Standardized online_order & book_table to booleans

Exploratory Data Analysis (EDA):

Rating distribution

Votes distribution

Cost vs Rating patterns

Online vs Offline performance

Hypothesis Testing:

Online-order restaurants have significantly higher ratings (t-test, p < 0.00001)

Advanced Analysis:

Feature importance (Random Forest) for predicting High Rating

Customer segmentation (KMeans clustering)

Correlation heatmap

**3️⃣ Power BI Dashboard**

KPIs:

Total Restaurants

Avg Rating

% with Online Order

% with Table Booking

Avg Votes

Visuals:

Bar chart: Restaurants by Type

Funnel chart: Awareness → Consideration → Conversion → Satisfaction

Scatter plot: Cost vs Rating (bubble = Votes)

Histogram: Ratings distribution

Price Band analysis

Slicers: Type, Location, Price Band, Online Order

**🚀 Funnel Analysis**

Stages Defined:

Awareness → Total restaurants

Consideration → Avg Votes (engagement proxy)

Conversion → Restaurants with Online Order/Table Booking

Satisfaction → Avg Ratings, Outliers

Insight: Restaurants with Online Ordering average 0.37 higher rating than offline ones.

**📈 Results & Insights**

Online Order drives engagement & ratings → Restaurants with online ordering average 3.86 vs 3.49 for offline.

Sweet spot pricing → Restaurants in the ₹300–599 range balance affordability & good ratings.

Outliers identified → Expensive but poorly rated restaurants (targets for operational improvement).

Cuisines segmentation → Popular cuisines correlate strongly with higher votes.
