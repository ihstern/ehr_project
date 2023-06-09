"""empty message

Revision ID: c02fd96f192f
Revises: 8aab4b1265bc
Create Date: 2023-02-27 15:47:18.995861

"""
from alembic import op
import sqlalchemy as sa


# revision identifiers, used by Alembic.
revision = 'c02fd96f192f'
down_revision = '8aab4b1265bc'
branch_labels = None
depends_on = None


def upgrade():
    # ### commands auto generated by Alembic - please adjust! ###
    op.add_column('patients', sa.Column('dob', sa.Date(), nullable=False))
    # ### end Alembic commands ###


def downgrade():
    # ### commands auto generated by Alembic - please adjust! ###
    op.drop_column('patients', 'dob')
    # ### end Alembic commands ###
