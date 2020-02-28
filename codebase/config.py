import os

basedir = os.path.abspath(os.path.dirname(__file__))


class Config(object):
	SECRET_KEY = os.environ.get('SECRET_KEY') or 'you-will-nevr-guess'

	#---
	# SQLALCHEMY_DATABASE_URI = os.environ.get('DATABASE_URL') or \
	# 	'sqlite:///'+ os.path.join(basedir,'dripBase.db')

	SQLALCHEMY_DATABASE_URI = 'mysql://root:''@localhost/dripbase'
	# MYSQL_USER = 'epiz_25263875'
	# MYSQL_PASSWORD = 'importmysql254'
	# MYSQL_HOST = 'sql110.epizy.com'
	# MYSQL_DB = 'epiz_25263875_dripbase'
	# MYSQL_CURSORCLASS = 'DictCursor'

	SQLALCHEMY_TRACK_MODIFICATIONS = False