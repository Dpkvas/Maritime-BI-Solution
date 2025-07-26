USE DATABASE FLEET_COMPLIANCE_DB;
Use schema MARITIME_REPORTING

CREATE OR REPLACE TABLE fleet_compliance_clone CLONE fleet_compliance_table;

select * from fleet_compliance_table

INSERT INTO fleet_compliance_clone VALUES
('SHIP999', '2025-08-01', 'NEW', 97.5, 'Compliant', TRUE);


UPDATE fleet_compliance_clone
SET bbsc_score = 99.9
WHERE ship_id = 'SHIP001';

MERGE INTO fleet_compliance_table AS target
USING fleet_compliance_clone AS source
ON target.ship_id = source.ship_id AND target.visit_date = source.visit_date 
WHEN MATCHED THEN UPDATE SET
  target.bbsc_score = source.bbsc_score,
  target.port_code = source.port_code,
  target.chess_compliance = source.chess_compliance,
  target.compliance_flag = source.compliance_flag

WHEN NOT MATCHED THEN INSERT (
  ship_id, visit_date, port_code, bbsc_score, chess_compliance, compliance_flag
) VALUES (
  source.ship_id, source.visit_date, source.port_code,
  source.bbsc_score, source.chess_compliance, source.compliance_flag
);


DROP TABLE IF EXISTS fleet_compliance_clone;

SELECT CURRENT_TIMESTAMP();


SELECT * FROM INCIDENT_REPORTS
AT (TIMESTAMP => '2025-07-19 06:35:16');


SELECT * FROM fleet_compliance_table
AT (OFFSET => -60 * 20); 
