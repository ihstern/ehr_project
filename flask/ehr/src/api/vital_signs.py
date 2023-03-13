from flask import Blueprint, jsonify, abort, request
from ..models import Vital_Sign, Patient, db

bp = Blueprint('vital_signs', __name__, url_prefix='/vital_signs')

@bp.route('', methods=['GET']) # decorator takes path and list of HTTP verbs
def index():
    vital_signs = Vital_Sign.query.all() # ORM performs SELECT query
    result = []
    for vs in vital_signs:
        result.append(vs.serialize()) # build list of Users as dictionaries
    return jsonify(result) # return JSON response

@bp.route('/<int:id>/', methods=['GET'])
def show(id: int):
    vs = Vital_Sign.query.get_or_404(id)
    return jsonify(vs.serialize())

@bp.route('', methods=['POST'])
def create():
    vs = Vital_Sign(
        time_taken=request.json['time_taken'],
        heart_rate=request.json['heart_rate'],
        systolic_bp=request.json['systolic_bp'],
        diastolic_bp=request.json['diastolic_bp'],
        temp_f=request.json['temp_f'],
        spo2=request.json['spo2'],
        respirations=request.json['respirations'],
        patient_mrn=request.json['patient_mrn']
    )
    db.session.add(vs) # prepare CREATE statement
    db.session.commit() # execute CREATE statement
    return jsonify(vs.serialize())

@bp.route('/<int:id>', methods=['PATCH', 'PUT'])
def update_vitals(id: int):
    vs = Vital_Sign.query.get_or_404(id)
    if 'time_taken' in request.json:
        vs.time_taken=request.json['time_taken']
    if 'heart_rate' in request.json:
        vs.heart_rate=request.json['heart_rate']
    if 'systolic_bp' in request.json:
        vs.systolic_bp=request.json['systolic_bp']
    if 'diastolic_bp' in request.json:
        vs.diastolic_bp=request.json['diastolic_bp']
    if 'temp_f' in request.json:
        vs.temp_f=request.json['temp_f']
    if 'spo2' in request.json:
        vs.spo2=request.json['spo2']
    if 'respirations' in request.json:
        vs.respirations=request.json['respirations']
    try:
        db.session.commit()
        return jsonify(vs.serialize())
    except:
        return jsonify(False)