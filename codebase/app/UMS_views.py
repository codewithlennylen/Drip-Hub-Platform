from flask import render_template, redirect, flash, url_for, request
from app import app
from app.models import *
# from app.forms import LoginForm, RegisterForm


@app.route('/login/', methods=['GET','POST'])
def login():
	# form = LoginForm()

	if request.method == 'POST':
		req = request.form

		missing = list()
		for k, v in req.items():
			if v == "":
				missing.append(k)

		if missing:
			flash("Please Fill in All the Fields")
			return render_template("UMS_templates/login.html")

		flash(f'Successfully Signed In as {request.form["inputEmail"]}:{request.form["inputPassword"]}')
		return redirect(url_for("index"))

	return render_template('UMS_templates/login.html')

@app.route('/register/', methods=['GET','POST'])
def register():
	# form = RegisterForm()

	if request.method == 'POST':
		req = request.form

		missing = list()
		for k, v in req.items():
			if v == "":
				missing.append(k)

		if missing:
			flash("Please Fill in All the Fields")
			return render_template("UMS_templates/register.html")
			
		flash(f'Successfully Registered as {request.form["inputFname"]}:{request.form["inputPhone"]}')
		return redirect(url_for("index"))

	return render_template('UMS_templates/register.html')