CREATE TABLE answers (
	code varchar(9) NOT NULL,
	year varchar(5) NOT NULL,
	question varchar(10) NOT NULL,
	answer varchar(250) NOT NULL,
	username varchar(14)
);

INSERT INTO answers VALUES ('HIST106', '2019', '3', 'Metropolitan', 'HOOLE857');
INSERT INTO answers VALUES ('HIST106', '2019', '5', 'Internal conflict', 'HOOLE857');
INSERT INTO answers VALUES ('HIST106', '2019', '1', 'Trade, Culture and Religion', 'HOOLE857');
INSERT INTO answers VALUES ('HIST108', '2015', '2', 'Extensive', NULL);
INSERT INTO answers VALUES ('HIST108', '2015', '4', 'Economy and Technology', 'WALAM543');
INSERT INTO answers VALUES ('COMP150', '2013', '8', 'E', 'WALMA430');
INSERT INTO answers VALUES ('COMP150', '2013', '4', 'A', 'KINST520');
