from flask import Blueprint, jsonify, abort, request
from ..models import User, db, Patient, users_patients
import hashlib
import secrets

bp = Blueprint('users', __name__, url_prefix='/users')

def scramble(password: str):
    """Hash and salt the given password"""
    salt = secrets.token_hex(16)
    return hashlib.sha512((password + salt).encode('utf-8')).hexdigest()

@bp.route('', methods=['GET']) # decorator takes path and list of HTTP verbs
def index():
    users = User.query.all() # ORM performs SELECT query
    result = []
    for u in users:
        result.append(u.serialize()) # build list of Users as dictionaries
    return jsonify(result) # return JSON response

@bp.route('/<int:id>/', methods=['GET'])
def show(id: int):
    u = User.query.get_or_404(id)
    return jsonify(u.serialize())

@bp.route('', methods=['POST'])
def create():
    # req body must contain user_id and content
    if 'username' not in request.json or 'password' not in request.json:
        return abort(400)
    # check username and password length
    if len(request.json['username']) < 3 or len(request.json['password']) < 8:
        return abort(400)
    # construct User
    u = User(
        username=request.json['username'],
        credentials=request.json['credentials'],
        department=request.json['department'],
        name=request.json['name'],
        surname=request.json['surname'],
        password=scramble(request.json['password'])
    )
    db.session.add(u) # prepare CREATE statement
    db.session.commit() # execute CREATE statement
    return jsonify(u.serialize())

@bp.route('/<int:id>', methods=['DELETE'])
def delete(id: int):
    u = User.query.get_or_404(id)
    try:
        db.session.delete(u) # prepare DELETE statement
        db.session.commit() # execute DELETE statement
        return jsonify(True)
    except:
        # something went wrong :(
        return jsonify(False)

@bp.route('/<int:id>', methods=['PATCH', 'PUT'])
def update_username_password(id: int):
    u = User.query.get_or_404(id)
    if 'username' not in request.json and 'password' not in request.json:
        return abort(400)
    if 'username' in request.json:
        if len(request.json['username']) < 3:
            return abort(400)
        else:
            u.username=request.json['username']
    if 'password' in request.json:
        if len(request.json['password']) < 8:
            return abort(400)
        else:
            u.password=scramble(request.json['password'])
    try:
        db.session.commit()
        return jsonify(u.serialize())
    except:
        return jsonify(False)

@bp.route('/<int:id>/patient_panel', methods=['GET'])
def patient_panel(id: int):
    u = User.query.get_or_404(id)
    result = []
    for p in u.patient_panel:
        result.append(p.serialize())
    return jsonify(result)