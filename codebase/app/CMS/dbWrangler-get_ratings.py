import random
from app.models import rating, products
from app import db



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

	return (rNum//counter) # get integer rating out of 5 Stars 




for i in range(205): # For all products in products table
	i += 1 # Avoid the zero index

	print('--------------- PRODUCT ID: ' +str(i)+'  ------------------')
	prods = products.query.filter_by(id = i).first()
	

	print('ProductID : '+str(prods.id)+' Rating : '+str(get_ratings(productid=int(prods.id))))



''' 
	I had to manually insert random reviews to two products that had none!
	pID: 198,187
'''

# ra = rating(product_id=198, r=5, review='Good Product')

# db.session.add(ra)
# db.session.commit()