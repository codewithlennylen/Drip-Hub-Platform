from flask import render_template, redirect, flash, url_for
from app import app
from app.models import *
from app.forms import LoginForm, RegisterForm


@app.route('/login/', methods=['GET','POST'])
def login():
	form = LoginForm()

	if form.validate_on_submit():
		flash(f'Successfully Signed In as {form.email.data}')
		return redirect(url_for("index"))

	return render_template('UMS_templates/login.html', form = form)

@app.route('/register/', methods=['GET','POST'])
def register():
	form = RegisterForm()

	if form.validate_on_submit():
		flash(f'Successfully Registered as {form.email.data}')
		return redirect(url_for("index"))

	return render_template('UMS_templates/register.html', form = form)