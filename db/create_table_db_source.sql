-- Creation of table source
CREATE TABLE IF NOT EXISTS db_source (
  id SERIAL PRIMARY KEY,
  creation_date VARCHAR,
  sale_value INT
);