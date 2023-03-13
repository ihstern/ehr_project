CREATE TABLE users (
    id SERIAL,
    username TEXT UNIQUE NOT NULL,
    credentials TEXT NOT NULL,
    department TEXT NOT NULL,
    name TEXT NOT NULL,
    surname TEXT NOT NULL,
    password TEXT NOT NULL,
    PRIMARY KEY (id)
);

CREATE TABLE patients (
    mrn SERIAL,
    pt_name TEXT NOT NULL,
    pt_surname TEXT NOT NULL,
    dob DATE NOT NULL,
    PRIMARY KEY (mrn)
);

CREATE TABLE surgeries (
    id SERIAL,
    procedure TEXT NOT NULL,
    date_of_surgery DATE NOT NULL,
    patient_mrn INTEGER NOT NULL,
    PRIMARY KEY (id)
);

CREATE TABLE medical_conditions (
    id SERIAL,
    diagnosis TEXT NOT NULL,
    symptoms TEXT,
    start_date DATE,
    patient_mrn INTEGER NOT NULL,
    PRIMARY KEY (id)
);

CREATE TABLE medications (
    id SERIAL,
    medication TEXT NOT NULL,
    active BOOLEAN NOT NULL,
    dosage TEXT NOT NULL,
    route TEXT NOT NULL,
    frequency TEXT NOT NULL,
    patient_mrn INTEGER NOT NULL,
    allergy_id INTEGER,
    PRIMARY KEY (id)
);

CREATE TABLE allergies (
    id SERIAL,
    reaction TEXT NOT NULL,
    anaphylaxis BOOLEAN,
    PRIMARY KEY (id)
);

CREATE TABLE vital_signs (
    id SERIAL,
    time_taken TIMESTAMP NOT NULL,
    heart_rate INTEGER,
    systolic_bp INTEGER,
    diastolic_bp INTEGER,
    temp_f FLOAT(1),
    spo2 INTEGER,
    respirations INTEGER,
    patient_mrn INTEGER NOT NULL,
    PRIMARY KEY (id)
);

CREATE TABLE users_patients (
    user_id INTEGER NOT NULL,
    patient_mrn INTEGER NOT NULL,
    PRIMARY KEY (user_id, patient_mrn)
);

ALTER TABLE medications
ADD CONSTRAINT fk_medications_patients
FOREIGN KEY (patient_mrn)
REFERENCES patients (mrn)
ADD CONSTRAINT fk_allergies_medications
FOREIGN KEY(allergy_id)
REFERENCES allergies (id);

ALTER TABLE medical_conditions
ADD CONSTRAINT fk_medical_conditions_patients
FOREIGN KEY (patient_mrn)
REFERENCES patients (mrn);

ALTER TABLE surgeries
ADD CONSTRAINT fk_surgeries_patients
FOREIGN KEY (patient_mrn)
REFERENCES patients (mrn);

ALTER TABLE vital_signs
ADD CONSTRAINT fk_vital_signs_patients
FOREIGN KEY (patient_mrn)
REFERENCES patients (mrn);

ALTER TABLE users_patients
ADD CONSTRAINT fk_users_patients_users
FOREIGN KEY (user_id)
REFERENCES users (id);

ALTER TABLE users_patients
ADD CONSTRAINT fk_users_patients_patients
FOREIGN KEY (patient_mrn)
REFERENCES patients (mrn);

