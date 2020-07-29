from flask import render_template, redirect, flash, url_for, request
from app import app, db
from app.models import *


def register_user(f_name, l_name, p_number, e_address, pwd):
	customer = customers(fname=f_name,
                      lname=l_name,
                      phone1=p_number,
                      email=e_address,
                      pword=pwd)

	print(customer.fname)
	
	try:
		db.session.add(customer)
		db.session.commit()
	except Exception as e:
		print(e)
	


@app.route('/login/', methods=['GET','POST'])
def login():
	if request.method == 'POST':
		req = request.form

		# Server-side Data Validation
		missing = False
		for _, v in req.items():
			if v == "":  # Checking for any Missing Fields
				missing = True

		if missing:
			flash("Please Fill in All the Fields")
			return render_template("UMS_templates/login.html")

		flash(f'Successfully Signed In as {request.form["inputEmail"]}:{request.form["inputPassword"]}')
		return redirect(url_for("index"))

	return render_template('UMS_templates/login.html')

@app.route('/register/', methods=['GET','POST'])
def register():
	if request.method == 'POST':
		req = request.form

		# Server-side Data Validation
		missing = False
		for _, v in req.items():
			if v == "": # Checking for any Missing Fields
				missing = True 

		if missing:
			flash("Please Fill in All the Fields")
			return render_template("UMS_templates/register.html")
		
		# Proceed to Register the User by adding them to the Database
		first_name = req['inputFname']
		last_name = req['inputLname']
		phone_number = req['inputPhone']
		email_address = req['inputEmail']
		pasword = req['inputPassword']

		# Verify the Input - Password,names, email? >> Bootstrap Client-Side Validation ?

		# Pass the Fields to the register_user() Function
		register_user(first_name, last_name, phone_number, email_address, pasword)

		flash(f'Successfully Registered as {request.form["inputFname"]}:{request.form["inputPhone"]}')
		return redirect(url_for("index"))

	return render_template('UMS_templates/register.html')
