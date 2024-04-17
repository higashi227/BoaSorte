CREATE TABLE boasorte.item
(
	item_id INT AUTO_INCREMENT PRIMARY KEY,
	name VARCHAR(50) NOT NULL,
	price INT NOT NULL,
	is_coffee TINYINT(1) NOT NULL
);