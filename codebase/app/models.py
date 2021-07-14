from app import db, login_manager, app
from datetime import datetime
from flask_login import UserMixin
from itsdangerous import TimedJSONWebSignatureSerializer as Serializer

@login_manager.user_loader
def load_user(user_id):
	return customers.query.get(int(user_id))


# ################# ############# PRODUCTS ################ #####################

class products(db.Model):
	id = db.Column(db.Integer, index=True, primary_key=True)
	productName = db.Column(db.String(60), index=True, nullable=False)
	productDescription = db.Column(db.String(255), index=True, nullable=False)
	productPrice = db.Column(db.Integer, nullable=False)

	categoryid = db.Column(db.Integer, index=True, nullable=True)
	brandid = db.Column(db.Integer, index=True, nullable=True)
	materialid = db.Column(db.Integer, index=True, nullable=True)

	sellerid = db.Column(db.Integer, index=True, nullable=True)

	picturePath = db.Column(db.String(100), index=True, nullable=False)
	availableSize = db.Column(db.String(20), index=True, nullable=False)
	availableColor = db.Column(db.String(100), index=True, nullable=False)
	availableGender = db.Column(db.String(25), index=True, nullable=False)
	availableQuantity = db.Column(db.Integer, index=True, nullable=False)
	adultOrNot = db.Column(db.Integer, index=True, nullable=False) # 0-Kid , 1-Adult

	discount = db.Column(db.Integer, index=True, nullable=True) # Percentage Discount
	availableDiscount = db.Column(db.Integer, index=True, nullable=True) # 1 / 0
	timeStamp = db.Column(db.DateTime, index=True, default=datetime.utcnow) # Auto-Generated During Input


class brand(db.Model):
	id = db.Column(db.Integer, primary_key=True)
	brandName = db.Column(db.String(20), index=True, nullable=False)
	brandLogo = db.Column(db.String(30), index=True, nullable=False)
	timeStamp = db.Column(db.DateTime, index=True, default=datetime.utcnow) # Auto-Generated During Input


class material(db.Model):
	id = db.Column(db.Integer, primary_key=True)
	materialName = db.Column(db.String(20), index=True, nullable=False)
	timeStamp = db.Column(db.DateTime, index=True, default=datetime.utcnow) # Auto-Generated During Input


class category(db.Model):
	id = db.Column(db.Integer, primary_key=True)
	categoryName = db.Column(db.String(20), index=True, nullable=False)	
	picPath = db.Column(db.String(100), index=True, nullable=True)
	timeStamp = db.Column(db.DateTime, index=True, default=datetime.utcnow) # Auto-Generated During Input


class rating(db.Model):
	id = db.Column(db.Integer, primary_key=True)
	product_id = db.Column(db.Integer, index=True, nullable=False) # Which product's being rated?
	r = db.Column(db.Integer, index=True, nullable=False) # 0-5
	review = db.Column(db.String(100), index=True, nullable=True) # Leaving a review is optional

	timeStamp = db.Column(db.DateTime, index=True, default=datetime.utcnow) # Auto-Generated During Input


# -----------------------------------------------------------------------------------

# ############### ############# CUSTOMERS ################ ######################

class customers(db.Model, UserMixin):
	id = db.Column(db.Integer, primary_key=True)
	fname = db.Column(db.String(60), index=True,nullable=False)
	lname = db.Column(db.String(60), index=True,nullable=False)
	phone1 = db.Column(db.String(60), index=True,nullable=False)
	phone2 = db.Column(db.String(60), nullable=True) # Second Phone Number is optional
	email = db.Column(db.String(60), index=True,nullable=False) # Auto-send notifications
	pword = db.Column(db.String(100), index=True,nullable=False)

	orderid = db.relationship('orders', backref='oid', lazy='dynamic')
	# ratingid = db.relationship('rating', backref='rid', lazy='dynamic')

	# Address information can be added later in the application or checkout.
	address = db.Column(db.String(60), index=True, nullable=True)
	additionalInfo = db.Column(db.String(60), index=True, nullable=True)
	city = db.Column(db.String(60), index=True, nullable=True)
	region = db.Column(db.String(60), index=True, nullable=True)
	timeStamp = db.Column(db.DateTime, index=True, default=datetime.utcnow) # Auto-Generated During Input

	def get_reset_token(self, expires_Sec=1800):
		s = Serializer(app.config['SECRET_KEY'], expires_Sec)
		token = s.dumps({'user_id': self.id}).decode('utf-8')

		return token
	
	@staticmethod # Tell Python not to expect the self parameter for this method
	def verify_reset_token(token):
		s = Serializer(app.config['SECRET_KEY'])
		try:
			user_id = s.loads(token)['user_id']
		except:
			return None

		return customers.query.get(user_id)

# -----------------------------------------------------------------------------------

# ############### ############# SELLERS ################ ######################

class sellers(db.Model):
	id = db.Column(db.Integer, primary_key=True)
	# Must be a customer first befrore you can sell.
	custID = db.Column(db.Integer, nullable=False) # More on this later
	companyName = db.Column(db.String(60), index=True, nullable=False)
	specialty = db.Column(db.String(60), index=True, nullable=False)
	companyLogo = db.Column(db.String(60), index=True, nullable=False) # If not available, Drip-Hub provides a default

	# Address information may be different from the home address (customer table).
	approved = db.Column(db.String(10), index=True, nullable=False) # Y / N
	address = db.Column(db.String(60), index=True, nullable=False)
	additionalInfo = db.Column(db.String(60), index=True, nullable=False)
	city = db.Column(db.String(60), index=True, nullable=False)
	region = db.Column(db.String(60), index=True, nullable=False)
	timeStamp = db.Column(db.DateTime, index=True, default=datetime.utcnow) # Auto-Generated During Input

# -----------------------------------------------------------------------------------

# ############### ############# ADMINS ################ ######################

class admin(db.Model):
	id = db.Column(db.Integer, primary_key=True)
	fname = db.Column(db.String(60), index=True, nullable=False)
	lname = db.Column(db.String(60), index=True, nullable=False)
	phone1 = db.Column(db.String(60), index=True, nullable=False)
	phone2 = db.Column(db.String(60), index=True, nullable=True) # Second Phone Number is optional
	email = db.Column(db.String(60), index=True, nullable=False) # Auto-send notifications
	pword = db.Column(db.String(100), index=True, nullable=False)

	timeStamp = db.Column(db.DateTime, index=True, default=datetime.utcnow) # Auto-Generated During Input

# -----------------------------------------------------------------------------------


# ############### ############# SHIPPERS ################ ######################

#! Will be implemented in the future, once we've figured out the logistics
class shippers(db.Model):
	id = db.Column(db.Integer, primary_key=True)
	
	# One shipper can have multiple orders.
	order_id = db.Column(db.Integer, db.ForeignKey('orders.id'))
	
	companyName = db.Column(db.String(60), index=True, nullable=False)
	companyLogo = db.Column(db.String(60), index=True, nullable=False) # If not available, Drip-Hub provides a default
	phone1 = db.Column(db.String(60), index=True, nullable=False)
	phone2 = db.Column(db.String(60), index=True, nullable=True) # Second Phone Number is optional
	#? Consider a biker, where's the time to open email notifications?
	#* This is still relevant for the future; scaling!
	email1 = db.Column(db.String(60), index=True, nullable=False) # Auto-send notifications
	email2 = db.Column(db.String(60), index=True, nullable=True) # Second E-mail address is optional

	# Address information may be different from the home address (customer table).
	#? If shipping is outsourced, why the heck would we need their address?
	# address = db.Column(db.String(60), index=True, nullable=False)
	# additionalInfo = db.Column(db.String(60), index=True, nullable=False)
	# city = db.Column(db.String(60), index=True, nullable=False)
	# region = db.Column(db.String(60), index=True, nullable=False)

	timeStamp = db.Column(db.DateTime, index=True, default=datetime.utcnow) # Auto-Generated During Input

# -----------------------------------------------------------------------------------


# ############### ############# ORDERS ################ ######################

class orders(db.Model):
	id = db.Column(db.Integer, primary_key=True)

	# Relationships
	customer_id = db.Column(db.Integer, db.ForeignKey('customers.id'))
	orderdetailsid = db.relationship('orderdetails', backref='odid', lazy='dynamic')
	paymentid = db.relationship('payment', backref='pid', lazy='dynamic')
	
	# This relationship is dormant for now. Until shippers are implemented.
	shipperid = db.relationship('shippers', backref='sid', lazy='dynamic')

	# Get this info from payment table ->> Poor Implementation
	#// transactionCode = db.Column(db.String(60), index=True, nullable=False) 
	#* I removed the line/column above  as it was unnecessary. >> Redundant & extra work

	# Date the order was placed
	timeStamp = db.Column(db.DateTime, index=True, default=datetime.utcnow) # Auto-Generated During Input

class orderdetails(db.Model):
	id = db.Column(db.Integer, primary_key=True)

	# From relationships
	order_id = db.Column(db.Integer, db.ForeignKey('orders.id'))
	product_id = db.Column(db.Integer, db.ForeignKey('products.id'))

	price = db.Column(db.Integer, index=True, nullable=False)
	quantity = db.Column(db.Integer, index=True, nullable=False)
	discount = db.Column(db.Integer, index=True, nullable=False)
	total = db.Column(db.Integer, index=True, nullable=False)
	material = db.Column(db.String(60), index=True, nullable=True)
	size = db.Column(db.String(60), index=True, nullable=False)
	color = db.Column(db.String(60), index=True, nullable=True)
	fulfilledDate = db.Column(db.String(20), index=True, nullable=False) #Date/N -> Tracking purposes.

	# After definitely-not-enough thought put into this, I have decided to include Product name as a column
	productName = db.Column(db.String(60), index=True, nullable=True)

	timeStamp = db.Column(db.DateTime, index=True, default=datetime.utcnow) # Auto-Generated During Input

# -----------------------------------------------------------------------------------

# ############### ############# PAYMENT ################ ######################

# This is not a very future-proof model. More thought has to be invested in this section!
class payment(db.Model):
	id = db.Column(db.Integer, primary_key=True)
	
	order_id = db.Column(db.Integer, db.ForeignKey('orders.id'))

	transactionCode = db.Column(db.String(60), index=True, nullable=False) # M-PESA
	paidTotal = db.Column(db.Integer, index=True, nullable=False)
	shipperPrice = db.Column(db.Integer, index=True, nullable=False)

	#! This was for an 'open' model where other sellers can list their items > Poor implementation thoigh
	#// dripQuota = db.Column(db.Integer, index=True, nullable=False) # Percentage of unit price
	#// dripQuotaTotal = db.Column(db.Integer, index=True, nullable=False)
	# paidTotal-(shipperPrice+dripQuotaTotal)
	# Back to seller
	#// sellerReturns = db.Column(db.Integer, index=True, nullable=False)
	#// total = db.Column(db.Integer, index=True, nullable=False)
	
	timeStamp = db.Column(db.DateTime, index=True, default=datetime.utcnow) # Auto-Generated During Input

# -----------------------------------------------------------------------------------
