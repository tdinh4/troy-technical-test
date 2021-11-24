-- Creation of table source
CREATE TABLE IF NOT EXISTS db_source (
  id INT NOT NULL AUTO_INCREMENT,
  creation_date varchar(250),
  sale_value INT,
  PRIMARY KEY (id)
);