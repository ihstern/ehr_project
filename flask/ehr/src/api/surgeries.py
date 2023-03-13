from flask import Blueprint, jsonify, abort, request
from ..models import Surgery, User, db

bp = Blueprint('surgeries', __name__, url_prefix='/surgeries')

@bp.route('', methods=['GET']) # decorator takes path and list of HTTP verbs
def index():
    surgeries = Surgery.query.all() # ORM performs SELECT query
    result = []
    for s in surgeries:
        result.append(s.serialize()) # build list of Users as dictionaries
    return jsonify(result) # return JSON response

@bp.route('/<int:id>/', methods=['GET'])
def show(id: int):
    s = Surgery.query.get_or_404(id)
    return jsonify(s.serialize())

@bp.route('', methods=['POST'])
def create():
    s = Surgery(
        procedure=request.json['procedure'],
        date_of_surgery=request.json['date_of_surgery'],
        patient_mrn=request.json['patient_mrn']
    )
    db.session.add(s) # prepare CREATE statement
    db.session.commit() # execute CREATE statement
    return jsonify(s.serialize())



