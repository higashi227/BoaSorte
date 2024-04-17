CREATE TABLE boasorte.order
(
	order_id INT AUTO_INCREMENT PRIMARY KEY,
	account_id INT NOT NULL,
	item_id INT NOT NULL,
	quantity INT NOT NULL,
	price INT NOT NULL,
	postage INT NOT NULL,
	coffee_status ENUM('豆のまま', '細挽き', '中挽き', '粗挽き'),
	created_at DATE NOT NULL,
	updated_at DATE,
	FOREIGN KEY(account_id) REFERENCES boasorte.account(account_id),
	FOREIGN KEY(item_id) REFERENCES boasorte.item(item_id)
);