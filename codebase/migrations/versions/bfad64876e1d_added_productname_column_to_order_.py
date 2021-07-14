"""Added productName column to order-details table

Revision ID: bfad64876e1d
Revises: c6eae3e9d7c6
Create Date: 2021-07-15 01:49:49.671268

"""
from alembic import op
import sqlalchemy as sa


# revision identifiers, used by Alembic.
revision = 'bfad64876e1d'
down_revision = 'c6eae3e9d7c6'
branch_labels = None
depends_on = None


def upgrade():
    # ### commands auto generated by Alembic - please adjust! ###
    op.add_column('orderdetails', sa.Column('productName', sa.String(length=60), nullable=True))
    op.create_index(op.f('ix_orderdetails_productName'), 'orderdetails', ['productName'], unique=False)
    # ### end Alembic commands ###


def downgrade():
    # ### commands auto generated by Alembic - please adjust! ###
    op.drop_index(op.f('ix_orderdetails_productName'), table_name='orderdetails')
    op.drop_column('orderdetails', 'productName')
    # ### end Alembic commands ###
