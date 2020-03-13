from flask import render_template
from app import app
from app.models import *


main_cards = ['mfashion','ffashion','kfashion','narrivals']


def get_ratings(productid):
	# get all ratings for a certain product
	ratings = rating.query.filter_by(product_id = 1).all()
	
	# This part of the function returns the average rating (out of 5)
	rNum = 0
	counter = 0
	reviewNum = []
	for i in ratings:
		rNum += int(i.r)
		counter += 1

	return (rNum//counter) # get integer rating out of 5 Stars 


@app.route('/')
@app.route('/index/')
def index():
	# Get all categories in the database categories table.
	# * main_cards aren't part of this query
	c = category.query.all()
	return render_template('homepage.html', c = c)

@app.route('/gen/<string:category_name>/')
def general(category_name):
	if category_name in main_cards: # FILTER :> Different filter for the main_cards
		pass
	else:							# FILTER :> Get all products(+ details) in category x
		cat = category.query.filter_by(categoryName = category_name).first()
		prods = products.query.filter_by(categoryid = cat.id).all()
		
		for i in prods:
			ratin = get_ratings(productid = i.id)

	return render_template('genproducts.html', prods=prods, ratin = ratin)