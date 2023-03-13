"""empty message

Revision ID: fb7bad614f2c
Revises: f0137acdb40a
Create Date: 2023-02-27 16:59:11.653665

"""
from alembic import op
import sqlalchemy as sa


# revision identifiers, used by Alembic.
revision = 'fb7bad614f2c'
down_revision = 'f0137acdb40a'
branch_labels = None
depends_on = None


def upgrade():
    # ### commands auto generated by Alembic - please adjust! ###
    op.create_table('medications',
    sa.Column('id', sa.Integer(), autoincrement=True, nullable=False),
    sa.Column('medication', sa.Text(), nullable=False),
    sa.Column('active', sa.Boolean(), nullable=False),
    sa.Column('dosage', sa.Text(), nullable=False),
    sa.Column('route', sa.Text(), nullable=False),
    sa.Column('frequency', sa.Text(), nullable=False),
    sa.Column('patient_mrn', sa.Integer(), nullable=False),
    sa.ForeignKeyConstraint(['patient_mrn'], ['patients.mrn'], ),
    sa.PrimaryKeyConstraint('id')
    )
    op.create_table('allergies',
    sa.Column('id', sa.Integer(), autoincrement=True, nullable=False),
    sa.Column('reaction', sa.Text(), nullable=False),
    sa.Column('anaphylaxis', sa.Boolean(), nullable=True),
    sa.Column('medications_id', sa.Integer(), nullable=False),
    sa.ForeignKeyConstraint(['medications_id'], ['medications.id'], ),
    sa.PrimaryKeyConstraint('id')
    )
    op.alter_column('surgeries', 'date_of_surgery',
               existing_type=sa.DATE(),
               nullable=True)
    # ### end Alembic commands ###


def downgrade():
    # ### commands auto generated by Alembic - please adjust! ###
    op.alter_column('surgeries', 'date_of_surgery',
               existing_type=sa.DATE(),
               nullable=False)
    op.drop_table('allergies')
    op.drop_table('medications')
    # ### end Alembic commands ###