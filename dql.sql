-- ex1 CRUD Operations
INSERT INTO patients (first_name, last_name, date_of_birth, gender, phone_number, email, address)
VALUES ('Alex', 'Johnson', '1990-07-15', 'Male', '1234567890', NULL, NULL);

-- ex2 SELECT Statement
SELECT * 
FROM departments;

-- ex3 ORDER BY Clause
SELECT * 
FROM patients 
ORDER BY date_of_birth;

-- ex4 Filtrer les patients uniques par sexe (DISTINCT)
-- SELECT DISTINCT gender, COUNT(*) AS "patients number" FROM patients
SELECT gender, count(*) AS "patients number" 
FROM patients 
GROUP BY gender;

-- ex5 LIMIT Clause
SELECT * 
FROM doctors 
LIMIT 3;

-- ex6 WHERE Clause
SELECT * 
FROM patients 
WHERE date_of_birth 
>= '2000-01-01';

-- ex7 Logical Operators
SELECT doc.* 
FROM doctors AS doc, departments AS dep 
WHERE doc.department_id = dep.department_id
AND dep.department_name = 'Cardiology' 
OR dep.department_name = 'Neurology';

-- ex8 Special Operators
SELECT * 
FROM admissions
WHERE (admission_date >= '2024-12-01') 
AND (admission_date <= '2024-12-07');

-- ex9 Conditional Expressions
SELECT first_name, last_name,  date_of_birth,
CASE 
    WHEN TIMESTAMPDIFF(YEAR, date_of_birth, CURDATE()) < 18 THEN 'Minor'
    WHEN TIMESTAMPDIFF(YEAR, date_of_birth, CURDATE()) < 60 THEN 'Adult'
    ELSE 'Senior'
END AS 'Category'
FROM patients;

-- ex10 AGGREGATE Functions
SELECT COUNT(*) AS "appointments number"
FROM appointments;

-- ex11 COUNT avec GROUP BY
SELECT dep.department_name, COUNT(*) AS "doctors number in department"
FROM doctors AS doc, departments AS dep 
WHERE doc.department_id = dep.department_id
GROUP BY dep.department_name;

    -- I'll insert 3 users to break the uniquity problem here
INSERT INTO doctors (first_name, last_name, specialiazation, phone_number, email, department_id)
VALUES 
	('Sami_1', 'regragui', 'Neurology','551-0102','l.baker1@example.com', 2),
    ('Sami_2', 'frog', 'Cardiology','552-0102','l.baker2@example.com', 2),
    ('Sami_3', 'l7ya', 'Neurology','553-0102','l.baker3@example.com', 3);

SELECT dep.department_name, COUNT(*) AS "doctors number in department"
FROM doctors AS doc, departments AS dep 
WHERE doc.department_id = dep.department_id
GROUP BY dep.department_name;

-- ex12 AVG
SELECT AVG(TIMESTAMPDIFF(YEAR, date_of_birth, CURDATE())) AS "Average age" 
FROM patients;

-- ex13 MAX
SELECT MAX(CONCAT(appointment_date, ' ', appointment_time)) AS "Latest appointment"
FROM appointments;

-- ex14 COUNT (instead of SUM)
SELECT r.room_number, COUNT(a.admission_id) AS "admission number per room"
FROM admissions AS a, rooms AS r
WHERE a.room_id = r.room_id
GROUP BY r.room_number;

    -- again inserting to break the unicity
INSERT INTO admissions (admission_date, discharge_date, patient_id, room_id) VALUES
('2025-03-15',NULL,3,3),
('2025-01-09','2025-01-20',4,1),
('2025-02-02',NULL,5,2);

SELECT r.room_number, COUNT(a.admission_id) AS "admission number per room"
FROM admissions AS a, rooms AS r
WHERE a.room_id = r.room_id
GROUP BY r.room_number;

-- ex15 Constraints
SELECT * 
FROM patients
WHERE email IS NULL;

-- ex16 Jointure
SELECT d.first_name AS "Doctor's name", p.first_name AS "Patient's name"
FROM doctors AS d
JOIN appointments AS a
ON d.doctor_id = a.doctor_id
JOIN patients AS p
ON a.patient_id = p.patient_id;

-- ex17 DELETE
DELETE FROM appointments
WHERE appointment_date <= '2024-01-01';

-- ex18 UPDATE
UPDATE departments
SET department_name = "Cancer Treatment"
WHERE department_name = "Oncology";

-- ex19 HAVING Clause
SELECT COUNT(*) AS `How many are`, gender 
FROM patients
GROUP BY gender
HAVING `How many are` >= 2;

    -- comparison
SELECT COUNT(*) AS `How many are`, gender 
FROM patients
GROUP BY gender;

-- ex20 Créer une vue
CREATE VIEW `Active admissions` AS
SELECT * 
FROM admissions
WHERE (CURDATE() >= admission_date)
AND (CURDATE() <= discharge_date);

	-- inserting for testing purpose 
INSERT INTO admissions (admission_date, discharge_date, patient_id, room_id)
VALUES ('2025-12-01','2025-12-22',1,5);

SELECT *
FROM `Active admissions`;