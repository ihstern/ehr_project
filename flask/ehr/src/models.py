from flask_sqlalchemy import SQLAlchemy
import datetime

db = SQLAlchemy()

class User(db.Model):
    __tablename__ = 'users'
    id = db.Column(db.Integer, primary_key=True, autoincrement=True)
    username = db.Column(db.String(128), unique=True, nullable=False)
    password = db.Column(db.String(128), nullable=False)
    credentials = db.Column(db.String(128), nullable=False)
    department = db.Column(db.String(128), nullable=False)
    name = db.Column(db.String(128), nullable=False)
    surname = db.Column(db.String(128), nullable=False)

    def __init__(self, username: str, password: str, credentials: str, department: str, name: str, surname: str):
        self.username = username
        self.password = password
        self.credentials = credentials
        self.department = department
        self.name = name
        self.surname = surname
    
    def serialize(self):
        return {
            'id': self.id,
            'username': self.username,
            'credentials': self.credentials,
            'department': self.department,
            'name': self.name,
            'surname': self.surname
        }

users_patients = db.Table(
    'users_patients',
    db.Column(
        'user_id', db.Integer,
        db.ForeignKey('users.id'),
        primary_key=True
    ),

    db.Column(
        'patient_mrn', db.Integer,
        db.ForeignKey('patients.mrn'),
        primary_key=True
    )
)

""" patients_allergies = db.Table(
    'medications',
    db.Column('id', db.Integer, primary_key=True),
    db.Column('allergy_id', db.Integer, db.ForeignKey('allergies.id')),
    db.Column('dosage', db.String(128)),
    db.Column('frequency', db.String(128)),
    db.Column('active', db.String(128)),
    db.Column('medication', db.String(128)),
    db.Column('patient_mrn', db.Integer, db.ForeignKey('patients.mrn')),
    db.Column('route', db.String(128))
) """

class Patient(db.Model):
    __tablename__ = 'patients'
    mrn = db.Column(db.Integer, primary_key=True, autoincrement=True)
    pt_name = db.Column(db.String(128), nullable=False)
    pt_surname = db.Column(db.String(128), nullable=False)
    dob = db.Column(db.Date, nullable=False)

    care_team = db.relationship(
        'User', secondary=users_patients,
        lazy='subquery',
        backref=db.backref('patient_panel', lazy=True)
    )

    surgical_history = db.relationship(
        'Surgery', backref=db.backref('patients', lazy=True)
    )

    medical_history = db.relationship(
        'Medical_Condition', backref=db.backref('patients', lazy=True)
    )

    vitals = db.relationship(
        'Vital_Sign', backref=db.backref('patients', lazy=True)
    )

    medication_list = db.relationship(
        'Medication', backref=db.backref('patients', lazy=True)
    )

    def __init__(self, pt_name: str, pt_surname: str, dob):
        self.pt_name = pt_name
        self.pt_surname = pt_surname
        self.dob = dob

    def serialize(self):
        return {
            'mrn': self.mrn,
            'pt_name': self.pt_name,
            'pt_surname': self.pt_surname,
            'dob': self.dob,
        }
    
"""     drug_allergies = db.relationship(
        'Allergy', secondary=patients_allergies, lazy='subquery',
        backref=db.backref('allergy_patients', lazy=True)
    )"""

class Surgery(db.Model):
    __tablename__ = 'surgeries'
    id = db.Column(db.Integer, primary_key=True, autoincrement=True)
    procedure = db.Column(db.String(128), nullable=False)
    date_of_surgery = db.Column(db.Date, nullable=True)
    patient_mrn = db.Column(db.Integer, db.ForeignKey('patients.mrn'), nullable=False)

    patient_surgeries = db.relationship('Patient', backref=db.backref('surgeries', lazy=True))

    def __init__(self, procedure: str, date_of_surgery, patient_mrn: int):
        self.procedure = procedure
        self.date_of_surgery = date_of_surgery
        self.patient_mrn = patient_mrn

    def serialize(self):
        return {
            'id': self.id,
            'procedure': self.procedure,
            'date_of_surgery': self.date_of_surgery,
            'patient_mrn': self.patient_mrn
        }

class Medical_Condition(db.Model):
    __tablename__ = 'medical_conditions'
    id = db.Column(db.Integer, primary_key=True, autoincrement=True)
    diagnosis = db.Column(db.String(128), nullable=False)
    symptoms = db.Column(db.String(128), nullable=True)
    start_date = db.Column(db.Date, nullable=True)
    patient_mrn = db.Column(db.Integer, db.ForeignKey('patients.mrn'), nullable=False)

    patient_conditions = db.relationship('Patient', backref=db.backref('medical_conditions', lazy=True))

    def __init__(self, diagnosis: str, patient_mrn: str, symptoms: str, start_date):
        self.diagnosis = diagnosis
        self.patient_mrn = patient_mrn
        self.symptoms = symptoms
        self.start_date = start_date

    def serialize(self):
        return {
            'id': self.id,
            'diagnosis': self.diagnosis,
            'patient_mrn': self.patient_mrn,
            'symptoms': self.symptoms,
            'start_date': self.start_date
        }

class Allergy(db.Model):
    __tablename__ = 'allergies'
    id = db.Column(db.Integer, primary_key=True, autoincrement=True)
    reaction = db.Column(db.Text, nullable=False)
    anaphylaxis = db.Column(db.Boolean, nullable=True)

    medication_allergies = db.relationship('Medication', backref=db.backref('allergies', lazy=True))

    def __init__(self, reaction: str, anaphylaxis=None):
        self.reaction = reaction
        self.anaphylaxis = anaphylaxis

    def serialize(self):
        return {
            'id': self.id,
            'reaction': self.reaction,
            'anaphylaxis': self.anaphylaxis
        }

class Medication(db.Model):
    __tablename__ = 'medications'
    id = db.Column(db.Integer, primary_key=True, autoincrement=True)
    medication = db.Column(db.Text, nullable=False)
    active = db.Column(db.Boolean, nullable=False)
    dosage = db.Column(db.Text, nullable=False)
    route = db.Column(db.Text, nullable=False)
    frequency = db.Column(db.Text, nullable=False)
    patient_mrn = db.Column(db.Integer, db.ForeignKey('patients.mrn'), nullable=False)
    allergy_id = db.Column(db.Integer, db.ForeignKey('allergies.id'), nullable=True)

    patient_medications = db.relationship('Patient', backref=db.backref('medications', lazy=True))

    def __init__(self, medication: str, active: bool, dosage: str, route: str, frequency: str, patient_mrn: int, allergy_id):
        self.medication = medication
        self.active = active
        self.dosage = dosage
        self.route = route
        self.frequency = frequency
        self.patient_mrn = patient_mrn
        self.allergy_id = allergy_id

    def serialize(self):
        med_info = {
            'id': self.id,
            'medication': self.medication,
            'active': self.active,
            'dosage': self.dosage,
            'route': self.route,
            'frequency': self.frequency,
            'patient_mrn': self.patient_mrn,
            'allergy_id': self.allergy_id
            }
        return med_info

class Vital_Sign(db.Model):
    __tablename__ = 'vital_signs'
    id = db.Column(db.Integer, primary_key=True, autoincrement=True)
    time_taken = db.Column(db.DateTime, nullable=False)
    heart_rate = db.Column(db.Integer, nullable=True)
    systolic_bp = db.Column(db.Integer, nullable=True)
    diastolic_bp = db.Column(db.Integer, nullable=True)
    temp_f = db.Column(db.Float(1), nullable=True)
    spo2 = db.Column(db.Integer, nullable=True)
    respirations = db.Column(db.Integer, nullable=True)
    patient_mrn = db.Column(db.Integer, db.ForeignKey('patients.mrn'), nullable=False)

    patient_vitals = db.relationship('Patient', backref=db.backref('vital_signs', lazy=True))

    def __init__(self, time_taken: datetime, patient_mrn: int, heart_rate: int, systolic_bp: int, diastolic_bp: int, temp_f: float, spo2: int, respirations: int):
        self.time_taken = time_taken
        self.patient_mrn = patient_mrn
        self.heart_rate = heart_rate
        self.systolic_bp = systolic_bp
        self.diastolic_bp = diastolic_bp
        self.temp_f = temp_f
        self.spo2 = spo2
        self.respirations = respirations

    def serialize(self):
        vitals = {
            'id': self.id,
            'time_taken': self.time_taken,
            'patient_mrn': self.patient_mrn,
            'heart_rate': self.heart_rate,
            'systolic_bp': self.systolic_bp,
            'diastolic_bp': self.diastolic_bp,
            'temp_f': self.temp_f,
            'spo2': self.spo2,
            'respirations': self.respirations
            }
        return vitals
