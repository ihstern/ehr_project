from flask import Blueprint, jsonify, abort, request
from ..models import Medication, Patient, Allergy, db

bp = Blueprint('medications', __name__, url_prefix='/medications')

@bp.route('', methods=['GET']) # decorator takes path and list of HTTP verbs
def index():
    medications = Medication.query.all() # ORM performs SELECT query
    result = []
    for m in medications:
        result.append(m.serialize()) # build list of Users as dictionaries
    return jsonify(result) # return JSON response

@bp.route('/<int:id>/', methods=['GET'])
def show(id: int):
    m = Medication.query.get_or_404(id)
    return jsonify(m.serialize())

@bp.route('', methods=['POST'])
def create():
    m = Medication(
        medication=request.json['medication'],
        dosage=request.json['dosage'],
        route=request.json['route'],
        frequency=request.json['frequency'],
        active=request.json['active'],
        patient_mrn=request.json['patient_mrn'],
        allergy_id=request.json['allergy_id']
    )
    db.session.add(m) # prepare CREATE statement
    db.session.commit() # execute CREATE statement
    return jsonify(m.serialize()) 

@bp.route('/<int:id>', methods=['DELETE'])
def delete(id: int):
    m = Medication.query.get_or_404(id)
    try:
        db.session.delete(m) # prepare DELETE statement
        db.session.commit() # execute DELETE statement
        return jsonify(True)
    except:
        # something went wrong :(
        return jsonify(False)

@bp.route('/<int:id>', methods=['PATCH', 'PUT'])
def update_med(id: int):
    m = Medication.query.get_or_404(id)
    if 'medication' in request.json:
        return abort(400)
    if 'dosage' not in request.json and 'route' not in request.json and 'frequency' not in request.json and 'active' not in request.json and 'allergy_id' not in request.json:
        return abort(400)
    if 'dosage' in request.json:
        m.dosage=request.json['dosage']
    if 'route' in request.json:
        m.route=request.json['route']
    if 'frequency' in request.json:
        m.frequency=request.json['frequency']
    if 'active' in request.json:
        m.active=request.json['active']
    if 'allergy_id' in request.json:
        m.allergy_id=request.json['allergy_id']
    try:
        db.session.commit()
        return jsonify(m.serialize())
    except:
        return jsonify(False)
