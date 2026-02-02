/* =========================================================
   ADIDAS SALES – DAY & WEEK DENSITY ANALYSIS
   Mini Project 3 (SQL + Power BI)
   ========================================================= */

/* =========================================================
   01) DATABASE & RAW TABLE
   ========================================================= */

CREATE DATABASE IF NOT EXISTS adidas_sales;
USE adidas_sales;

DROP TABLE IF EXISTS sales_raw;

CREATE TABLE sales_raw (
  Retailer            VARCHAR(50),
  Retailer_ID         INT,
  Invoice_Date        DATE,
  Region              VARCHAR(30),
  State               VARCHAR(30),
  City                VARCHAR(30),
  Product             VARCHAR(80),
  Price_per_Unit      DECIMAL(10,2),
  Units_Sold          INT,
  Total_Sales         DECIMAL(12,2),
  Operating_Profit    DECIMAL(12,2),
  Sales_Method        VARCHAR(20)
);

/* =========================================================
   02) LOAD CSV DATA
   Source file:
   C:/ProgramData/MySQL/MySQL Server 8.0/Uploads/adidas_sales_cleaned.csv
   ========================================================= */

TRUNCATE TABLE sales_raw;

LOAD DATA INFILE
'C:/ProgramData/MySQL/MySQL Server 8.0/Uploads/adidas_sales_cleaned.csv'
INTO TABLE sales_raw
FIELDS TERMINATED BY ','
ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS
(
  Retailer,
  Retailer_ID,
  Invoice_Date,
  Region,
  State,
  City,
  Product,
  @Price_per_Unit,
  @Units_Sold,
  @Total_Sales,
  @Operating_Profit,
  Sales_Method
)
SET
  Price_per_Unit    = NULLIF(@Price_per_Unit, ''),
  Units_Sold        = NULLIF(@Units_Sold, ''),
  Total_Sales       = NULLIF(@Total_Sales, ''),
  Operating_Profit  = NULLIF(@Operating_Profit, '');

/* =========================================================
   03) CLEAN / REPORT-FRIENDLY VIEW
   ========================================================= */

CREATE OR REPLACE VIEW v_sales_clean AS
SELECT
  Retailer,
  Retailer_ID,
  Invoice_Date,
  COALESCE(NULLIF(Region, ''), 'Unknown') AS Region,
  State,
  City,
  Product,
  Price_per_Unit,
  COALESCE(Units_Sold, 0) AS Units_Sold,
  COALESCE(Total_Sales, 0) AS Total_Sales,
  COALESCE(Operating_Profit, 0) AS Operating_Profit,
  Sales_Method
FROM sales_raw
WHERE Invoice_Date IS NOT NULL;

/* =========================================================
   04) DAY-OF-WEEK DENSITY VIEW (FIXED: Monday=1)
   ========================================================= */

CREATE OR REPLACE VIEW v_sales_density_by_day AS
SELECT
  DAYNAME(Invoice_Date) AS day_name,
  WEEKDAY(Invoice_Date) + 1 AS day_number,   -- Monday=1 ... Sunday=7
  COUNT(*) AS total_transactions,
  SUM(Units_Sold) AS total_units_sold,
  SUM(Total_Sales) AS total_sales
FROM v_sales_clean
GROUP BY
  DAYNAME(Invoice_Date),
  WEEKDAY(Invoice_Date) + 1;

/* =========================================================
   05) WEEK DENSITY VIEW (FIXED: week_start_date for multi-year)
   - Avoid week_number-only axis issue across multiple years
   ========================================================= */

CREATE OR REPLACE VIEW v_sales_density_by_week AS
SELECT
  YEAR(Invoice_Date) AS sales_year,
  WEEK(Invoice_Date, 1) AS week_number,

  /* ISO week start date (Monday) to use as timeline axis in Power BI */
  STR_TO_DATE(
    CONCAT(
      YEAR(Invoice_Date), '-',
      LPAD(WEEK(Invoice_Date, 1), 2, '0'),
      '-1'
    ),
    '%X-%V-%w'
  ) AS week_start_date,

  COUNT(*) AS total_transactions,
  SUM(Units_Sold) AS total_units_sold,
  SUM(Total_Sales) AS total_sales
FROM v_sales_clean
GROUP BY
  sales_year,
  week_number,
  week_start_date;

/* =========================================================
   06) REPORTING LAYER (FOR POWER BI)
   ========================================================= */

CREATE DATABASE IF NOT EXISTS adidas_reporting;
USE adidas_reporting;

CREATE OR REPLACE VIEW v_sales_density_by_day
AS SELECT * FROM adidas_sales.v_sales_density_by_day;

CREATE OR REPLACE VIEW v_sales_density_by_week
AS SELECT * FROM adidas_sales.v_sales_density_by_week;