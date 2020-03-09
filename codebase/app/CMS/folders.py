from app import app
from app.models import *
from os import path
import os

print('Done')

baseDir = 'CMSTemp'

categories = category.query.order_by('categoryName').all()
cc = []
for cat in categories:
	print(cat.categoryName)
	cc.append(cat.categoryName)

cc.sort()
print(cc)
print(len(cc))



for dire in os.listdir(baseDir+'/new'):
	print(dire)
	print('##############################')
	for c in cc:
		print(c)
		print('+++')
		os.mkdir(baseDir+'/new/'+dire+'/'+str(c))
		print('---')