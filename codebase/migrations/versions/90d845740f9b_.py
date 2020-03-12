"""empty message

Revision ID: 90d845740f9b
Revises: 8bf3cbb3e944
Create Date: 2020-03-12 16:13:10.913518

"""
from alembic import op
import sqlalchemy as sa
from sqlalchemy.dialects import mysql

# revision identifiers, used by Alembic.
revision = '90d845740f9b'
down_revision = '8bf3cbb3e944'
branch_labels = None
depends_on = None


def upgrade():
    # ### commands auto generated by Alembic - please adjust! ###
    op.drop_constraint('rating_ibfk_2', 'rating', type_='foreignkey')
    op.drop_column('rating', 'product_id')
    # ### end Alembic commands ###


def downgrade():
    # ### commands auto generated by Alembic - please adjust! ###
    op.add_column('rating', sa.Column('product_id', mysql.INTEGER(display_width=11), autoincrement=False, nullable=True))
    op.create_foreign_key('rating_ibfk_2', 'rating', 'products', ['product_id'], ['id'])
    # ### end Alembic commands ###
