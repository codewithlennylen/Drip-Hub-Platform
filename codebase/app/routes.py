from flask import render_template
from app import app
from app.models import *


main_cards = ['mfashion','ffashion','kfashion','narrivals']


def get_ratings(productid):
	# get all ratings for a certain product
	ratings = rating.query.filter_by(product_id = productid).all()
	
	# This part of the function returns the average rating (out of 5)
	rNum = 0
	counter = 0
	reviewNum = []
	for i in ratings:
		rNum += int(i.r)
		counter += 1

	rats = (rNum//counter) # get integer rating out of 5 Stars 

	return rats,counter

@app.route('/')
@app.route('/index/')
def index():
	# Get all categories in the database categories table.
	# * main_cards aren't part of this query
	c = category.query.order_by("categoryName").all() # Get the categories in alphabetical order
	return render_template('homepage.html', c = c)

@app.route('/gen/<string:category_name>/')
def general(category_name):
	# Pass a dictionary object to genproducts template:{<product>:(rating),..}
	proDict = {}
	# Get the categories in alphabetical order
	c = category.query.order_by("categoryName").all()
	toggle = 0
	if category_name in main_cards: # FILTER :> Different filter for the main_cards
		if category_name == 'mfashion':
			prods = products.query.filter_by(availableGender='male'or'unisex').all()
			toggle = 1
			for i in prods:
				proDict[i] = get_ratings(productid = i.id)
				# ratin = get_ratings(productid = i.id)

		elif category_name == 'ffashion':
			prods = products.query.filter_by(availableGender='female'or'unisex').all()
			toggle = 1
			for i in prods:
				proDict[i] = get_ratings(productid = i.id)

		elif category_name == 'kfashion':
			prods = products.query.filter_by(adultOrNot=0).all()
			toggle = 1
			for i in prods:
				proDict[i] = get_ratings(productid = i.id)

		else:
			prods = products.query.order_by('timeStamp').all()
			toggle = 1
			for i in prods:
				proDict[i] = get_ratings(productid = i.id)

	else:							# FILTER :> Get all products(+ details) in category x
		cat = category.query.filter_by(categoryName = category_name).first()
		prods = products.query.filter_by(categoryid = cat.id).all()
		toggle = 0
		
		for i in prods:
			proDict[i] = get_ratings(productid = i.id)

	return render_template('genproducts.html', proDict = proDict, c = c, toggle = toggle)
	# return render_template('genproducts.html', prods=prods, ratin = ratin)


# REMEMBER TO PREVENT DATA EXFILTRATION VIA ENUMERATION!
# ADD UNIQUE PID FIELD IN DB :> YOUTUBE VIDEO IDs >>> PRODUCT IDs
@app.route('/provw/<int:product_id>/') # A product's ID is its unique identifier!
def prodView(product_id):
	# Get the product with the matching ID
	prod = products.query.filter_by(id = product_id).first()
	brands = brand.query.filter_by(id = prod.brandid).first()
	proDict = {}
	proDict[prod] = [list(get_ratings(productid = product_id)), brands.brandName]

	return render_template('productview2.html', proDict = proDict)