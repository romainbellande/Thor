MongoClient = (require \mongodb).MongoClient
test = require \assert
# Connection url
url = \mongodb://localhost:27017/test
# Connect using MongoClient
MongoClient.connect url, (err, db) ->
  # Use the admin database for the operation
  adminDb = db.admin!
  adminDb.listDatabases (err, dbs) ->
    test.equal null, err
    test.ok(dbs.databases.length > 0)
    db.close!

require! {
  \. : Thor

}

Thor.config do
  db:
    type: 'mysql'
    host     : '127.0.0.1'
    user     : 'root'
    password : 'root'
    database : 'test'

User = Thor.Model \user

User
  .fetch!
  .select [\id \login]
  .then console.log
  .catch console.error
