CREATE TABLE boasorte.gift
(
	gift_id INT AUTO_INCREMENT PRIMARY KEY,
	account_id INT ,
	gname TEXT NOT NULL,
	gpostnum VARCHAR(7) NOT NULL,
	gaddress TEXT NOT NULL,
	FOREIGN KEY(account_id) REFERENCES boasorte.account(account_id)
);