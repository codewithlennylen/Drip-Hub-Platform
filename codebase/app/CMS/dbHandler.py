import sqlalchemy as db


SQLALCHEMY_DATABASE_URI = 'mysql://root:''@localhost/dripbasetest'


engine = db.create_engine(SQLALCHEMY_DATABASE_URI)
connection = engine.connect()
metadata = db.MetaData()
brand = db.Table('brand', metadata, autoload=True, autoload_with=engine)


#Equivalent to 'SELECT * FROM brand'
query = db.select([brand])

ResultProxy = connection.execute(query)

ResultSet = ResultProxy.fetchall()

print(ResultSet[:2])


# p = brand.query.all()
# for pr in p:
# 	print(p.id)