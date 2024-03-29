"""empty message

Revision ID: e62373f929f1
Revises: 90d845740f9b
Create Date: 2020-03-12 16:14:57.427610

"""
from alembic import op
import sqlalchemy as sa


# revision identifiers, used by Alembic.
revision = 'e62373f929f1'
down_revision = '90d845740f9b'
branch_labels = None
depends_on = None


def upgrade():
    # ### commands auto generated by Alembic - please adjust! ###
    op.add_column('rating', sa.Column('product_id', sa.Integer(), nullable=False))
    op.create_index(op.f('ix_rating_product_id'), 'rating', ['product_id'], unique=False)
    # ### end Alembic commands ###


def downgrade():
    # ### commands auto generated by Alembic - please adjust! ###
    op.drop_index(op.f('ix_rating_product_id'), table_name='rating')
    op.drop_column('rating', 'product_id')
    # ### end Alembic commands ###
