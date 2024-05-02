DELIMITER //

CREATE TRIGGER limit_gift_per_user
BEFORE INSERT ON gift
FOR EACH ROW
BEGIN
    DECLARE gift_count INT;
    SELECT COUNT(*) INTO gift_count FROM gift WHERE account_id = NEW.account_id;
    IF gift_count >= 5 THEN
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Maximum number of gifts per user reached (5)';
    END IF;
END;
//

DELIMITER ;