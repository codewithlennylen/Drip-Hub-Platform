"""empty message

Revision ID: a5e8e98c80a2
Revises: 4b6ddcb2e687
Create Date: 2020-03-02 14:52:08.416962

"""
from alembic import op
import sqlalchemy as sa
from sqlalchemy.dialects import mysql

# revision identifiers, used by Alembic.
revision = 'a5e8e98c80a2'
down_revision = '4b6ddcb2e687'
branch_labels = None
depends_on = None


def upgrade():
    # ### commands auto generated by Alembic - please adjust! ###
    op.drop_constraint('brand_ibfk_1', 'brand', type_='foreignkey')
    op.drop_column('brand', 'product_id')
    op.drop_constraint('category_ibfk_1', 'category', type_='foreignkey')
    op.drop_column('category', 'product_id')
    op.drop_constraint('material_ibfk_1', 'material', type_='foreignkey')
    op.drop_column('material', 'product_id')
    op.drop_constraint('sellers_ibfk_1', 'sellers', type_='foreignkey')
    op.drop_column('sellers', 'product_id')
    # ### end Alembic commands ###


def downgrade():
    # ### commands auto generated by Alembic - please adjust! ###
    op.add_column('sellers', sa.Column('product_id', mysql.INTEGER(display_width=11), autoincrement=False, nullable=True))
    op.create_foreign_key('sellers_ibfk_1', 'sellers', 'products', ['product_id'], ['id'])
    op.add_column('material', sa.Column('product_id', mysql.INTEGER(display_width=11), autoincrement=False, nullable=True))
    op.create_foreign_key('material_ibfk_1', 'material', 'products', ['product_id'], ['id'])
    op.add_column('category', sa.Column('product_id', mysql.INTEGER(display_width=11), autoincrement=False, nullable=True))
    op.create_foreign_key('category_ibfk_1', 'category', 'products', ['product_id'], ['id'])
    op.add_column('brand', sa.Column('product_id', mysql.INTEGER(display_width=11), autoincrement=False, nullable=True))
    op.create_foreign_key('brand_ibfk_1', 'brand', 'products', ['product_id'], ['id'])
    # ### end Alembic commands ###
