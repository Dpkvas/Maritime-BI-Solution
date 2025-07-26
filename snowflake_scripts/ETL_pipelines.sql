CREATE OR REPLACE PROCEDURE RAW.load_incidents()
RETURNS STRING
LANGUAGE SQL
AS
$$
BEGIN

  -- Load from stage into RAW.incident_staging
  COPY INTO RAW.incident_staging
  FROM @RAW.incident_stage
  FILE_FORMAT = (FORMAT_NAME = 'RAW.csv_format')
  MATCH_BY_COLUMN_NAME = CASE_INSENSITIVE;

  -- Merge into MARITIME_REPORTING.incident_master
  MERGE INTO MARITIME_REPORTING.incident_master AS target
  USING RAW.incident_staging AS source
  ON target.incident_id = source.incident_id

  WHEN MATCHED THEN UPDATE SET
    target.incident_type = source.incident_type,
    target.ship_name = source.ship_name,
    target.reported_date = source.reported_date,
    target.resolved_date = source.resolved_date,
    target.severity_level = source.severity_level,
    target.reported_by_team = source.reported_by_team,
    target.status = source.status

  WHEN NOT MATCHED THEN INSERT (
    incident_id, incident_type, ship_name, reported_date,
    resolved_date, severity_level, reported_by_team, status
  ) VALUES (
    source.incident_id, source.incident_type, source.ship_name,
    source.reported_date, source.resolved_date, source.severity_level,
    source.reported_by_team, source.status
  );

  RETURN 'SUCCESS';
END;
$$;


-- CALL RAW.load_incidents();

-- Create Task

CREATE OR REPLACE TASK RAW.incident_loader_task
  WAREHOUSE = BI_WH
  SCHEDULE = 'USING CRON 0 2 * * * UTC' 
AS
CALL RAW.load_incidents();


select * from maritime_reporting.incident_master
