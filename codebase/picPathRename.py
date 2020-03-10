from app import db
from app.models import *
from os import path
import os
import random

print('Done')

baseDir = 'CMSTemp'

# categories = category.query.filter_by(categoryName='categoryName').all()
categories = category.query.all()
cc = {0:"None"}
for index,cat in enumerate(categories):
	cc[index+1] = cat.categoryName


print(cc)

ccc = {0: 'None', 1: 'Belts', 2: 'Blazers', 3: 'Gloves', 4: 'Hats', 5: 'Jackets', 
		6:'Jeans', 7: 'Kanzu', 8: 'Sandals', 9: 'Scarfs', 10: 'Shirts', 11: 'Shoes',
		12: 'Shorts', 13: 'Socks', 14: 'Suits', 15: 'Sweaters', 16: 'Sweatpants', 
		17: 'T-Shirts', 18: 'Trousers', 19: 'Underwears', 20: 'Watches'}

runs = 5
genders = ['male', 'female','unisex']
colors = ['blue', 'red', 'green','pink', 'white', 'black','yellow',"'red', 'green'","'white', 'black'",
				"'green','pink'"]
sizes = ['S','X', 'XL','XXL',"'S','X'","'XL','XXL'","'X', 'XL'"]


for i in range(runs):
	print('++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++')

	rcat = int(random.randrange(1,21)) # Get a random category btwn 1 and 20
	rprice = int(random.randrange(50,7500))
	rbrand = int(random.randrange(1,4))
	rmaterial = int(random.randrange(1,4))
	rgender = str(random.choice(genders))
	rsize = str(random.choice(sizes))
	rcolor = str(random.choice(colors))
	rqty = int(random.randrange(1,50))
	radult = int(random.randrange(0,2))

	if rgender == 'unisex':
		ppath = 'male/'+str(cc[rcat])+'/'+str(cc[rcat])+'.jpg'
	elif rgender == 'male':
		ppath = 'male/'+str(cc[rcat])+'/'+str(cc[rcat])+'.jpg'
	else:
		ppath = 'female/'+str(cc[rcat])+'/'+str(cc[rcat])+'.jpg'

	p = products(productName='Cool '+str(cc[rcat]), productDescription='Coolest on the market',
		productPrice=rprice, categoryid=rcat, brandid=rbrand,materialid=rmaterial,sellerid=1,
		picturePath=str(ppath),availableSize=rsize,
		availableColor=rcolor, availableGender=rgender, availableQuantity=rqty,adultOrNot=radult)


	print(p.productName)
	print(p.productDescription)
	print(p.productPrice)
	print(p.categoryid)
	print(p.brandid)
	print(p.materialid)
	print(p.sellerid)
	print(p.picturePath)
	print(p.availableSize)
	print(p.availableColor)
	print(p.availableGender)
	print(p.availableQuantity)
	print(p.adultOrNot)
	# db.session.add(p)

# db.session.commit()
