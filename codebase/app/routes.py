from flask import render_template
from app import app
from app.models import *


main_cards = ['mfashion','ffashion','kfashion','narrivals']

@app.route('/')
@app.route('/index/')
def index():
	# Get all categories in the database categories table.
	# * main_cards aren't part of this query
	c = category.query.all()
	return render_template('homepage.html', c = c)


@app.route('/gen/<string:category_name>/')
def general(category_name):
	if category_name in main_cards: # Different filter for the main_cards
		pass
	else:							# Get all products(+ details) in category x
		cat = category.query.filter_by(categoryName = category_name).first()
		catID = cat.id

		prods = products.query.filter_by(categoryid = catID).all()

	return render_template('genproducts.html', prods=prods)