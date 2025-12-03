CREATE DATABASE UCC;

USE UCC;

CREATE TABLE admissions (
    admission_id INT PRIMARY KEY AUTO_INCREMENT,
    admission_date DATE NOT NULL,
    discharge_date DATE,

    patient_id INT NOT NULL,
    room_id INT NOT NULL
);

CREATE TABLE rooms (
    room_id INT PRIMARY KEY AUTO_INCREMENT,
    room_number VARCHAR(10) UNIQUE NOT NULL,
    room_type ENUM('General', 'Private', 'ICU') NOT NULL,
    availability TINYINT CHECK (availability = 0 OR availability = 1)
);

CREATE TABLE staff (
    staff_id INT PRIMARY KEY AUTO_INCREMENT,
    first_name VARCHAR(50) NOT NULL,
    last_name VARCHAR(50) NOT NULL,
    job_title VARCHAR(50),
    phone_number VARCHAR(15) UNIQUE NOT NULL,
    email VARCHAR(100) UNIQUE NOT NULL,

    department_id INT NOT NULL
);

CREATE TABLE patients (
    patient_id INT PRIMARY KEY AUTO_INCREMENT,
    first_name VARCHAR(50) NOT NULL,
    last_name VARCHAR(50) NOT NULL,
    gender ENUM('Male', 'Female', 'Other'),
    date_of_birth DATE,
    phone_number VARCHAR(15) UNIQUE NOT NULL,
    email VARCHAR(100) UNIQUE,
    address VARCHAR(255)
);

CREATE TABLE appointments (
    appointment_id INT PRIMARY KEY AUTO_INCREMENT,
    appointment_date DATE NOT NULL,
    appointment_time TIME NOT NULL,
    reason VARCHAR(255),

    doctor_id INT NOT NULL,
    patient_id INT NOT NULL
);

CREATE TABLE departments (
    department_id INT PRIMARY KEY AUTO_INCREMENT,
    department_name VARCHAR(50) UNIQUE NOT NULL,
    location VARCHAR(100) NOT NULL
);

CREATE TABLE prescriptions (
    prescription_id INT PRIMARY KEY AUTO_INCREMENT,
    prescription_date DATE NOT NULL,
    dosage_instructions VARCHAR(255),

    patient_id INT NOT NULL,
    doctor_id INT NOT NULL,
    medication_id INT NOT NULL
);

CREATE TABLE medications (
    medication_id INT PRIMARY KEY AUTO_INCREMENT,
    medication_name VARCHAR(100) UNIQUE NOT NULL,
    dosage VARCHAR(50) NOT NULL
);

CREATE TABLE doctors (
    doctor_id INT PRIMARY KEY AUTO_INCREMENT,
    first_name VARCHAR(50) NOT NULL,
    last_name VARCHAR(50) NOT NULL,
    specialiazation VARCHAR(50),
    phone_number VARCHAR(15) UNIQUE NOT NULL,
    email VARCHAR(100) UNIQUE NOT NULL,

    department_id INT NOT NULL
);

ALTER TABLE admissions
ADD CONSTRAINT admissions_patients 
FOREIGN KEY (patient_id)
REFERENCES patients(patient_id);

ALTER TABLE admissions
ADD CONSTRAINT admissions_rooms 
FOREIGN KEY (room_id)
REFERENCES rooms(room_id);

ALTER TABLE appointments
ADD CONSTRAINT appointments_patients 
FOREIGN KEY (patient_id)
REFERENCES patients(patient_id);

ALTER TABLE appointments
ADD CONSTRAINT appointments_doctors 
FOREIGN KEY (doctor_id)
REFERENCES doctors(doctor_id);

ALTER TABLE prescriptions
ADD CONSTRAINT prescriptions_patients 
FOREIGN KEY (patient_id)
REFERENCES patients(patient_id);

ALTER TABLE prescriptions
ADD CONSTRAINT prescriptions_doctors 
FOREIGN KEY (doctor_id)
REFERENCES doctors(doctor_id);

ALTER TABLE prescriptions
ADD CONSTRAINT prescriptions_medications 
FOREIGN KEY (medication_id)
REFERENCES medications(medication_id);

ALTER TABLE doctors
ADD CONSTRAINT doctors_departements
FOREIGN KEY (department_id)
REFERENCES departments(department_id);

ALTER TABLE staff
ADD CONSTRAINT staff_departements
FOREIGN KEY (department_id)
REFERENCES departments(department_id);