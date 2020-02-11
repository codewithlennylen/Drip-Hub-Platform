from flask import Flask, render_template, url_for
from flask_sqlalchemy import SQLAlchemy


app = Flask(__name__)
app.config['SQLALCHEMY_DATABASE_URI'] = 'sqlite:///dripBase.db'
db = SQLAlchemy(app)


class product(db.Model):
	id = db.Column(db.Integer,primary_key=True)
	name = db.Column(db.String(40), nullable=False)
	picture = db.Column(db.String(80),unique=True, nullable=False)
	category = db.Column(db.String(20), nullable=False)
	rating = db.Column(db.Integer)
	date = db.Column(db.String(20),nullable=False)
	quantity = db.Column(db.Integer,nullable=False)

class brand(db.Model):
	id = db.Column(db.Integer,primary_key=True)
	name = db.Column(db.String(40), nullable=False)
	logo = db.Column(db.String(80),unique=True)
	rating = db.Column(db.Integer)

class attributes(db.Model):
	id = db.Column(db.Integer,primary_key=False)
	gender = db.Column(db.String(10), nullable=False)
	size = db.Column(db.String(10), nullable=False)
	color = db.Column(db.String(20), nullable=False)

class pictures(db.Model):
	id = db.Column(db.Integer,primary_key=True)
	path = db.Column(db.String(100), nullable=False)	

class ratings(db.Model):
	id = db.Column(db.Integer,primary_key=False)
	user = db.Column(db.String(100), nullable=False)
	rating = db.Column(db.Integer, nullable=False)
	review = db.Column(db.String(200), nullable=False)
	seller = db.Column(db.Integer, nullable=False)
	brand = db.Column(db.Integer, nullable=False)
	


@app.route('/')
def home():
	return render_template('homepage.html')


if __name__ == '__main__':
	app.run(debug=True, host='0.0.0.0')