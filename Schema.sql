-- 📦 equipment_master: Stores information about each equipment unit
CREATE TABLE `equipment_master` (
  `EQUIPMENT_ID` VARCHAR(50) NOT NULL,
  `equipment_class` VARCHAR(50) DEFAULT NULL,
  `MAKE` VARCHAR(255) DEFAULT NULL,
  `MODEL` VARCHAR(255) DEFAULT NULL,
  PRIMARY KEY (`EQUIPMENT_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- 📅 maint_schedule: Preventive maintenance schedule linked to equipment
CREATE TABLE `maint_schedule` (
  `SCHEDULE_ID` VARCHAR(50) DEFAULT NULL,
  `EQUIPMENT_ID` VARCHAR(50) DEFAULT NULL,
  `sap_pm_code` VARCHAR(255) DEFAULT NULL,
  `HMR` INT DEFAULT NULL,
  `maint_interval` INT DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- 🛠️ maint_order: Tracks maintenance activities performed on equipment
CREATE TABLE `maint_order` (
  `ORDER_ID` VARCHAR(50) NOT NULL,
  `EQUIPMENT_ID` VARCHAR(50) DEFAULT NULL,
  `order_type` VARCHAR(50) DEFAULT NULL,
  `order_date` DATE DEFAULT NULL,
  `job_start` DATE DEFAULT NULL,
  `finish_date` DATE DEFAULT NULL,
  `days_gap` INT DEFAULT NULL,
  `PRIORITY` VARCHAR(255) DEFAULT NULL,
  `priority_code` VARCHAR(50) DEFAULT NULL,
  PRIMARY KEY (`ORDER_ID`),
  KEY `fk_order_equipment` (`EQUIPMENT_ID`),
  CONSTRAINT `fk_order_equipment`
    FOREIGN KEY (`EQUIPMENT_ID`) REFERENCES `equipment_master` (`EQUIPMENT_ID`)
    ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- 💰 cost_tracking: Captures cost-related information for each order
CREATE TABLE `cost_tracking` (
  `ORDER_ID` VARCHAR(50) NOT NULL,
  `planned_cost` INT DEFAULT NULL,
  `actual_cost` INT DEFAULT NULL,
  `DIFFERENCE` DOUBLE DEFAULT NULL,
  PRIMARY KEY (`ORDER_ID`),
  CONSTRAINT `fk_cost_order`
    FOREIGN KEY (`ORDER_ID`) REFERENCES `maint_order` (`ORDER_ID`)
    ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- 🔧 job_details: Assembly-level breakdown for maintenance tasks
CREATE TABLE `job_details` (
  `EQUIPMENT_ID` VARCHAR(50) DEFAULT NULL,
  `ASSEMBLY` VARCHAR(50) DEFAULT NULL,
  `SUB_ASSEMBLY` VARCHAR(255) DEFAULT NULL,
  `DESCRIPTION` VARCHAR(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
