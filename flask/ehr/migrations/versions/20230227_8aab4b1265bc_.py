"""empty message

Revision ID: 8aab4b1265bc
Revises: fc7ae02e6b00
Create Date: 2023-02-27 15:38:48.731854

"""
from alembic import op
import sqlalchemy as sa


# revision identifiers, used by Alembic.
revision = '8aab4b1265bc'
down_revision = 'fc7ae02e6b00'
branch_labels = None
depends_on = None


def upgrade():
    # ### commands auto generated by Alembic - please adjust! ###
    op.add_column('patients', sa.Column('user_id', sa.Integer(), nullable=False))
    op.create_foreign_key(None, 'patients', 'users', ['user_id'], ['id'])
    # ### end Alembic commands ###


def downgrade():
    # ### commands auto generated by Alembic - please adjust! ###
    op.drop_constraint(None, 'patients', type_='foreignkey')
    op.drop_column('patients', 'user_id')
    # ### end Alembic commands ###