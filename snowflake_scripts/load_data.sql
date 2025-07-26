
-- Step 3: Creating Stage for uploading CSV files
CREATE OR REPLACE STAGE maritime_stage;


-- Step4: Inserting values from staged CSV files
 
 -- Incident_Reports table
COPY INTO MARITIME_REPORTING.INCIDENT_REPORTS
FROM @maritime_stage/incident_reports.csv
FILE_FORMAT = (TYPE = 'CSV' FIELD_OPTIONALLY_ENCLOSED_BY = '"' SKIP_HEADER = 1);

--select * from MARITIME_REPORTING.INCIDENT_REPORTS


-- Ship visit logs table
COPY INTO MARITIME_REPORTING.SHIP_VISIT_LOGS
FROM @maritime_stage/ship_visit_logs.csv
FILE_FORMAT = (TYPE = 'CSV' FIELD_OPTIONALLY_ENCLOSED_BY = '"' SKIP_HEADER = 1);


-- select * from MARITIME_REPORTING.SHIP_VISIT_LOGS


-- Compliance scores table
COPY INTO MARITIME_REPORTING.COMPLIANCE_SCORES
FROM @maritime_stage/compliance_scores.csv
FILE_FORMAT = (TYPE = 'CSV' FIELD_OPTIONALLY_ENCLOSED_BY = '"' SKIP_HEADER = 1);


-- select * from MARITIME_REPORTING.COMPLIANCE_SCORES


-- Training Records table
INSERT INTO MARITIME_REPORTING.TRAINING_RECORDS (
    EMPLOYEE_ID, ROLE, TRAINING_TYPE, COMPLETION_DATE, IS_MANDATORY
) VALUES
(1001, 'Officer', 'Safety', '2024-02-10', TRUE),
(1002, 'Crew', 'Environmental', '2024-03-15', TRUE),
(1003, 'Inspector', 'Security', '2024-04-01', TRUE),
(1004, 'Crew', 'Safety', '2024-05-05', FALSE),
(1005, 'Officer', 'Health', '2024-03-28', TRUE),
(1006, 'Inspector', 'Environmental', '2024-06-02', TRUE),
(1007, 'Crew', 'Health', '2024-01-18', TRUE),
(1008, 'Officer', 'Security', '2024-02-25', FALSE),
(1009, 'Crew', 'Safety', '2024-06-10', TRUE),
(1010, 'Inspector', 'Health', '2024-04-20', TRUE);

-- select * from MARITIME_REPORTING.TRAINING_RECORDS


-- Step 4: Creating Stage for uploading parquet files
CREATE OR REPLACE STAGE my_parquet_stage;

CREATE OR REPLACE FILE FORMAT parquet_format
  TYPE = 'PARQUET';

CREATE OR REPLACE TABLE fleet_compliance_table (
  ship_id STRING,
  visit_date DATE,
  port_code STRING,
  bbsc_score NUMBER(5,2),
  chess_compliance STRING,
  compliance_flag BOOLEAN
);

COPY INTO fleet_compliance_table
FROM @my_parquet_stage
FILE_FORMAT = (FORMAT_NAME = 'parquet_format')
MATCH_BY_COLUMN_NAME = CASE_INSENSITIVE;

-- Step 4: Query the data
SELECT * FROM fleet_compliance_table;




--- Creating json stage
CREATE OR REPLACE STAGE json_stage;

CREATE OR REPLACE TABLE fleet_events_raw (
  raw VARIANT
);

COPY INTO fleet_events_raw
FROM @json_stage
FILE_FORMAT = (TYPE = 'JSON');


--Quering from json files
SELECT
  raw:ship_id::STRING AS ship_id,
  raw:event_date::DATE AS event_date,
  raw:event_type::STRING AS event_type,
  raw:officer.name::STRING AS officer_name,
  raw:officer.rank::STRING AS officer_rank
FROM fleet_events_raw;

