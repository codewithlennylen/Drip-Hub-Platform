import os
# import Image

for item in os.listdir(os.getcwd()):
	print (item)
	f = open(item,'rb')
	nme = item.split('.')
	nme = nme[0]
	f2 = open(nme+'.png','wb')
	f2.write(f.read())
	f2.close()
	f.close()