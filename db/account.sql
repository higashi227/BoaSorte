CREATE TABLE boasorte.account
(
	account_id INT AUTO_INCREMENT PRIMARY KEY,
	mail_address VARCHAR(255) NOT NULL,
	password VARCHAR(255) NOT NULL,
	name TEXT NOT NULL,
	postnum VARCHAR(7) NOT NULL,
	address TEXT NOT NULL,
	birthday VARCHAR(8) NOT NULL,
	telephone VARCHAR(12) NOT NULL,
	recognition ENUM('検索エンジン（Google、yahoo!等）で検索した', '知人からの紹介', 'TVで見た', 'SNSで見た') NOT NULL,
	ok_dm TINYINT(1) NOT NULL,
	created_at DATE NOT NULL,
	updated_at DATE
);
