-- 📊 Queries

-- Top 3 most expensive maintenance jobs
SELECT DISTINCT
    mo.order_id, em.equipment_id, ct.actual_cost
FROM
    maint_order mo
JOIN cost_tracking ct ON mo.order_id = ct.order_id
JOIN equipment_master em ON mo.equipment_id = em.equipment_id
ORDER BY ct.actual_cost DESC
LIMIT 3;



-- Cost variance per order
SELECT 
    mo.equipment_id,
    mo.order_id,
    ct.planned_cost,
    ct.actual_cost,
    (ct.actual_cost - ct.planned_cost) AS cost_variance
FROM
    maint_order mo
JOIN cost_tracking ct ON mo.order_id = ct.order_id
LIMIT 50;



-- Percentage of HIGH priority orders
SELECT 
  CONCAT(
    ROUND(
      SUM(CASE WHEN UPPER(priority) = 'HIGH' THEN 1 ELSE 0 END) * 100 / COUNT(*),
      2
    ), '%'
  ) AS high_priority_order_percentage
FROM maint_order;



-- Maintenance History View
CREATE VIEW maintenance_history AS
SELECT 
  mo.order_id,
  mo.EQUIPMENT_ID,
  ms.schedule_id,
  ct.actual_cost
FROM
  maint_order mo
JOIN cost_tracking ct ON ct.order_id = mo.order_id
JOIN maint_schedule ms ON ms.EQUIPMENT_ID = mo.EQUIPMENT_ID;

-- View Result
SELECT * FROM maintenance_history;

-- View Result
SELECT * FROM maintenance_history;

-- 📊 Maintenance History Output
![Maintenance History](https://github.com/HybridSatyam/Maintenance_Dashboard/blob/main/images/Maintenance_history.png?raw=true)

