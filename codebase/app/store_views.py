from flask import render_template, request, redirect, url_for, session, flash
from flask_login import current_user
from app import app
from app.models import *


main_cards = ['mfashion', 'ffashion', 'kfashion', 'narrivals']


def get_ratings(pr0oductid):
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


@app.route('/checkout/')
def checkout():
    if 'cart' in session:
        user_id = current_user.get_id() # from the log_in() session
        user_dict = customers.query.filter_by(id=user_id).first()
        
        # The problem aint here! 
        # Manually adding items to the cart works. And the items are displayed
        # in the checkout.html template. 
        # Why aren't the items auto-added????
        # LET IT BE KNOWN THAT I FIXED THE CART ISSUE
        items = session['cart']
        # print(items)
        total = compute_cart_total()
        session['total'] = total
        return render_template('store_templates/checkout.html', items=items, user_dict=user_dict, total=total)
    else:
        flash('You have Not added any Items to your Shopping Cart')
        return redirect(url_for('index'))


@app.route('/drop/')
def drop():
    """Empties the cart by dropping the session['cart]

    Returns:
        [Redirect]: [Go back to the homepage.]
    """
    if 'cart' in session:
        session.pop('cart')
        flash('You have Emptied Your Shopping Cart!!')
        return redirect(url_for('index'))
    else:
        flash('You Do Not Have any Items in your Shopping Cart')
        return redirect(url_for('index'))
