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
	if category_name in main_cards: # FILTER :> Different filter for the main_cards
		if category_name == 'mfashion':
			prods = products.query.filter_by(availableGender='male'or'unisex').all()
			for i in prods:
				ratin = get_ratings(productid = i.id)

		elif category_name == 'ffashion':
			prods = products.query.filter_by(availableGender='female'or'unisex').all()
			for i in prods:
				ratin = get_ratings(productid = i.id)

		elif category_name == 'kfashion':
			prods = products.query.filter_by(adultOrNot=0).all()
			for i in prods:
				ratin = get_ratings(productid = i.id)

		else:
			prods = products.query.order_by('timeStamp').all()
			for i in prods:
				ratin = get_ratings(productid = i.id)

	else:							# FILTER :> Get all products(+ details) in category x
		cat = category.query.filter_by(categoryName = category_name).first()
		prods = products.query.filter_by(categoryid = cat.id).all()
		
		# This Dictionary object stores the productID:rating
		# Accessible in the genProducts template to render individual ratings
		## Should work since the prods object is rendered without a problem
		### 1. ratin = {}
		### 2. ratin = []
		for i in prods:
			# This seems to work for now but I am not conviced 100% !
			# Fetches tuple :> (rating, no_of_reviews)
			ratin = get_ratings(productid = i.id)

	return render_template('genproducts.html', prods=prods, ratin = ratin)