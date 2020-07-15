from flask import render_template
from app import app
from app.models import *
from app.forms import LoginForm, RegisterForm


@app.route('/login/', methods=['GET','POST'])
def login():
	form = LoginForm()
	return render_template('UMS_templates/login.html', form = form)

@app.route('/register/', methods=['GET','POST'])
def register():
	form = RegisterForm()
	return render_template('UMS_templates/register.html', form = form)