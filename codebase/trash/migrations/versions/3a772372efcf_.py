"""empty message

Revision ID: 3a772372efcf
Revises: 
Create Date: 2020-03-11 13:11:01.339864

"""
from alembic import op
import sqlalchemy as sa


# revision identifiers, used by Alembic.
revision = '3a772372efcf'
down_revision = None
branch_labels = None
depends_on = None


def upgrade():
    # ### commands auto generated by Alembic - please adjust! ###
    op.add_column('products', sa.Column('adultOrNot', sa.Integer(), nullable=False))
    op.add_column('products', sa.Column('availableColor', sa.String(length=100), nullable=False))
    op.add_column('products', sa.Column('availableDiscount', sa.Integer(), nullable=True))
    op.add_column('products', sa.Column('availableGender', sa.String(length=25), nullable=False))
    op.add_column('products', sa.Column('availableQuantity', sa.Integer(), nullable=False))
    op.add_column('products', sa.Column('availableSize', sa.String(length=20), nullable=False))
    op.add_column('products', sa.Column('brandid', sa.Integer(), nullable=True))
    op.add_column('products', sa.Column('categoryid', sa.Integer(), nullable=True))
    op.add_column('products', sa.Column('discount', sa.Integer(), nullable=True))
    op.add_column('products', sa.Column('materialid', sa.Integer(), nullable=True))
    op.add_column('products', sa.Column('picturePath', sa.String(length=100), nullable=False))
    op.add_column('products', sa.Column('productDescription', sa.String(length=255), nullable=False))
    op.add_column('products', sa.Column('productName', sa.String(length=60), nullable=False))
    op.add_column('products', sa.Column('productPrice', sa.Integer(), nullable=False))
    op.add_column('products', sa.Column('sellerid', sa.Integer(), nullable=True))
    op.add_column('products', sa.Column('timeStamp', sa.DateTime(), nullable=True))
    op.create_index(op.f('ix_products_adultOrNot'), 'products', ['adultOrNot'], unique=False)
    op.create_index(op.f('ix_products_availableColor'), 'products', ['availableColor'], unique=False)
    op.create_index(op.f('ix_products_availableDiscount'), 'products', ['availableDiscount'], unique=False)
    op.create_index(op.f('ix_products_availableGender'), 'products', ['availableGender'], unique=False)
    op.create_index(op.f('ix_products_availableQuantity'), 'products', ['availableQuantity'], unique=False)
    op.create_index(op.f('ix_products_availableSize'), 'products', ['availableSize'], unique=False)
    op.create_index(op.f('ix_products_brandid'), 'products', ['brandid'], unique=False)
    op.create_index(op.f('ix_products_categoryid'), 'products', ['categoryid'], unique=False)
    op.create_index(op.f('ix_products_discount'), 'products', ['discount'], unique=False)
    op.create_index(op.f('ix_products_id'), 'products', ['id'], unique=False)
    op.create_index(op.f('ix_products_materialid'), 'products', ['materialid'], unique=False)
    op.create_index(op.f('ix_products_picturePath'), 'products', ['picturePath'], unique=False)
    op.create_index(op.f('ix_products_productDescription'), 'products', ['productDescription'], unique=False)
    op.create_index(op.f('ix_products_productName'), 'products', ['productName'], unique=False)
    op.create_index(op.f('ix_products_sellerid'), 'products', ['sellerid'], unique=False)
    op.create_index(op.f('ix_products_timeStamp'), 'products', ['timeStamp'], unique=False)
    # ### end Alembic commands ###


def downgrade():
    # ### commands auto generated by Alembic - please adjust! ###
    op.drop_index(op.f('ix_products_timeStamp'), table_name='products')
    op.drop_index(op.f('ix_products_sellerid'), table_name='products')
    op.drop_index(op.f('ix_products_productName'), table_name='products')
    op.drop_index(op.f('ix_products_productDescription'), table_name='products')
    op.drop_index(op.f('ix_products_picturePath'), table_name='products')
    op.drop_index(op.f('ix_products_materialid'), table_name='products')
    op.drop_index(op.f('ix_products_id'), table_name='products')
    op.drop_index(op.f('ix_products_discount'), table_name='products')
    op.drop_index(op.f('ix_products_categoryid'), table_name='products')
    op.drop_index(op.f('ix_products_brandid'), table_name='products')
    op.drop_index(op.f('ix_products_availableSize'), table_name='products')
    op.drop_index(op.f('ix_products_availableQuantity'), table_name='products')
    op.drop_index(op.f('ix_products_availableGender'), table_name='products')
    op.drop_index(op.f('ix_products_availableDiscount'), table_name='products')
    op.drop_index(op.f('ix_products_availableColor'), table_name='products')
    op.drop_index(op.f('ix_products_adultOrNot'), table_name='products')
    op.drop_column('products', 'timeStamp')
    op.drop_column('products', 'sellerid')
    op.drop_column('products', 'productPrice')
    op.drop_column('products', 'productName')
    op.drop_column('products', 'productDescription')
    op.drop_column('products', 'picturePath')
    op.drop_column('products', 'materialid')
    op.drop_column('products', 'discount')
    op.drop_column('products', 'categoryid')
    op.drop_column('products', 'brandid')
    op.drop_column('products', 'availableSize')
    op.drop_column('products', 'availableQuantity')
    op.drop_column('products', 'availableGender')
    op.drop_column('products', 'availableDiscount')
    op.drop_column('products', 'availableColor')
    op.drop_column('products', 'adultOrNot')
    # ### end Alembic commands ###
