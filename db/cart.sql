CREATE TABLE boasorte.cart
(
	cart_id INT AUTO_INCREMENT PRIMARY KEY,
	account_id INT NOT NULL,
	item_id INT NOT NULL,
	quantity INT NOT NULL,
	FOREIGN KEY(account_id) REFERENCES boasorte.account(account_id),
	FOREIGN KEY(item_id) REFERENCES boasorte.item(item_id)
);