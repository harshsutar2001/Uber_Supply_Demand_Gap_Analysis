# 🚖 Uber Supply Demand Gap Analysis
📋 Project Overview

This project analyzes the demand–supply gap in Uber rides with a focus on time-based ride performance — including ride requests, cancellations, and car availability.
By studying how these metrics vary across different time slots (morning, afternoon, evening, night), the goal is to help Uber improve its driver allocation strategy and minimize customer dissatisfaction.

💼 Business Problem

Uber faces a recurring challenge where customer ride requests exceed the number of available cars, especially during peak hours.
This results in:
High cancellation rates
More instances of “No Cars Available”
Increased waiting time for users
This project aims to quantify and visualize these issues, identify critical time slots, and propose data-backed recommendations for improvement.

🎯 Objectives

Analyze ride requests time-wise (early morning, morning rush, day, evening rush, night).
Identify when cancellations and no car available cases are highest.
Calculate demand vs supply ratio for each time slot.
Suggest strategies to minimize the demand gap.

🧰 Tools & Technologies Used

Excel – Initial data cleaning, time categorization, and pivot analysis
SQL – Querying data for time-wise trends and percentage calculations
Python (Pandas, NumPy, Matplotlib, Seaborn) – Exploratory Data Analysis (EDA) and visualization

🔍 Key Analysis Performed

Segmented rides into time slots to compare demand and supply.

Calculated percentages of completed, cancelled, and unavailable rides per time category.
Visualized the peak hours for cancellations and unavailability.
Identified potential operational bottlenecks affecting ride availability.

📈 Insights & Findings

Most “No Cars Available” issues occur during office hours due to low driver supply.
High cancellation rates during peak hours suggest poor driver distribution.
Improving driver allocation in specific zones and time slots can significantly reduce cancellations.

💡 Recommendations

Introduce driver incentives during high-demand slots.
Use real-time data monitoring for demand prediction.
Increase driver availability near airport and business zones during peak times.

📂 Project Structure
Uber_Demand_Gap_Analysis/
│
├── data/
│   └── uber_data.xlsx
├── sql_queries/
│   └── timewise_analysis.sql
├── notebooks/
│   └── uber_demand_gap_analysis.ipynb
├── visuals/
│   └── timewise_demand_chart.png
├── README.md
└── requirements.txt
