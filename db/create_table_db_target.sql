-- Creation of table target
CREATE TABLE IF NOT EXISTS db_target (
  id INT NOT NULL AUTO_INCREMENT,
  creation_date varchar(250),
  sale_value INT,
  PRIMARY KEY (id)
);