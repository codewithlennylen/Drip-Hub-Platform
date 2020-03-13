import random
from app.models import rating, products
from app import db


# prods = products.query.filter_by(categoryid = 5).all()

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




for i in range(205):
	# i += 1

	print('--------- CATEGORY ID: ' +str(i+1)+'  ------------------')
	prods = products.query.filter_by(categoryid = int(i+1)).all()
	
	for j in prods:
		print('ProductID : '+str(j.id)+' Rating : '+str(get_ratings(productid=j.id)))

# ratingss = rating.query.filter_by(product_id=18).all()

# for i in ratingss:
# 	print(i.r)