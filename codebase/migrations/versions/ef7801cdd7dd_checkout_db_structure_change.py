"""Checkout DB structure change

Revision ID: ef7801cdd7dd
Revises: e62373f929f1
Create Date: 2021-07-04 16:08:03.407906

"""
from alembic import op
import sqlalchemy as sa
from sqlalchemy.dialects import mysql

# revision identifiers, used by Alembic.
revision = 'ef7801cdd7dd'
down_revision = 'e62373f929f1'
branch_labels = None
depends_on = None


def upgrade():
    # ### commands auto generated by Alembic - please adjust! ###
    op.drop_index('ix_orders_transactionCode', table_name='orders')
    op.drop_column('orders', 'transactionCode')
    op.drop_index('ix_payment_dripQuota', table_name='payment')
    op.drop_index('ix_payment_dripQuotaTotal', table_name='payment')
    op.drop_index('ix_payment_sellerReturns', table_name='payment')
    op.drop_index('ix_payment_total', table_name='payment')
    op.drop_column('payment', 'dripQuotaTotal')
    op.drop_column('payment', 'dripQuota')
    op.drop_column('payment', 'total')
    op.drop_column('payment', 'sellerReturns')
    op.drop_index('ix_shippers_additionalInfo', table_name='shippers')
    op.drop_index('ix_shippers_address', table_name='shippers')
    op.drop_index('ix_shippers_city', table_name='shippers')
    op.drop_index('ix_shippers_region', table_name='shippers')
    op.drop_column('shippers', 'region')
    op.drop_column('shippers', 'city')
    op.drop_column('shippers', 'additionalInfo')
    op.drop_column('shippers', 'address')
    # ### end Alembic commands ###


def downgrade():
    # ### commands auto generated by Alembic - please adjust! ###
    op.add_column('shippers', sa.Column('address', mysql.VARCHAR(length=60), nullable=False))
    op.add_column('shippers', sa.Column('additionalInfo', mysql.VARCHAR(length=60), nullable=False))
    op.add_column('shippers', sa.Column('city', mysql.VARCHAR(length=60), nullable=False))
    op.add_column('shippers', sa.Column('region', mysql.VARCHAR(length=60), nullable=False))
    op.create_index('ix_shippers_region', 'shippers', ['region'], unique=False)
    op.create_index('ix_shippers_city', 'shippers', ['city'], unique=False)
    op.create_index('ix_shippers_address', 'shippers', ['address'], unique=False)
    op.create_index('ix_shippers_additionalInfo', 'shippers', ['additionalInfo'], unique=False)
    op.add_column('payment', sa.Column('sellerReturns', mysql.INTEGER(display_width=11), autoincrement=False, nullable=False))
    op.add_column('payment', sa.Column('total', mysql.INTEGER(display_width=11), autoincrement=False, nullable=False))
    op.add_column('payment', sa.Column('dripQuota', mysql.INTEGER(display_width=11), autoincrement=False, nullable=False))
    op.add_column('payment', sa.Column('dripQuotaTotal', mysql.INTEGER(display_width=11), autoincrement=False, nullable=False))
    op.create_index('ix_payment_total', 'payment', ['total'], unique=False)
    op.create_index('ix_payment_sellerReturns', 'payment', ['sellerReturns'], unique=False)
    op.create_index('ix_payment_dripQuotaTotal', 'payment', ['dripQuotaTotal'], unique=False)
    op.create_index('ix_payment_dripQuota', 'payment', ['dripQuota'], unique=False)
    op.add_column('orders', sa.Column('transactionCode', mysql.VARCHAR(length=60), nullable=False))
    op.create_index('ix_orders_transactionCode', 'orders', ['transactionCode'], unique=False)
    # ### end Alembic commands ###
