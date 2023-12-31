DELIMITER //
CREATE TRIGGER set_default_approve
BEFORE INSERT ON `afs`.`users`
FOR EACH ROW
BEGIN
  IF NEW.role_id = 4 THEN
    SET NEW.approve = 0;
  ELSE
    SET NEW.approve = 1;
  END IF;
END;
//
DELIMITER ;


DELIMITER //
CREATE TRIGGER update_funds_on_art_sold
AFTER UPDATE ON `afs`.`arts`
FOR EACH ROW
BEGIN
  IF NEW.status = 'sold' AND OLD.status = 'unsold' THEN
    CALL UpdateFundsForSoldArt(NEW.art_id, NEW.ngo_id, NEW.price);
  END IF;
END;
//
DELIMITER ;


DELIMITER //
CREATE TRIGGER update_art_status_after_order_insert
AFTER INSERT ON `afs`.`order_details`
FOR EACH ROW
BEGIN
    -- Update the status of the artwork to 'sold'
    UPDATE `afs`.`arts`
    SET status = 'sold'
    WHERE art_id = NEW.art_id;
END;
//
DELIMITER ;