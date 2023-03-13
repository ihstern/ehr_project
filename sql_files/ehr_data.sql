INSERT INTO patients (pt_name, pt_surname, dob)
VALUES ('Dorian', 'Gray', '1902-11-12');

INSERT INTO patients (pt_name, pt_surname, dob)
VALUES ('Sherlock', 'Holmes', '1981-02-27');

INSERT INTO patients (pt_name, pt_surname, dob)
VALUES ('Leia', 'Organa', '2003-07-19');

INSERT INTO patients (pt_name, pt_surname, dob)
VALUES ('Dana', 'Scully', '1995-04-04');

INSERT INTO patients (pt_name, pt_surname, dob)
VALUES ('Ronald', 'McDonald', '1945-01-13');

INSERT INTO users (username, password, name, surname, credentials, department)
VALUES ('spepper', '23flavors', 'Spicy', 'Pepper', 'MD', 'Critical Care');

INSERT INTO users (username, password, name, surname, credentials, department)
VALUES ('mgrey', 'mcdreamy', 'Meredith', 'Grey', 'MD', 'General Surgery');

INSERT INTO users (username, password, name, surname, credentials, department)
VALUES ('aperkins', 'thepitsucks', 'Ann', 'Perkins', 'RN', 'Medical/Surgical Floor');

INSERT INTO users (username, password, name, surname, credentials, department)
VALUES ('cespinosa', 'janitorsfriend', 'Carla', 'Espinosa', 'RN', 'Emergency Room');

INSERT INTO users (username, password, name, surname, credentials, department)
VALUES ('jcarter', 'whoneedssleep', 'John', 'Carter', 'MD', 'Emergency Room');

INSERT INTO surgeries (procedure, date_of_surgery, patient_mrn)
VALUES ('Craniotomy for meningioma', '2023-02-10', 5);

INSERT INTO surgeries (procedure, date_of_surgery, patient_mrn)
VALUES ('Laparoscopic appendectomy', '2019-04-02', 3);

INSERT INTO surgeries (procedure, date_of_surgery, patient_mrn)
VALUES ('ORIF left ankle', '2011-02-23', 5);

INSERT INTO surgeries (procedure, date_of_surgery, patient_mrn)
VALUES ('Bilateral cataract removal', '2018-07-07', 5);

INSERT INTO surgeries (procedure, date_of_surgery, patient_mrn)
VALUES ('Lipoma resection', '2023-02-11', 4);

INSERT INTO surgeries (procedure, date_of_surgery, patient_mrn)
VALUES ('ORIF right mandible', '2015-11-03', 2);

INSERT INTO surgeries (procedure, date_of_surgery, patient_mrn)
VALUES ('Wisdom tooth removal x4', '2021-12-15', 3);

INSERT INTO surgeries (procedure, date_of_surgery, patient_mrn)
VALUES ('Arthroscopic right carpal tunnel release', '1999-10-02', 2);

INSERT INTO medical_conditions (diagnosis, symptoms, start_date, patient_mrn)
VALUES ('Narcissistic Personality Disorder', 'Entitlement, fear, lack of boundaries, need for validation', '2002-01-20', 1);

INSERT INTO medical_conditions (diagnosis, symptoms, start_date, patient_mrn)
VALUES ('Moderate to Severe Asthma', 'Wheezing, shortness of breath', '1990-04-03', 1);

INSERT INTO medical_conditions (diagnosis, symptoms, start_date, patient_mrn)
VALUES ('Right Mandible Fracture', 'Bruising, swelling of right mandible', '2015-11-02', 2);

INSERT INTO medical_conditions (diagnosis, symptoms, start_date, patient_mrn)
VALUES ('Polysubstance Abuse', 'Positive for cocaine, opioids', '2023-02-12', 2);

INSERT INTO medical_conditions (diagnosis, symptoms, start_date, patient_mrn)
VALUES ('Acute Appendicitis', 'RUQ pain with rebound tenderness, nausea, vomiting', '2019-04-02', 3);

INSERT INTO medical_conditions (diagnosis, symptoms, start_date, patient_mrn)
VALUES ('Impacted Wisdom Teeth x4', 'Unspecified jaw pain', '2021-11-20', 3);

INSERT INTO medical_conditions (diagnosis, symptoms, start_date, patient_mrn)
VALUES ('Gastroenteritis', 'Nausea, vomiting, dehydration', '2023-02-12', 3);

INSERT INTO medical_conditions (diagnosis, symptoms, start_date, patient_mrn)
VALUES ('Right abdominal lipoma', 'RLQ pain, bloating, constipation', '2023-01-12', 4);

INSERT INTO medical_conditions (diagnosis, start_date, patient_mrn)
VALUES ('Hypertension', '1989-03-03', 5);

INSERT INTO medical_conditions (diagnosis, symptoms, start_date, patient_mrn)
VALUES ('GERD', 'Heartburn', '1995-07-12', 5);

INSERT INTO medical_conditions (diagnosis, start_date, patient_mrn)
VALUES ('Hyperlipidemia', '1995-07-12', 5);

INSERT INTO medical_conditions (diagnosis, symptoms, start_date, patient_mrn)
VALUES ('Bilateral cataracts', 'Bilateral vision difficulty', '2018-06-02', 5);

INSERT INTO medical_conditions (diagnosis, start_date, patient_mrn)
VALUES ('Open left ankle fracture', '2011-02-23', 5);

INSERT INTO medical_conditions (diagnosis, symptoms, start_date, patient_mrn)
VALUES ('Left parietal meningioma', 'Headaches, seizures, change of personality', '2023-01-28', 5);

INSERT INTO users_patients (user_id, patient_mrn)
VALUES (1, 5);

INSERT INTO users_patients (user_id, patient_mrn)
VALUES (2, 3);

INSERT INTO users_patients (user_id, patient_mrn)
VALUES (3, 2);

INSERT INTO users_patients (user_id, patient_mrn)
VALUES (3, 3);

INSERT INTO users_patients (user_id, patient_mrn)
VALUES (3, 4);

INSERT INTO users_patients (user_id, patient_mrn)
VALUES (3, 5);

INSERT INTO users_patients (user_id, patient_mrn)
VALUES (4, 1);

INSERT INTO users_patients (user_id, patient_mrn)
VALUES (4, 2);

INSERT INTO users_patients (user_id, patient_mrn)
VALUES (4, 3);

INSERT INTO users_patients (user_id, patient_mrn)
VALUES (4, 5);

INSERT INTO users_patients (user_id, patient_mrn)
VALUES (5, 1);

INSERT INTO users_patients (user_id, patient_mrn)
VALUES (5, 2);

INSERT INTO users_patients (user_id, patient_mrn)
VALUES (5, 3);

INSERT INTO medications (medication, active, dosage, route, frequency, patient_mrn)
VALUES ('Albuterol', TRUE, '2.5mg (3-4 puffs)', 'inhaled', 'q6 hrs', 1);

INSERT INTO medications (medication, active, dosage, route, frequency, patient_mrn)
VALUES ('Prednisone', TRUE, '30mg', 'oral', 'q.d.', 1);

INSERT INTO medications (medication, active, dosage, route, frequency, patient_mrn)
VALUES ('Hydrocodone/Acetaminophen', FALSE, '10mg/325mg', 'oral', 'q6 hrs', 2);

INSERT INTO medications (medication, active, dosage, route, frequency, patient_mrn)
VALUES ('Naloxone', TRUE, '1mg', 'IV', 'once', 2);

INSERT INTO medications (medication, active, dosage, route, frequency, patient_mrn, allergy_id)
VALUES ('Ibuprofen', FALSE, '400mg', 'oral', 'q4-6', 2, 1);

INSERT INTO medications (medication, active, dosage, route, frequency, patient_mrn)
VALUES ('Lorazepam', TRUE, '2mg', 'IV bolus', 'PRN', 2);

INSERT INTO medications (medication, active, dosage, route, frequency, patient_mrn)
VALUES ('Hydrocodone/Acetaminophen', FALSE, '10mg/325mg', 'oral', 'q6 hrs', 3);

INSERT INTO medications (medication, active, dosage, route, frequency, patient_mrn)
VALUES ('Ondansetron', TRUE, '10mg', 'IV bolus', 'q8 hrs', 3);

INSERT INTO medications (medication, active, dosage, route, frequency, patient_mrn, allergy_id)
VALUES ('Amoxicillin', FALSE, '500mg', 'oral', 'q12 hrs', 3, 2);

INSERT INTO medications (medication, active, dosage, route, frequency, patient_mrn)
VALUES ('0.9% NaCl', TRUE, '60ml/kg/hr', 'IV', 'continuous', 3);

INSERT INTO medications (medication, active, dosage, route, frequency, patient_mrn)
VALUES ('Hydrocodone/Acetaminophen', TRUE, '10mg/325mg', 'oral', 'q6 hrs', 4);

INSERT INTO medications (medication, active, dosage, route, frequency, patient_mrn)
VALUES ('Hydrocodone/Acetaminophen', FALSE, '10mg/325mg', 'oral', 'q6 hrs', 5);

INSERT INTO medications (medication, active, dosage, route, frequency, patient_mrn)
VALUES ('Metoprolol', TRUE, '25mg', 'oral', 'q12 hrs', 5);

INSERT INTO medications (medication, active, dosage, route, frequency, patient_mrn, allergy_id)
VALUES ('Lisinopril', FALSE, '10mg', 'oral', 'q.d.', 5, 3);

INSERT INTO medications (medication, active, dosage, route, frequency, patient_mrn, allergy_id)
VALUES ('Topiramate', FALSE, '25mg', 'oral', 'q.d.', 5, 4);

INSERT INTO medications (medication, active, dosage, route, frequency, patient_mrn)
VALUES ('Levetiracetam', TRUE, '500mg', 'oral', 'q12 hrs', 5);

INSERT INTO medications (medication, active, dosage, route, frequency, patient_mrn)
VALUES ('Omeprazole', TRUE, '40mg', 'oral', 'q.d.', 5);

INSERT INTO medications (medication, active, dosage, route, frequency, patient_mrn)
VALUES ('Morphine', TRUE, '2mg', 'IV bolus', 'q2h PRN', 5);

INSERT INTO medications (medication, active, dosage, route, frequency, patient_mrn)
VALUES ('Nicardipine', TRUE, '2.5mg/hr', 'IV', 'continuous PRN', 5);

INSERT INTO medications (medication, active, dosage, route, frequency, patient_mrn)
VALUES ('Ondansetron', TRUE, '4mg', 'IV bolus', 'q6h PRN', 5);

INSERT INTO medications (medication, active, dosage, route, frequency, patient_mrn)
VALUES ('Mannitol', TRUE, '25gm', 'IV bolus', 'q12h', 5);

INSERT INTO medications (medication, active, dosage, route, frequency, patient_mrn)
VALUES ('D5W NaCl 0.9% KCl 20mEq', TRUE, '100ml/hr', 'IV', 'continuous', 5);

INSERT INTO medications (medication, active, dosage, route, frequency, patient_mrn)
VALUES ('Dopamine', TRUE, '10mcg/kg/min', 'IV', 'continuous PRN', 5);

INSERT INTO medications (medication, active, dosage, route, frequency, patient_mrn)
VALUES ('Nitroprusside', TRUE, 'o.5mcg/kg/min', 'IV', 'continuous PRN', 5);

INSERT INTO allergies (reaction, anaphylaxis)
VALUES ('Nausea', FALSE);

INSERT INTO allergies (reaction, anaphylaxis)
VALUES ('Itching, hives, throat swelling', TRUE);

INSERT INTO allergies (reaction, anaphylaxis)
VALUES ('Cough', FALSE);

INSERT INTO allergies (reaction, anaphylaxis)
VALUES ('Mouth swelling', TRUE);

INSERT INTO vital_signs (time_taken, heart_rate, systolic_bp, diastolic_bp, temp_f, spo2, respirations, patient_mrn)
VALUES ('1990-04-03 13:25:06', 121, 132, 92, 98.5, 89, 22, 1);

INSERT INTO vital_signs (time_taken, heart_rate, systolic_bp, diastolic_bp, temp_f, spo2, patient_mrn)
VALUES ('1995-04-01 15:02:14', 76, 126, 86, 98.8, 97, 1);

INSERT INTO vital_signs (time_taken, heart_rate, systolic_bp, diastolic_bp, temp_f, spo2, patient_mrn)
VALUES ('1999-02-23 11:13:03', 72, 118, 78, 98.8, 98, 1);

INSERT INTO vital_signs (time_taken, heart_rate, systolic_bp, diastolic_bp, temp_f, spo2, patient_mrn)
VALUES ('2002-01-20 12:42:25', 68, 110, 72, 98.7, 99, 1);

INSERT INTO vital_signs (time_taken, heart_rate, systolic_bp, diastolic_bp, temp_f, spo2, patient_mrn)
VALUES ('2011-09-02 09:30:23', 64, 104, 68, 98.8, 98, 1);

INSERT INTO vital_signs (time_taken, heart_rate, systolic_bp, diastolic_bp, temp_f, spo2, respirations, patient_mrn)
VALUES ('2023-02-12 10:12:15', 112, 116, 74, 98.6, 92, 20, 1);

INSERT INTO vital_signs (time_taken, heart_rate, systolic_bp, diastolic_bp, temp_f, spo2, respirations, patient_mrn)
VALUES ('1999-10-02 14:12:04', 70, 96, 64, 98.6, 99, 16, 2);

INSERT INTO vital_signs (time_taken, heart_rate, systolic_bp, diastolic_bp, temp_f, spo2, respirations, patient_mrn)
VALUES ('2007-04-16 09:15:09', 74, 98, 66, 98.7, 98, 16, 2);

INSERT INTO vital_signs (time_taken, heart_rate, systolic_bp, diastolic_bp, temp_f, spo2, respirations, patient_mrn)
VALUES ('2015-11-02 14:03:17', 78, 104, 72, 98.5, 99, 14, 2);

INSERT INTO vital_signs (time_taken, heart_rate, systolic_bp, diastolic_bp, temp_f, spo2, respirations, patient_mrn)
VALUES ('2018-04-23 11:55:32', 80, 110, 76, 98.7, 97, 18, 2);

INSERT INTO vital_signs (time_taken, heart_rate, systolic_bp, diastolic_bp, temp_f, spo2, respirations, patient_mrn)
VALUES ('2023-02-12 01:21:32', 46, 84, 50, 97.4, 88, 8, 2);

INSERT INTO vital_signs (time_taken, heart_rate, systolic_bp, diastolic_bp, temp_f, spo2, respirations, patient_mrn)
VALUES ('2023-02-12 03:21:03', 70, 96, 66, 97.5, 94, 12, 2);

INSERT INTO vital_signs (time_taken, heart_rate, systolic_bp, diastolic_bp, temp_f, spo2, respirations, patient_mrn)
VALUES ('2023-02-12 05:20:54', 80, 112, 78, 97.8, 97, 16, 2);

INSERT INTO vital_signs (time_taken, heart_rate, systolic_bp, diastolic_bp, temp_f, spo2, respirations, patient_mrn)
VALUES ('2023-02-11 06:03:12', 74, 100, 68, 98.5, 98, 16, 3);

INSERT INTO vital_signs (time_taken, heart_rate, systolic_bp, diastolic_bp, temp_f, spo2, respirations, patient_mrn)
VALUES ('2023-02-11 08:03:12', 70, 98, 68, 98.6, 98, 16, 3);

INSERT INTO vital_signs (time_taken, heart_rate, systolic_bp, diastolic_bp, temp_f, spo2, respirations, patient_mrn)
VALUES ('2023-02-11 12:05:12', 72, 96, 66, 98.5, 99, 16, 3);

INSERT INTO vital_signs (time_taken, heart_rate, systolic_bp, diastolic_bp, temp_f, spo2, respirations, patient_mrn)
VALUES ('2023-02-11 16:13:12', 74, 100, 70, 98.6, 98, 16, 3);

INSERT INTO vital_signs (time_taken, heart_rate, systolic_bp, diastolic_bp, temp_f, spo2, respirations, patient_mrn)
VALUES ('2023-02-11 20:03:12', 72, 98, 64, 98.5, 97, 16, 3);

INSERT INTO vital_signs (time_taken, heart_rate, systolic_bp, diastolic_bp, temp_f, spo2, respirations, patient_mrn)
VALUES ('2023-02-12 00:21:12', 74, 100, 68, 98.7, 98, 16, 3);

INSERT INTO vital_signs (time_taken, heart_rate, systolic_bp, diastolic_bp, temp_f, spo2, respirations, patient_mrn)
VALUES ('2023-02-12 04:09:12', 70, 94, 62, 98.6, 99, 16, 3);

INSERT INTO vital_signs (time_taken, heart_rate, systolic_bp, diastolic_bp, temp_f, spo2, respirations, patient_mrn)
VALUES ('2023-02-12 08:14:12', 74, 96, 66, 98.5, 99, 16, 3);

INSERT INTO vital_signs (time_taken, heart_rate, systolic_bp, diastolic_bp, temp_f, patient_mrn)
VALUES ('2020-01-10 14:06:33', 60, 88, 58, 98.8, 4);

INSERT INTO vital_signs (time_taken, heart_rate, systolic_bp, diastolic_bp, spo2, patient_mrn)
VALUES ('2021-01-12 14:06:33', 62, 94, 60, 99, 4);

INSERT INTO vital_signs (time_taken, heart_rate, systolic_bp, diastolic_bp, patient_mrn)
VALUES ('2022-01-11 14:06:33', 66, 96, 62, 4);

INSERT INTO vital_signs (time_taken, heart_rate, systolic_bp, diastolic_bp, temp_f, spo2, patient_mrn)
VALUES ('2023-01-09 14:06:33', 70, 96, 64, 98.8, 99, 4);

INSERT INTO vital_signs (time_taken, heart_rate, systolic_bp, diastolic_bp, temp_f, spo2, respirations, patient_mrn)
VALUES ('2023-01-28 11:34:27', 72, 98, 62, 98.7, 98, 16, 4);

INSERT INTO vital_signs (time_taken, heart_rate, systolic_bp, diastolic_bp, temp_f, spo2, respirations, patient_mrn)
VALUES ('2023-02-11 15:43:22', 92, 134, 96, 98.8, 98, 16, 5);

INSERT INTO vital_signs (time_taken, heart_rate, systolic_bp, diastolic_bp, temp_f, spo2, respirations, patient_mrn)
VALUES ('2023-02-10 06:02:45', 98, 138, 98, 98.7, 97, 18, 5);

INSERT INTO vital_signs (time_taken, heart_rate, systolic_bp, diastolic_bp, temp_f, spo2, respirations, patient_mrn)
VALUES ('2023-02-10 08:01:40', 66, 110, 76, 97.6, 99, 14, 5);

INSERT INTO vital_signs (time_taken, heart_rate, systolic_bp, diastolic_bp, temp_f, spo2, respirations, patient_mrn)
VALUES ('2023-02-10 10:02:43', 64, 86, 58, 97.8, 97, 14, 5);

INSERT INTO vital_signs (time_taken, heart_rate, systolic_bp, diastolic_bp, temp_f, spo2, respirations, patient_mrn)
VALUES ('2023-02-10 12:03:05', 68, 92, 60, 97.7, 98, 14, 5);

INSERT INTO vital_signs (time_taken, heart_rate, systolic_bp, diastolic_bp, temp_f, spo2, respirations, patient_mrn)
VALUES ('2023-02-10 14:02:22', 54, 84, 58, 97.7, 98, 14, 5);

INSERT INTO vital_signs (time_taken, heart_rate, systolic_bp, diastolic_bp, temp_f, spo2, respirations, patient_mrn)
VALUES ('2023-02-10 16:08:53', 68, 94, 62, 98.0, 97, 16, 5);

INSERT INTO vital_signs (time_taken, heart_rate, systolic_bp, diastolic_bp, temp_f, spo2, respirations, patient_mrn)
VALUES ('2023-02-10 18:06:07', 76, 112, 70, 98.3, 98, 16, 5);

INSERT INTO vital_signs (time_taken, heart_rate, systolic_bp, diastolic_bp, temp_f, spo2, respirations, patient_mrn)
VALUES ('2023-02-10 20:09:13', 74, 122, 90, 98.7, 99, 16, 5);

INSERT INTO vital_signs (time_taken, heart_rate, systolic_bp, diastolic_bp, temp_f, spo2, respirations, patient_mrn)
VALUES ('2023-02-10 22:02:35', 76, 126, 94, 98.7, 98, 16, 5);