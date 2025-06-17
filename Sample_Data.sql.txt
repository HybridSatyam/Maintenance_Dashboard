-- ✅ Sample Data

INSERT INTO equipment_master (EQUIPMENT_ID, equipment_class, MAKE, MODEL) VALUES
('EQ-BEM-GRA-0006', 'GRADER', 'BEML', 'BG605'),
('EQ-HIT-EXC-0010', 'EXCAVATOR', 'HITACHI', 'EX200');

INSERT INTO maint_schedule (SCHEDULE_ID, EQUIPMENT_ID, sap_pm_code, HMR, maint_interval) VALUES
('MS0001', 'EQ-BEM-GRA-0006', 'PM03', 2583, 1000),
('MS0002', 'EQ-HIT-EXC-0010', 'PM05', 6757, 1000);

INSERT INTO maint_order (
  order_id, EQUIPMENT_ID, order_type, order_date,
  job_start, finish_date, days_gap, PRIORITY, priority_code
) VALUES
('ORD001', 'EQ-BEM-GRA-0006', 'CORRECTIVE MAINT', '2025-05-16', '2025-05-18', '2025-05-18', 2, 'HIGH', '2'),
('ORD002', 'EQ-HIT-EXC-0010', 'REFURB/MAJOR MAINT', '2025-05-03', '2025-05-06', '2025-05-06', 3, 'CRITICAL.', '1');

INSERT INTO cost_tracking (order_id, planned_cost, actual_cost, DIFFERENCE) VALUES
('ORD001', 171292, 174597, 3305),
('ORD002', 69465, 80505, 11040);

INSERT INTO job_details (EQUIPMENT_ID, ASSEMBLY, SUB_ASSEMBLY, DESCRIPTION) VALUES
('EQ-BEM-GRA-0006', 'BRAKE SYSTEM', 'SERVICE BRAKES', 'Brake pad wear beyond limit, replaced.'),
('EQ-HIT-EXC-0010', 'BRAKE SYSTEM', 'SERVICE BRAKES', 'Brake pad wear beyond limit, replaced.');

