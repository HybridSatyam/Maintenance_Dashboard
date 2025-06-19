# 🛠️ Maintenance Dashboard

A complete SQL-based project to track and visualize preventive and corrective maintenance of heavy equipment. This project showcases schema design, realistic sample data, optimized queries, and visual insights for data-driven maintenance decisions.

---

## 📂 Project Structure

```
Maintenance-Dashboard/
├── README.md                  ← this file
├── schema.sql                 ← table creation statements
├── sample_data.sql            ← sample insert data
├── dashboard_query.sql        ← all important analysis queries
├── images/                    ← contains dashboard and query preview images
│   ├── dashboard_preview.png
│   ├── query_high_priority.png
│   ├── query_cost_variance.png
│   └── query_top_expensive.png
```

---

## 🧱 Database Schema

This project consists of the following tables:

📦 equipment_master
Stores unique information about each equipment unit such as class, make, and model.

📅 maint_schedule
Defines planned maintenance schedules based on HMR (Hour Meter Reading) and intervals for each equipment.

🛠️ maint_order
Logs actual maintenance activity including dates, order type, priority, and duration.

💰 cost_tracking
Tracks cost-related details for each maintenance order, including planned vs. actual cost and variance.

🔧 job_details
Provides a breakdown of assemblies and sub-assemblies involved in maintenance work for each equipment.



## 📥 Sample Data

All tables are pre-populated with meaningful examples in `sample_data.sql`. Example:

```sql
INSERT INTO equipment_master VALUES
('EQ-BEM-GRA-0006', 'GRADER', 'BEML', 'BG605');

```

🧾 About the Database
This entire database is designed specifically to power an upcoming Power BI dashboard that provides deep insights into the maintenance performance of heavy earth-moving machinery (HEMM).



🏭 Industrial Relevance
This database is inspired by real-world industrial parameters, particularly from the HEMM (Heavy Earth Moving Machinery) and mining sector.
Although sample values have been anonymized and modified for security, the structure and insights closely reflect practical scenarios encountered in field operations.

## 🚀 How to Use

### 1. Import the schema

```bash
mysql -u HybridSatyam -p Maintenance_Dashboard < Schema.sql
```

### 2. Load the sample data

```bash
mysql -u HybridSatyam -p Maintenance_Dashboard < Sample_data.sql
```

### 3. Run dashboard queries

Use MySQL Workbench to test `Dashboard_query.sql`

---

## 🛡️ Best Practices Used

* Relational constraints (PK-FK)
* Data validation and normalization
* Use of indexes and keys
* Sample view creation
* Real-world data structure

---

## 👨‍💻 Author

**Satyam Kumar Singh**
Hybrid Mechanical Engineer|Data Analyst


---

## 📎 License

MIT License – free to use and contribute.

## 📊 Dashboard Preview

> 🔍 Developed in MySQL Workbench tool to visualize trends, priorities, cost variance, and order timelines.

![Dashboard Overview](https://github.com/HybridSatyam/Maintenance_Dashboard/blob/main/Maintenance_dashboard.png?raw=true)
