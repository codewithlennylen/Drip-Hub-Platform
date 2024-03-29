from flask import render_template, request, redirect, url_for, session, flash
from flask_login import current_user,login_required
from app import app
from app.models import *
import time


main_cards = ['mfashion', 'ffashion', 'kfashion', 'narrivals']


def get_ratings(productid):
    # get all ratings for a certain product
    ratings = rating.query.filter_by(product_id=productid).all()

    # This part of the function returns the average rating (out of 5)
    rNum = 0
    counter = 0
    reviewNum = []
    for i in ratings:
        rNum += int(i.r)
        counter += 1

    rats = (rNum//counter)  # get integer rating out of 5 Stars

    return rats, counter


def get_reviews(productid):
    # get all ratings for a certain product
    reviews = rating.query.filter_by(product_id=productid).all()

    reviews_list = []
    for rObject in reviews:
        r = rObject.r
        review = rObject.review
        time = str(rObject.timeStamp).split(' ')[0]
        reviews_list.append((r, review, time))

    return reviews_list


def compute_cart_total():
    """Take the items in the cart and compute the total.

    Returns:
        float: total cash to be paid for checkout.
    """

    # {'129': ['Cool Belts', 'red', 'Silk', 'XL', '1', 1948]}
    cart_items = session['cart']
    total = float()
    for item in cart_items:
        for _, v in item.items():
            cash = v[-1]
            total += cash
        # Quantity-total is auto-calculated during cart entry
        # qty = cart_items[item][0]
        # unit_price = cart_items[item][1]
        # total += qty * unit_price

    return total


@app.route('/')
@app.route('/index/')
def index():
    # Get all categories in the database categories table.
    # * main_cards aren't part of this query
    # Get the categories in alphabetical order
    c = category.query.order_by("categoryName").all()
    if 'cart' in session:
        return render_template('store_templates/homepage.html', c=c, cart=session['cart'])
    else:
        return render_template('store_templates/homepage.html', c=c)


@app.route('/gen/<string:category_name>/')
def general(category_name):
    # Pass a dictionary object to genproducts template:{<product>:(rating),..}
    proDict = {}
    # Get the categories in alphabetical order
    c = category.query.order_by("categoryName").all()
    toggle = 0
    if category_name in main_cards:  # FILTER :> Different filter for the main_cards
        if category_name == 'mfashion':
            prods = products.query.filter_by(
                availableGender='male' or 'unisex').all()
            toggle = 1
            for i in prods:
                proDict[i] = get_ratings(productid=i.id)
                # ratin = get_ratings(productid = i.id)

        elif category_name == 'ffashion':
            prods = products.query.filter_by(
                availableGender='female' or 'unisex').all()
            toggle = 1
            for i in prods:
                proDict[i] = get_ratings(productid=i.id)

        elif category_name == 'kfashion':
            prods = products.query.filter_by(adultOrNot=0).all()
            toggle = 1
            for i in prods:
                proDict[i] = get_ratings(productid=i.id)

        else:
            prods = products.query.order_by('timeStamp').all()
            toggle = 1
            for i in prods:
                proDict[i] = get_ratings(productid=i.id)

    else:							# FILTER :> Get all products(+ details) in category x
        cat = category.query.filter_by(categoryName=category_name).first()
        prods = products.query.filter_by(categoryid=cat.id).all()
        toggle = 0

        for i in prods:
            proDict[i] = get_ratings(productid=i.id)

    return render_template('store_templates/genproducts.html', proDict=proDict, c=c, toggle=toggle)
    # return render_template('genproducts.html', prods=prods, ratin = ratin)

# REMEMBER TO PREVENT DATA EXFILTRATION VIA ENUMERATION!
# ADD UNIQUE PID FIELD IN DB :> YOUTUBE VIDEO IDs >>> PRODUCT IDs


# A product's ID is its unique identifier!
@app.route('/provw/<int:product_id>/', methods=['GET', 'POST'])
def prodView(product_id):
    """After a product is clicked on, this route displays more info
    about the product; reviews, attributes, etc
    Also, adding items to cart is also handled here.

    Args:
        product_id (int): product_id is unique for all products.
    """

    # Add item to Cart via POST Request
    #! user must be logged in? > I am currently enforcing login on checkout, which seems enough?
    #? Should I clear the cart on logout?
    if request.method == 'POST':
        features = request.form
        featureColor = features['featureColor']
        featureSize = features['featureSize']
        featureMaterial = features['featureMaterial']
        featureQuantity = features['featureQuantity']
        # featureColor = features.get('featureColor','color?') # .get('dict_key', default_value)

        prod = products.query.filter_by(id=product_id).first()
        prod_id = prod.id
        prod_name = prod.productName
        prod_price = prod.productPrice
        prod_total = prod_price * int(featureQuantity)

        # CART 1.0 now CART 2.0
        # The cart will be a list of dictionaries, each dict representing a product with the selected features. * > What I'm currently implementing
        # 
        # session['cart'] = [] # Create an empty list and append to it the dictionaries of products
        # session['cart'] = [
        #                       {'129': ['Cool Belts', 'red', 'Silk', 'XL', '1', 1948]},
        #                       {'119': ['Cool Belts', 'red', 'Silk', 'XL', '1', 2048]},
        #                       {'109': ['Cool Belts', 'red', 'Silk', 'XL', '1', 2148]}
        #                   ]

        # I DITCHED THE IDEA OF USING DICTIONARIES IN THE FOLLOWING WAY
        # session['cart'] = {
        # 	"pid1":["name","red","cotton","XL","5pcs","TOTAL"],

        # }
        # session['cart'] = {}
        # default_data.update({'item3': 3})
    
        if 'cart' in session: # Check if cart was instantiated
			# append item to cart-session
            session['cart'].append({str(prod_id) : [prod_name, featureColor, featureMaterial, featureSize, featureQuantity, prod_total]})
            
            # Compute the totals for the products in cart.
            total = compute_cart_total()
            session['total'] = total
            
            flash(f'{prod_name} : Successfully Added to Shopping Cart')
			# Without redirecting, session isn't updated!!!
            # *Redirecting to the same page doesn't update the NavBar Session Cart :> maybe Session
            # aint pased on to the main/layout.html template?
            # return redirect(url_for('prodView', product_id=prod_id))
            # How about redirecting to homepage? -> Worked out for me and fixed the issue above (*)
            return redirect(url_for('index'))

        else:
            # instantiate cart-session
            # Create empty List > To store Cart Items (Dicts)
            session['cart'] = []
            session['cart'].append({str(prod_id) : [prod_name, featureColor, featureMaterial, featureSize, featureQuantity, prod_total]})

            # Compute the totals for the products in cart.
            total = compute_cart_total()
            session['total'] = total

            flash(f'{prod_name} : Successfully Added to Shopping Cart')
            # return redirect(url_for('prodView', product_id=prod_id))
            return redirect(url_for('index'))


    # GET REQUEST > DISPLAY THE PRODUCT AND ITS ATTRIBUTES.
    # Could it be that the cart isn't updated coz i dont pass the cart to the
    # template at this instance?


    # Get the product with the matching ID
    prod = products.query.filter_by(id=product_id).first()
    brands = brand.query.filter_by(id=prod.brandid).first()
    materials = material.query.filter_by(id=prod.materialid).first()
    categorys = category.query.filter_by(id=prod.categoryid).first()

    proDict = {}
    proDict[prod] = [list(get_ratings(productid=product_id)),
                     brands.brandName,
                     materials.materialName,
                     categorys.categoryName,
                     prod.id
                     ]

    reviews = get_reviews(product_id)

    return render_template('store_templates/productview2.html', proDict=proDict, reviews=reviews)


@app.route('/checkout/', methods=['GET', 'POST'])
@login_required
def checkout():
    if 'cart' in session:
        #* Poor(armature) way of getting the object
        user_id = current_user.get_id() # from the log_in() session
        user_dict = customers.query.filter_by(id=user_id).first()
        # A better way would be:
        # user_obj = current_user # Easy, right?

        # The problem ain't here! 
        # Manually adding items to the cart works. And the items are displayed
        # in the checkout.html template. 
        # Why aren't the items auto-added????
        # LET IT BE KNOWN THAT I FIXED THE CART ISSUE.
        # EDIT: It's 5 months later and I have no idea how I fixed the issue
        items = session['cart']
        # print(items)
        total = compute_cart_total()
        session['total'] = total
        tillNumber = 12345
        
        if request.method == 'POST':
            # Get the address from the Form <Temporary use>
            # i.e. Do not update primary address unless user manually does so.
            # From their profile.
            billingAddressDetails = request.form
            billingAddress = billingAddressDetails['billingAddress']
            billingCity = billingAddressDetails['billingCity']
            billingRegion = billingAddressDetails['billingRegion']
            billingAdditionalInfo = billingAddressDetails['billingAdditionalInfo']

            # Check if Billing Address is different from Primary / Home Address
            homeAddress = current_user.address
            homeCity = current_user.city
            homeRegion = current_user.region
            homeAdditionalInfo = current_user.additionalInfo

            # Compute shipping price based on location? -> To be figured out later
            shipping = 0

            if billingAddress != homeAddress or billingCity != homeCity or billingRegion != homeRegion or billingAdditionalInfo != homeAdditionalInfo:
                # Inform the user of the temporary billing address use.
                # Use the Billing Address to complete the order as it is the most recent (up to date)
                flash("This Billing Address Will be used for this Order only.")
                flash("If you want to save it for future use, consider updating your primary address in the my-profile page.")
                
                shipping = 500

                return render_template('store_templates/payment.html',
                 items=items,
                 user_dict=user_dict,
                 total=total,
                 address = billingAddress,
                 city=billingCity,
                 region=billingRegion,
                 additionalInfo=billingAdditionalInfo,
                 shipping=shipping,
                 tillNumber=tillNumber)
            else:
                # print("match")
                # Otherwise, use the current primary address.
                shipping = 650

                return render_template('store_templates/payment.html',
                 items=items,
                 user_dict=user_dict,
                 total=total,
                 address = homeAddress,
                 city=homeCity,
                 region=homeRegion,
                 additionalInfo=homeAdditionalInfo,
                 shipping=shipping,
                 tillNumber=tillNumber)



        return render_template('store_templates/checkout.html', items=items, user_dict=user_dict, total=total)
    else:
        flash('You have Not added any Items to your Shopping Cart')
        return redirect(url_for('index'))


@app.route('/place_order/', methods=['POST'])
@login_required # Require login so that customer Id can be used in placing order.
def place_order():
    #! M-pesa stuff should be implemented here.
    transactionForm = request.form
    transportOptionStore = 1 if transactionForm.get('deliveryStore')=="on" else 0
    transportOptionCustom = 1 if transactionForm.get('otherTransportOption')=="on" else 0
    transactionCode = transactionForm.get('inputTransaction')

    print(f"T1:{transportOptionStore} T2:{transportOptionCustom} TC:{transactionCode}")

    #* Server-Side Input Validation
    # Check for blank fields 
    error = ''
    if transportOptionCustom == None and transportOptionStore == None:
       error = "Please Select your Preferred Transport Option."

    if transactionCode == '':
        error = "Please Enter the Transaction Code."

    if error:
        flash(error)
        return redirect(url_for("checkout"))

    cartItems = session['cart']

    #! Simulate Successful Transaction
    #? Add transaction to db
    success = "ABC123"
    if transactionCode == success:
        #! Add order to DB
        # print(cartItems)
        newOrder = orders(
            customer_id = current_user.id
        )
        db.session.add(newOrder)
        

        # Iterate through the cart.
        for product in cartItems:
            for key,value in product.items():
                productID = int(key)
                productObject = products.query.filter_by(id=productID).first()
                orderDetails = orderdetails(
                    order_id = newOrder.id,
                    product_id = productID,
                    productName = value[0],
                    price = productObject.productPrice,
                    material = value[2],
                    quantity = value[4],
                    discount = 0,
                    total = value[5],
                    size = value[3],
                    color = value[1],
                    fulfilledDate = "N/A"
                )
                db.session.add(orderDetails)
                time.sleep(0.4)

        db.session.commit()
        
        flash("Order has been placed Successfully. Thank you for Shopping with us.")
        # Empty Cart
        drop()
        #? Better yet, redirect to order history page. 
        return redirect(url_for('index'))
    else:
        # Fail does not necessarily mean that the payment failed.
        # It could be that Mpesa is still processing the transaction.
        #? Thus details of failure are important
        flash("Mpesa is still processing the transaction. Please Try again in a minute.")
        return redirect(url_for('checkout'))

    # Code unreachable.
    # return redirect(url_for('index'))


@app.route('/drop/')
def drop():
    """Empties the cart by dropping the session['cart]

    Returns:
        [Redirect]: [Go back to the homepage.]
    """
    
    #? Should I clear the cart on logout?
    if 'cart' in session:
        session.pop('cart')
        session.pop('total')
        # I am also emptying the cart after order is successfully placed.
        # With this in mind, it doesn't look good to display the warning message anymore
        # This is of course a trade-off as I never display the warning even when reasonably necessary to do so.
        #// flash('You have Emptied Your Shopping Cart!!')
        return redirect(url_for('index'))
    else:
        flash('You Do Not Have any Items in your Shopping Cart')
        return redirect(url_for('index'))
