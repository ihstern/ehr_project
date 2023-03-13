from flask import Blueprint, jsonify, abort, request
from ..models import Medication, Allergy, db

bp = Blueprint('allergies', __name__, url_prefix='/allergies')

@bp.route('', methods=['GET']) # decorator takes path and list of HTTP verbs
def index():
    allergies = Allergy.query.all() # ORM performs SELECT query
    result = []
    for a in allergies:
        result.append(a.serialize()) # build list of Users as dictionaries
    return jsonify(result) # return JSON response

@bp.route('/<int:id>/', methods=['GET'])
def show(id: int):
    a = Allergy.query.get_or_404(id)
    return jsonify(a.serialize())

@bp.route('', methods=['POST'])
def create():
    a = Allergy(
        reaction=request.json['reaction'],
        anaphylaxis=request.json['anaphylaxis']
    )
    db.session.add(a) # prepare CREATE statement
    db.session.commit() # execute CREATE statement
    return jsonify(a.serialize()) 

@bp.route('/<int:id>', methods=['DELETE'])
def delete(id: int):
    a = Allergy.query.get_or_404(id)
    try:
        db.session.delete(a) # prepare DELETE statement
        db.session.commit() # execute DELETE statement
        return jsonify(True)
    except:
        # something went wrong :(
        return jsonify(False)

@bp.route('/<int:id>', methods=['PATCH', 'PUT'])
def update_med(id: int):
    a = Allergy.query.get_or_404(id)
    if 'reaction' not in request.json and 'anaphylaxis' not in request.json:
        return abort(400)
    if 'reaction' in request.json:
        a.reaction=request.json['reaction']
    if 'anaphylaxis' in request.json:
        a.anaphylaxis=request.json['anaphylaxis']
    try:
        db.session.commit()
        return jsonify(a.serialize())
    except:
        return jsonify(False)
