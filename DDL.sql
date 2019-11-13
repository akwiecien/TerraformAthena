CREATE EXTERNAL TABLE IF NOT EXISTS aviation_industry_database.flights (
  data date,
  airlines int,
  flight_number int,
  origin string,
  destination string,
  departure int,
  departure_delay float,
  arrival int,
  arrival_delay float,
  air_time float,
  distance float
)
ROW FORMAT SERDE 'org.apache.hadoop.hive.serde2.OpenCSVSerde'
WITH SERDEPROPERTIES (
  'serialization.format' = ',',
  'separatorChar' = ',',
  'quoteChar' = '\"'  
) LOCATION 's3://aviation-industry-database-source/flights/'
TBLPROPERTIES ('has_encrypted_data'='false', "skip.header.line.count"="1");



CREATE EXTERNAL TABLE IF NOT EXISTS aviation_industry_database.airlines (
  code int,
  description string
)
ROW FORMAT SERDE 'org.apache.hadoop.hive.serde2.OpenCSVSerde'
WITH SERDEPROPERTIES (
  'serialization.format' = ',',
  'separatorChar' = ',',
  'quoteChar' = '\"'  
) LOCATION 's3://aviation-industry-database-source/airlines/'
TBLPROPERTIES ('has_encrypted_data'='false', "skip.header.line.count"="1");



select * from aviation_industry_database.airlines limit 10;


drop table aviation_industry_database.flights;
drop table aviation_industry_database.airlines;

show tables;