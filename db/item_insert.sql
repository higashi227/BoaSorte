INSERT INTO boasorte.item (name, price, is_coffee) VALUES ('ブルーマウンテン', 1297, 1);
INSERT INTO boasorte.item (name, price, is_coffee) VALUES ('キリマンジャロ', 1112, 1);
INSERT INTO boasorte.item (name, price, is_coffee) VALUES ('コナ', 926, 1);
INSERT INTO boasorte.item (name, price, is_coffee) VALUES ('ドーナツ', 463, 0);
INSERT INTO boasorte.item (name, price, is_coffee) VALUES ('フロランタン', 556, 0);
INSERT INTO boasorte.item (name, price, is_coffee) VALUES ('クッキー', 364, 0);

--ここから追加
ALTER TABLE boasorte.item
ADD COLUMN image_path VARCHAR(255);

UPDATE boasorte.item
SET image_path = CASE 
    WHEN name = 'ブルーマウンテン' THEN 'img/coffee01.jpg'
    WHEN name = 'キリマンジャロ' THEN 'img/coffee03.jpg'
    WHEN name = 'コナ' THEN 'img/coffee04.jpg'
    WHEN name = 'ドーナツ' THEN 'img/donut01.jpg'
    WHEN name = 'フロランタン' THEN 'img/florentin01.jpg'
    WHEN name = 'クッキー' THEN 'img/cookie01.jpg'
    ELSE NULL
END;


