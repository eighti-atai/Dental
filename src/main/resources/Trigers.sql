USE `dental`;

DELIMITER $$

DROP TRIGGER IF EXISTS dental.appointment_tab_BEFORE_INSERT$$
USE `dental`$$
CREATE DEFINER= CURRENT_USER TRIGGER `dental`.`appointment_tab_BEFORE_INSERT` BEFORE INSERT ON `appointment_tab` FOR EACH ROW
BEGIN
SET NEW.appointment_id = (
       SELECT IFNULL(MAX(appointment_id), 0) + 1
       FROM appointment_tab
       WHERE patient_id  = NEW.patient_id
    );
END$$

DELIMITER ;

-- ----------------------------------------------------------------------------------------------
DELIMITER $$

DROP TRIGGER IF EXISTS dental.attend_patient_tab_BEFORE_INSERT$$
USE `dental`$$
CREATE DEFINER=CURRENT_USER TRIGGER `dental`.`attend_patient_tab_BEFORE_INSERT` BEFORE INSERT ON `attend_patient_tab` FOR EACH ROW
BEGIN
SET NEW.attend_patient_id = (
       SELECT IFNULL(MAX(attend_patient_id), 0) + 1
       FROM attend_patient_tab
       WHERE patient_id  = NEW.patient_id
    );
END$$
DELIMITER ;

-- -----------------------------------------------------------------------------------------------

DELIMITER $$

DROP TRIGGER IF EXISTS dental.treatment_tab_BEFORE_INSERT$$
USE `dental`$$
CREATE DEFINER=CURRENT_USER TRIGGER `dental`.`treatment_tab_BEFORE_INSERT` BEFORE INSERT ON `treatment_tab` FOR EACH ROW
BEGIN
SET NEW.treatment_id = (
       SELECT IFNULL(MAX(treatment_id), 0) + 1
       FROM treatment_tab
       WHERE treatment_id  = NEW.treatment_id
    );
END$$
DELIMITER ;

DELIMITER $$

-- ----------------------------------------------------------------------------------------------

DELIMITER $$

DROP TRIGGER IF EXISTS dental.payment_tab_BEFORE_INSERT$$
USE `dental`$$
CREATE DEFINER = CURRENT_USER TRIGGER `dental`.`payment_tab_BEFORE_INSERT` BEFORE INSERT ON `payment_tab` FOR EACH ROW
BEGIN
SET NEW.payment_no = (
       SELECT IFNULL(MAX(payment_no), 0) + 1
       FROM payment_tab
       WHERE patient_id  = NEW.patient_id
       AND 	 treatment_id = NEW.treatment_id
    );
END$$
DELIMITER ;
