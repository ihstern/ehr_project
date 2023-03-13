from flask import Blueprint, jsonify, abort, request
from ..models import Medical_Condition, Patient, db

bp = Blueprint('medical_conditions', __name__, url_prefix='/medical_conditions')

@bp.route('', methods=['GET']) # decorator takes path and list of HTTP verbs
def index():
    medical_conditions = Medical_Condition.query.all() # ORM performs SELECT query
    result = []
    for mc in medical_conditions:
        result.append(mc.serialize()) # build list of Users as dictionaries
    return jsonify(result) # return JSON response

@bp.route('/<int:id>/', methods=['GET'])
def show(id: int):
    mc = Medical_Condition.query.get_or_404(id)
    return jsonify(mc.serialize())

@bp.route('', methods=['POST'])
def create():
    mc = Medical_Condition(
        diagnosis=request.json['diagnosis'],
        symptoms=request.json['symptoms'],
        start_date=request.json['start_date'],
        patient_mrn=request.json['patient_mrn']
    )
    db.session.add(mc) # prepare CREATE statement
    db.session.commit() # execute CREATE statement
    return jsonify(mc.serialize())

@bp.route('/<int:id>', methods=['PATCH', 'PUT'])
def update_symptoms(id: int):
    mc = Medical_Condition.query.get_or_404(id)
    if 'symptoms' not in request.json:
        return abort(400)
    if 'symptoms' in request.json:
        mc.symptoms=request.json['symptoms']
    try:
        db.session.commit()
        return jsonify(mc.serialize())
    except:
        return jsonify(False)