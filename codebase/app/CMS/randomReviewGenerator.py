import random
from app.models import rating, products
from app import db
import time

runs = 1025
productIDs = 206
rats = 6
reviews = ['Good Product', 'Bad Product','Loved it','Hated it','Reliable seller']

startTime = time.time()

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


print ('\n\n ** Process took : '+str(time.time()-startTime)+' seconds == '+str((time.time()-startTime)/60)+' minutes')
