from flask import render_template
from app import app
from app.models import *

@app.route('/')
@app.route('/index/')
def index():
	c = category.query.all()
	return render_template('homepage.html', c = c)


@app.route('/gen/')
def general():
	return render_template('genproducts.html')