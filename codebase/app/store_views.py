from flask import render_template, request, redirect, url_for, session, flash
from flask_login import current_user
from app import app
from app.models import *


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
    cart_items = session['cart']
    total = float()
    for item in cart_items:
        qty = cart_items[item][0]
        unit_price = cart_items[item][1]
        total += qty * unit_price

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

        # The cart will be a list of dictionaries, each dict representing a product with the selected features
        # How will I append to the list?
        # Pass the cart on to the checkout!!
        # session['cart'] = {
        # 	"pid1":["name","red","cotton","XL","5pcs","TOTAL"],

        # }
        # session['cart'] = {}
        # default_data.update({'item3': 3})
    
        if 'cart' in session: # Check if cart was instantiated
			# instantiate cart-session
            session['cart'][str(prod_id)] = [prod_name, featureColor, featureMaterial, featureSize, featureQuantity, prod_total]
			# flash(f'{prod_name} Added to Shopping Cart')
			# Without redirecting, session isn't updated!!!
            return redirect(url_for('prodView', product_id=prod_id))

        else:
            # append item to cart-session
            session['cart'] = {str(prod_id) : [prod_name, featureColor, featureMaterial, featureSize, featureQuantity, prod_total]}
            # flash(f'{prod_name} Added to Shopping Cart')
            return redirect(url_for('prodView', product_id=prod_id))

        # if 'cart' in session:
        #     session['cart'].update({str(prod_id): [
        #                            prod_name, featureColor, featureMaterial, featureSize, featureQuantity, prod_total]})
        #     # Without redirecting, session isn't updated!!!
        #     return redirect(url_for('prodView', product_id=prod_id))

        # else:
        #     session['cart'] = {str(prod_id): [
        #         prod_name, featureColor, featureMaterial, featureSize, featureQuantity, prod_total]}

        #     # print(f'Posted {featureColor} {featureSize} {featureMaterial} {featureQuantity}')
        #     print(f'Cart {session["cart"].keys()}')
        #     print(f'Cart {session["cart"]}')
        #     # return redirect(url_for('index'))

        #    # Without redirecting, session isn't updated!!!
        #     return redirect(url_for('prodView', product_id=prod_id))



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
        user_id = current_user.get_id()
        user_dict = customers.query.filter_by(id=user_id).first()
        items = session['cart']
        print(items)
        # total = compute_cart_total()
        return render_template('store_templates/checkout.html', items=items, user_dict=user_dict, total=0)
    else:
        flash('You have Not added any Items to your Shopping Cart')
        return redirect(url_for('index'))


@app.route('/drop/')
def drop():
    if 'cart' in session:
        session.pop('cart')
        flash('You have Emptied Your Shopping Cart!!')
        return redirect(url_for('index'))
    else:
        flash('You Do Not Have any Items in your Shopping Cart')
        return redirect(url_for('index'))
