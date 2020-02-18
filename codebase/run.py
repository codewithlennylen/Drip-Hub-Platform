from flask import Flask, render_template, url_for
from flask_sqlalchemy import SQLAlchemy
from flask_migrate import Migrate


app = Flask(__name__)
app.config['SQLALCHEMY_DATABASE_URI'] = 'sqlite:///dripBase.db'
db = SQLAlchemy(app)
migrate = Migrate(app, db)

# ################# ############# PRODUCTS ################ #####################

class products(db.Model):
	id = db.Column(db.Integer, primary_key=True)
	productName = db.Column(db.String(60), nullable=False)
	productDescription = db.Column(db.String(255), nullable=False)
	productPrice = db.Column(db.Integer(), nullable=False)
	categoryID = db.Column(db.Integer(), nullable=False)
	brandID = db.Column(db.Integer(), nullable=False)
	materialID = db.Column(db.Integer(), nullable=False)
	sellerID = db.Column(db.Integer(), nullable=False)
	picturePath = db.Column(db.String(100), nullable=False)
	availableSize = db.Column(db.String(20), nullable=False)
	availableColor = db.Column(db.String(100), nullable=False)
	availableGender = db.Column(db.String(25), nullable=False)
	availableQuantity = db.Column(db.Integer(), nullable=False)

	ratingID = db.Column(db.String(50), nullable=True) # From Customers' Experiences
	discount = db.Column(db.Integer(), nullable=True) # Percentage Discount
	availableDiscount = db.Column(db.String(10), nullable=True) # Y / N
	dateEntered = db.Column(db.String(50), nullable=False) # Auto-Generated During Input

class brand(db.Model):
	id = db.Column(db.Integer, primary_key=True)
	brandName = db.Column(db.String(20), nullable=False)
	brandLogo = db.Column(db.String(30), nullable=False)
	dateEntered = db.Column(db.String(50), nullable=False) # Auto-Generated During Input

class material(db.Model):
	id = db.Column(db.Integer, primary_key=True)
	materialName = db.Column(db.String(20), nullable=False)
	dateEntered = db.Column(db.String(50), nullable=False) # Auto-Generated During Input

class category(db.Model):
	id = db.Column(db.Integer, primary_key=True)
	categoryName = db.Column(db.String(20), nullable=False)
	picturePath = db.Column(db.String(100), nullable=False)
	dateEntered = db.Column(db.String(50), nullable=False) # Auto-Generated During Input

class rating(db.Model):
	id = db.Column(db.Integer, primary_key=True)
	r = db.Column(db.Integer, nullable=False)
	review = db.Column(db.String(100), nullable=True) # Leaving a review is optional
	customers = db.Column(db.Integer, nullable=False)
	customerID = db.Column(db.Integer, nullable=False)
	dateEntered = db.Column(db.String(50), nullable=False) # Auto-Generated During Input

# -----------------------------------------------------------------------------------

# ############### ############# CUSTOMERS ################ ######################

class customers(db.Model):
	id = db.Column(db.Integer, primary_key=True)
	fname = db.Column(db.String(60), nullable=False)
	lname = db.Column(db.String(60), nullable=False)
	phone1 = db.Column(db.String(60), nullable=False)
	phone2 = db.Column(db.String(60), nullable=True) # Second Phone Number is optional
	email = db.Column(db.String(60), nullable=False) # Auto-send notifications
	pword = db.Column(db.String(100), nullable=False)

	# Address information can be added later in the application or checkout.
	address = db.Column(db.String(60), nullable=True)
	additionalInfo = db.Column(db.String(60), nullable=True)
	city = db.Column(db.String(60), nullable=True)
	region = db.Column(db.String(60), nullable=True)
	dateEntered = db.Column(db.String(50), nullable=False) # Auto-Generated During Input

# -----------------------------------------------------------------------------------

# ############### ############# SELLERS ################ ######################

class sellers(db.Model):
	id = db.Column(db.Integer, primary_key=True)
	# Must be a customer first befrore you can sell.
	custID = db.Column(db.Integer(), nullable=False) # More on this later
	companyName = db.Column(db.String(60), nullable=False)
	specialty = db.Column(db.String(60), nullable=False)
	companyLogo = db.Column(db.String(60), nullable=False) # If not available, Drip-Hub provides a default

	# Address information may be different from the home address (customer table).
	approved = db.Column(db.String(10), nullable=False) # Y / N
	address = db.Column(db.String(60), nullable=False)
	additionalInfo = db.Column(db.String(60), nullable=False)
	city = db.Column(db.String(60), nullable=False)
	region = db.Column(db.String(60), nullable=False)
	dateEntered = db.Column(db.String(50), nullable=False) # Auto-Generated During Input

# -----------------------------------------------------------------------------------


# ############### ############# SHIPPERS ################ ######################

class shippers(db.Model):
	id = db.Column(db.Integer, primary_key=True)
	companyName = db.Column(db.String(60), nullable=False)
	companyLogo = db.Column(db.String(60), nullable=False) # If not available, Drip-Hub provides a default
	phone1 = db.Column(db.String(60), nullable=False)
	phone2 = db.Column(db.String(60), nullable=True) # Second Phone Number is optional
	email1 = db.Column(db.String(60), nullable=False) # Auto-send notifications
	email2 = db.Column(db.String(60), nullable=True) # Second E-mail address is optional

	# Address information may be different from the home address (customer table).
	address = db.Column(db.String(60), nullable=False)
	additionalInfo = db.Column(db.String(60), nullable=False)
	city = db.Column(db.String(60), nullable=False)
	region = db.Column(db.String(60), nullable=False)

	dateEntered = db.Column(db.String(50), nullable=False) # Auto-Generated During Input

# -----------------------------------------------------------------------------------


# ############### ############# ADMINS ################ ######################

class admin(db.Model):
	id = db.Column(db.Integer, primary_key=True)
	fname = db.Column(db.String(60), nullable=False)
	lname = db.Column(db.String(60), nullable=False)
	phone1 = db.Column(db.String(60), nullable=False)
	phone2 = db.Column(db.String(60), nullable=True) # Second Phone Number is optional
	email = db.Column(db.String(60), nullable=False) # Auto-send notifications
	pword = db.Column(db.String(100), nullable=False)

	dateEntered = db.Column(db.String(50), nullable=False) # Auto-Generated During Input

# -----------------------------------------------------------------------------------

# ############### ############# ORDERS ################ ######################

class orders(db.Model):
	id = db.Column(db.Integer, primary_key=True)
	customerID = db.Column(db.Integer(), nullable=False)
	transactionCode = db.Column(db.String(60), nullable=False)

	# Date the order was placed
	dateEntered = db.Column(db.String(50), nullable=False) # Auto-Generated During Input

class orderDetails(db.Model):
	id = db.Column(db.Integer, primary_key=True)
	orderID = db.Column(db.Integer(), nullable=False)
	productID = db.Column(db.Integer(), nullable=False)
	shipperID = db.Column(db.Integer(), nullable=False)

	price = db.Column(db.Integer(), nullable=False)
	quantity = db.Column(db.Integer(), nullable=False)
	discount = db.Column(db.Integer(), nullable=False)
	total = db.Column(db.Integer(), nullable=False)
	size = db.Column(db.String(60), nullable=False)
	color = db.Column(db.String(60), nullable=True)
	fulfilledDate = db.Column(db.String(20), nullable=False) #Date/N

	dateEntered = db.Column(db.String(50), nullable=False) # Auto-Generated During Input

# -----------------------------------------------------------------------------------

# ############### ############# PAYMENT ################ ######################

# This is not a very future-proof model. More thought has to be invested in this section!
class payment(db.Model):
	id = db.Column(db.Integer(), primary_key=True)
	transactionCode = db.Column(db.String(60), nullable=False) # M-PESA
	
	paidTotal = db.Column(db.Integer(), nullable=False)
	shipperPrice = db.Column(db.Integer(), nullable=False)
	dripQuota = db.Column(db.Integer(), nullable=False) # Percentage of unit price
	dripQuotaTotal = db.Column(db.Integer(), nullable=False)

	# paidTotal-(shipperPrice+dripQuotaTotal)
	# Back to seller
	sellerReturns = db.Column(db.Integer(), nullable=False)
	
	total = db.Column(db.Integer(), nullable=False)
	
	dateEntered = db.Column(db.String(50), nullable=False) # Auto-Generated During Input

# -----------------------------------------------------------------------------------




@app.route('/')
def home():
	return render_template('homepage.html')


if __name__ == '__main__':
	db.create_all()
	app.run(debug=True, host='0.0.0.0')