-- Creation of table target
CREATE TABLE IF NOT EXISTS db_target (
  id SERIAL PRIMARY KEY,
  creation_date VARCHAR,
  sale_value INT
);