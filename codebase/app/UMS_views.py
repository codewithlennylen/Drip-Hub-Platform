from flask import render_template, redirect, flash, url_for, request
from flask_login import login_user, current_user
from app import app, db, bcrypt
from app.models import customers



def pword_hash(pwd):
	pwd_hash = bcrypt.generate_password_hash(str(pwd)).decode('utf-8')
	
	return pwd_hash


def register_user(f_name, l_name, p_number, e_address, pwd):
	# First check whether there is a similar e-mail in the Database
	user = customers.query.filter_by(email=e_address).first()
	if user:
		return 'Email Exists'

	customer = customers(fname=f_name,
                      lname=l_name,
                      phone1=p_number,
                      email=e_address,
                      pword=pwd)
	
	try:
		db.session.add(customer)
		db.session.commit()
		return 'Success'
	except Exception as e:
		print(e)
		return 'Failed : Exception'
	

def login_customer(email_address, pasword):
	user = customers.query.filter_by(email=email_address).first()

	# Check for Correct Credentials
	if user and bcrypt.check_password_hash(user.pword, pasword):
		login_user(user)
		return True
	else:
		flash("Login Failed. Please Check Your E-mail & Password")

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

		# Proceed to Login the User by verifying from the Database
		email_address = req['inputEmail']
		pasword = req['inputPassword']

		# Verify the Input - Password,names, email? >> Bootstrap Client-Side Validation ?

		# Pass the Fields to the login_customer() Function
		status = login_customer(email_address, pasword)

		if status == True:
			flash(f'Successfully Signed In.')
			return redirect(url_for("index"))
		# else:
		# 	flash('Login Failed. Ple')

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
		pasword = pword_hash(req['inputPassword']) # Hash the Password First! 

		# Verify the Input - Password,names, email? >> Bootstrap Client-Side Validation ?

		# Pass the Fields to the register_user() Function
		status = register_user(first_name, last_name, phone_number, email_address, pasword)

		if status == 'Success':
			flash(f'Your Account has been Set up. Please Sign In')
			return redirect(url_for("login"))
		elif status == 'Email Exists':
			flash(
				f'That E-mail Already Exists. Please Sign In or Try a Different E-mail')
			return render_template('UMS_templates/register.html')
		elif status == 'Failed : Exception':
			flash(
				f'Error Occured at Exception')
			return render_template('UMS_templates/register.html')
		else:
			flash(
				f'This is impossible!!!')
			return render_template('UMS_templates/register.html')

	return render_template('UMS_templates/register.html')
