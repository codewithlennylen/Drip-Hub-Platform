from flask import render_template
from app import app
from app.models import *
from app.forms import LoginForm


@app.route('/login/')
def login():
	form = LoginForm()
	return render_template('UMS_templates/login.html', form = form)