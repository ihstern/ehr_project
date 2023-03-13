from flask import Blueprint, jsonify, abort, request
from ..models import Patient, Medication, User, db

bp = Blueprint('patients', __name__, url_prefix='/patients')

@bp.route('', methods=['GET']) # decorator takes path and list of HTTP verbs
def index():
    patients = Patient.query.all() # ORM performs SELECT query
    result = []
    for p in patients:
        result.append(p.serialize()) # build list of Users as dictionaries
    return jsonify(result) # return JSON response

@bp.route('/<int:id>/', methods=['GET'])
def show(id: int):
    p = Patient.query.get_or_404(id)
    return jsonify(p.serialize())

@bp.route('', methods=['POST'])
def create():
    p = Patient(
        pt_name=request.json['pt_name'],
        pt_surname=request.json['pt_surname'],
        dob=request.json['dob']
    )
    db.session.add(p) # prepare CREATE statement
    db.session.commit() # execute CREATE statement
    return jsonify(p.serialize())

@bp.route('/<int:id>', methods=['DELETE'])
def delete(id: int):
    p = Patient.query.get_or_404(id)
    try:
        db.session.delete(p) # prepare DELETE statement
        db.session.commit() # execute DELETE statement
        return jsonify(True)
    except:
        # something went wrong :(
        return jsonify(False)

@bp.route('/<int:id>', methods=['PATCH', 'PUT'])
def update_name(id: int):
    p = Patient.query.get_or_404(id)
    if 'pt_name' not in request.json and 'pt_surname' not in request.json:
        return abort(400)
    if 'pt_name' in request.json:
        p.pt_name=request.json['pt_name']
    if 'pt_surname' in request.json:
        p.pt_surname=request.json['pt_surname']
    try:
        db.session.commit()
        return jsonify(p.serialize())
    except:
        return jsonify(False)

@bp.route('/<int:id>/care_team', methods=['GET'])
def care_team(id: int):
    p = Patient.query.get_or_404(id)
    result = []
    for u in p.care_team:
        result.append(u.serialize())
    return jsonify(result)

@bp.route('/<int:id>/surgical_history', methods=['GET'])
def surgical_history(id: int):
    p = Patient.query.get_or_404(id)
    result = []
    for s in p.surgical_history:
        result.append(s.serialize())
    return jsonify(result)

@bp.route('/<int:id>/medical_history', methods=['GET'])
def medical_history(id: int):
    p = Patient.query.get_or_404(id)
    result = []
    for mc in p.medical_history:
        result.append(mc.serialize())
    return jsonify(result)

@bp.route('/<int:id>/medication_list', methods=['GET'])
def medication_list(id: int):
    p = Patient.query.get_or_404(id)
    result = []
    for m in p.medication_list:
        result.append(m.serialize())
    return jsonify(result)

@bp.route('/<int:id>/vitals', methods=['GET'])
def vitals(id: int):
    p = Patient.query.get_or_404(id)
    result = []
    for vs in p.vitals:
        result.append(vs.serialize())
    return jsonify(result)

""" @bp.route('/<int:id>/drug_allergies', methods=['GET'])
def drug_allergies(id: int):
    p = Patient.query.get_or_404(id)
    result = []
    for m in p.drug_allergies:
        result.append(m.serialize())
    return jsonify(result) """