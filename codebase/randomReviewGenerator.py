import random
from app.models import rating, products
from app import db
import time

runs = 1025
productIDs = 206
rats = 6
reviews = ['Good Product', 'Bad Product','Loved it','Hated it','Reliable seller']


for i in range(runs):
	print('-------------------------------------------')

	randomPID = random.randrange(1,productIDs)
	randomR = random.randrange(1,rats)
	randomREVIEW = random.choice(reviews)

	ra = rating(product_id=randomPID, r=randomR, review=randomREVIEW)

	db.session.add(ra)
	db.session.commit()

	print(randomPID)
	print(randomR)
	print(randomREVIEW)
	print('\t Added Review #. '+str(i+1)+' Successfully')
	time.sleep(0.2)

# prods = products.query.filter_by(categoryid = 18).all()

# def get_ratings(productid):
# 	# get all ratings for a certain product
# 	ratings = rating.query.filter_by(product_id=productid).all()
	
# 	# This part of the function returns the average rating (out of 5)
# 	rNum = 0
# 	counter = 0
# 	reviewNum = []
# 	for i in ratings:
# 		rNum += int(i.r)
# 		counter += 1

# 	return (rNum//counter) # get integer rating out of 5 Stars 


# for i in prods:
# 	print (get_ratings(productid=i.id))
# 	print('# '+str(i)+' # ProductID : '+str(i.id))

# ratingss = rating.query.filter_by(product_id=1).all()

# for i in ratingss:
# 	print(i.r)

