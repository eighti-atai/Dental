CREATE TABLE IF NOT EXISTS dental.payment_tab(
patient_id INT(11) NOT NULL,
treatment_id INT(11) NOT NULL,
payment_no INT(20) NOT NULL,
payment_date date NOT NULL,
payment_type VARCHAR(10) NOT NULL,
payment_method VARCHAR(10) NOT NULL,
amount DECIMAL(10,2) NOT NULL,
cheque_no VARCHAR(20),
cheque_exp_date DATE,
cheque_bank VARCHAR(20),
objid VARCHAR(1000) NOT NULL,
PRIMARY KEY(patient_id, treatment_id, payment_no));