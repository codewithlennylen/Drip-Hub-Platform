from flask import render_template, redirect, flash, url_for, request
from flask_login import login_user, current_user, logout_user, login_required
from app import app, db, bcrypt, mail
from app.models import customers
from flask_mail import Message



def pword_hash(pwd):
	pwd_hash = bcrypt.generate_password_hash(str(pwd)).decode('utf-8')
	
	return pwd_hash


def update_delivery(uid, addr, cty, rgn, add):
	user = customers.query.filter_by(id=int(uid)).first()
	
	user.address = addr
	user.city = cty
	user.region = rgn
	user.additionalInfo = add

	try:
		db.session.commit()
		return 'Success'
	except Exception as e:
		print(e)
		return 'Failed : Exception'

def update_user(user_id, f_name, l_name, p_number, p_number2, e_address):
	# First check whether there is a similar e-mail in the Database
	email_exists = customers.query.filter_by(email = e_address).first()
	user = customers.query.filter_by(id=int(user_id)).first()
	if email_exists and email_exists.email != user.email:
		return 'Email Exists'

	user.fname = f_name
	user.lname = l_name
	user.phone1 = p_number
	user.phone2 = p_number2
	user.email = e_address

	try:
		db.session.commit()
		return 'Success'
	except Exception as e:
		print(e)
		return 'Failed : Exception'


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
	if current_user.is_authenticated:
		return redirect(url_for('index'))

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
			next_page = request.args.get('next')
			return redirect(next_page) if next_page else redirect(url_for('index'))
		# else:
		# 	flash('Login Failed. Ple')

	return render_template('UMS_templates/login.html')

@app.route('/register/', methods=['GET','POST'])
def register():
	if current_user.is_authenticated:
		return redirect(url_for('index'))

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
		
		pwd = req['inputPassword']
		confirmPwd = req['inputConfirmPassword']
		if pwd != confirmPwd:
			flash("The Passwords Do Not Match! Please Try Again.")
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


@app.route('/logout/')
def logout():
	logout_user()
	return redirect(url_for('index'))


@app.route('/account/')
@login_required
def account():
	user_id = current_user.get_id()
	user_dict = customers.query.filter_by(id=user_id).first()
	return render_template('UMS_templates/account.html', user_dict=user_dict)

	

@app.route('/account_update/<string:action>', methods=['GET', 'POST'])
@login_required
def account_update(action):
	''' This rather huge function handles the Data Processing of the Profile Page
		Updating the User's profile details
		Updating the User's delivery details
	'''
	user_id = current_user.get_id()
	user_dict = customers.query.filter_by(id=user_id).first()

	if request.method == 'POST':

		# Handle the Personal Information
		if action == 'personal':
			# Ask user to input password before continuing
			req = request.form

			# Server-side Data Validation
			missing = False
			# A list that stores the exceptions to empty fields; e.g. phone_number2
			nullable_list = ['inputPhone2']
			for k, v in req.items():
				if v == "" and k not in nullable_list:  # Checking for any Missing Fields
					missing = True

			if missing:
				flash("Please Fill in All the Required Fields")
				return render_template("UMS_templates/account.html", user_dict=user_dict)

			# Proceed to Register the User by adding them to the Database
			first_name = req['inputFname']
			last_name = req['inputLname']
			phone_number = req['inputPhone']
			if req['inputPhone2']:
				phone_number2 = req['inputPhone2']
			else:
				phone_number2 = None
			email_address = req['inputEmail']

			# Verify the Input - Password,names, email? >> Bootstrap Client-Side Validation ?

			# Pass the Fields to the update_user() Function
			status = update_user(user_id, first_name, last_name,
								phone_number, phone_number2, email_address)

			if status == 'Success':
				flash(f'Your Peronal Info has been Updated.')
				return redirect(url_for("account", user_dict=user_dict))
			elif status == 'Email Exists':
				flash(
					f'That E-mail Already Exists. Please Try a Different E-mail')
				return render_template('UMS_templates/account.html', user_dict=user_dict)
			elif status == 'Failed : Exception':
				flash(
					f'Error Occured at Exception')
				return render_template('UMS_templates/account.html', user_dict=user_dict)
			else:
				flash(
					f'This is impossible!!!')
				return render_template('UMS_templates/account.html', user_dict=user_dict)

		# Handle the Delivery Information
		elif action == 'delivery':
			# Ask user to input password before continuing
			req = request.form
			
			# Server-side Data Validation
			missing = False
			# A list that stores the exceptions to empty fields; e.g. phone_number2
			nullable_list = ['accAdditionalInfo']
			for k, v in req.items():
				if v == "" and k not in nullable_list:  # Checking for any Missing Fields
					missing = True

			if missing:
				flash("Please Fill in All the Required Fields")
				return render_template("UMS_templates/account.html", user_dict=user_dict)

			# Proceed to Update the User's Delivery Info by adding /  editing them to the Database
			addr = req['inputAddress']
			cty = req['inputCity']
			rgn = req['inputRegion']
			if req['accAdditionalInfo']:
				add = req['accAdditionalInfo']
			else:
				add = None

			# Verify the Input - Password,names, email? >> Bootstrap Client-Side Validation ?

			# Pass the Fields to the update_delivery() Function
			status = update_delivery(user_id, addr, cty, rgn, add)

			if status == 'Success':
				flash(f'Your Delivery Info has been Updated.')
				return redirect(url_for("account", user_dict=user_dict))
			elif status == 'Failed : Exception':
				flash(
					f'Error Occured at Exception')
				return render_template('UMS_templates/account.html', user_dict=user_dict)
			else:
				flash(
					f'This is impossible!!!')
				return render_template('UMS_templates/account.html', user_dict=user_dict)

		else:
			flash('Access Denied:> Invalid URL')
			redirect(url_for("account", user_dict=user_dict))


	# Elif the request is HTTP_GET : 
	return redirect(url_for("account", user_dict=user_dict))

def send_reset_email(user):
	token = user.get_reset_token()
	msg = Message('Password Reset Request', 
					sender='noreply@demo.com', 
					recipients=[user.email])

	msg.body = f'''To reset your password, visit the following link:
{url_for('reset_token', token=token, _external=True)}

If you did not make this request, then simply Ignore this email and no changes will be made
'''

	mail.send(msg)


@app.route("/reset_password/", methods=['GET','POST'])
def reset_request():
	if current_user.is_authenticated:
		return redirect(url_for('index'))

	if request.method == 'POST':
		req = request.form

		# Server-side Data Validation
		missing = False
		for _, v in req.items():
			if v == "": # Checking for any Missing Fields
				missing = True 

		if missing:
			flash("Please Fill in the Form Below")
			return render_template("UMS_templates/reset_request.html")
		
		# Proceed
		email = req['inputEmail']

		# Verify the Input - email? >> Bootstrap Client-Side Validation ?
		user = customers.query.filter_by(email=email).first()
		if user:
			send_reset_email(user)
			flash('An email has been sent with instructions to reset your password')
			return redirect(url_for('login'))
		else:
			flash('That email does not Exist. Please Create an Account Instead.')
			return render_template('UMS_templates/reset_request.html')

	return render_template('UMS_templates/reset_request.html')


@app.route("/reset_password/<token>", methods=['GET','POST'])
def reset_token(token):
	if current_user.is_authenticated:
		return redirect(url_for('index'))

	user = customers.verify_reset_token(token)
	if user is None:
		flash('That is an Invalid or Expired Token')
		return redirect(url_for('reset_request'))

	if request.method == 'POST':
		req = request.form

		# Server-side Data Validation
		missing = False
		for _, v in req.items():
			if v == "": # Checking for any Missing Fields
				missing = True 

		if missing:
			flash("Please Fill in the Form Below")
			return render_template("UMS_templates/reset_password.html")

		pwd = req['inputPassword']
		confirmPwd = req['inputConfirmPassword']
		if pwd != confirmPwd:
			flash("The Passwords Do Not Match! Please Try Again.")
			return render_template("UMS_templates/reset_password.html")
		
		# Otherwise Proceed
		pasword = pword_hash(req['inputPassword']) # Hash the Password First! 

		# Verify the Input - Password,names, email? >> Bootstrap Client-Side Validation ?

		user.pword = pasword
		db.session.commit()
		flash('Your Password has been updated! You are now able to Log In')
		return redirect(url_for('login'))

	return render_template('UMS_templates/reset_password.html')
