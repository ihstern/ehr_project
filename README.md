Electronic Health Record

I created this project to mimic a very basic version of a system I use every day - an electronic health record. In real life, EHR databases and programs are extensive and complex, as well as having high security for HIPAA compliance. That was out of the scope of this project, but I wanted to show the foundation of how an EHR could work.

At this point in time, this project is still under construction. I hit several road blocks along the way, dealing with new programs and concepts that I am still learning. All of my database tables are fully functional in Insomnia and can accept a variety of requests depending on the table, including POST, PUT/PATCH, DELETE, and GET. 

I also have not created my own hash or b-tree index yet and would like to do that in the future. I was hoping specifically to get my vital_signs table functioning as that has a decent amount of records that would be helpful to index to allow for faster searching. In the future I would also like to implement this with my medications table as I have a large amount of data there as well.

I chose to use an ORM for this project because I really wanted to practice getting to know the different technologies and processes involved. I felt that this would be more challenging for me and I have certainly learned quite a bit through the process. I feel like I made the right decision, though I can always practice with raw SQL in the future.

The project evolved over time mainly to simplify it in some ways to make it functional. My original design in my ER diagram had a loop and included multiple relationships in triangles, for example Users, Patients, and Surgeries, where Users could perform Surgeries and Patients had Surgeries, and Users cared for Patients. Ultimately it felt jumbled and unclear, and while I do want to add more functionality related to that in the future, I thought it was best to start with something more achievable. I redid my ER diagram to remove any loops and streamlined it a little bit. I do think I could have probably cut out more but had difficulty deciding what to sacrifice, so I went into this knowing it was a bit ambitious.

Below I've listed the various HTTP Methods I've created.

HTTP Methods

The following are all functional and designed to mimic basic EHR operations:
Users:
    * index: GET /users - index of all users and their basic info, including username, department, credentials, and first and last name
    * show: GET /users/(specific user id) - shows the basic info of one specific user
    * create: POST /users - create a new user, including password (this is hashed and not displayed under Index or Show)
    * update_username_password: PUT /users/(specific user id) - allows updating of usernames and/or passwords, prohibits updating anything else
    * delete: DEL /users/(specific user id) - allows deletion of one specific user
    * patient_panel: GET /users/(specific user id)/patient_panel - for a user, displays their patient panel (patients under their care)
Patients:
    * index: GET /patients - index of all patients and their basic info, including first and last name, birthdate, and medical record number
    * show: GET /patients/(specific patient id) - shows the basic info of one patient
    * create: POST /patients - add a new patient and generates a medical record number (MRN) for that patient (serialized)
    * update_name: PUT /patients/(specific patient id) - allows updating a patient's first and/or last name while retaining their medical record number
    * care_team: GET /patients/(specific patient id)/care_team - for a specific patient, displays all users associated with their care (MDs, RNs, etc)
    * vitals: GET /patients/(specific patient id)/vitals - for a specific patient, displays all sets of vital signs taken and the date/time they were taken
    * medication_list: GET /patients/(specific patient id)/medication_list - for a specific patient, displays all medications that the patient has been prescribed through the EHR, including current and past medications
    * medical_history: GET /patients/(specific patient id)/medical_history - for a specific patient, shows their medical conditions and history
    * surgical_history: GET /patients/(specific patient id)/surgical_history - for a specific patient, shows all surgeries they’ve had in the past that are documented in the EHR
Surgeries:
    * index: GET /surgeries - index of all surgeries performed at the hospital, including the name and date of surgery, and the MRN of the patient who had the surgery
    * show: GET /surgeries/(specific surgery id) - displays info for a specific surgery
    * create: POST /surgeries - record a new surgery, optionally including the date of surgery
Medical Conditions:
    * index: GET /medical_conditions - index of all medical conditions being treated at the hospital, including the diagnosis, symptoms, start date, and the MRN of the patient with the condition
    * show: GET /medical_conditions/(specific medical condition id) - displays info for a specific medical condition that a patient has
    * create: POST /medical_conditions - record a new medical condition, including optional symptoms and start date
    * update_symptoms: PUT /medical_conditions/(specific medical condition id) - allows updating of only the patient's symptoms of a condition/diagnosis
Medications:
    * index: GET /medications - index of all medications dispensed by the hospital
    * show: GET /medications/(specific medication id) - shows info about a specific medication dispensed to a patient, including patient MRN, medication name and dosage, the route of administration (oral, IV, etc), dosage, and frequency, and whether the medication is still active
    * create: POST /medications - allows for new medication records to be created
    * update_med: PUT /medications/(specific medication id) - allows for updating a medication record to include a dosage, route, or frequency change, as well as add an allergy, but will prevent changing the name of the medication to avoid medication errors
Allergies:
    * index: GET /allergies - index of all allergies noted in all patient records
    * show: GET /allergies/(specific allergy id) - displays the allergy reaction and optionally whether or not the allergen causes anaphylaxis in the linked patient
    * create: POST /allergies - creates a new allergy record
    * update_reaction: PUT /allergies/(specific allergy id) - allows updating the patient's reaction if new symptoms occur or the patient has an anaphylatic reaction
Vital_Signs:
    * index: GET /vital_signs - shows all vital signs ever recorded at the hospital just in case you love unfiltered masses of data
    * show: GET /vital_signs/(specific vital_sign id) - shows the record of vital signs recorded at one specific time, all individual measurements being optional to allow for times when some but not all vitals are taken
    * create: POST /vital_signs - records a new set of vital signs, with a required timestamp
    * update_vitals: PUT /vital_signs/(specific vital_sign id) - allows for updating previous vital sign records in case new measurements need to be added or there was a mistake putting in a previous value# ehr_project
