require! {
  \. : Thor
}

Thor.config do
  db:
    # type: 'mysql'
    type     : 'mongodb'
    host     : 'mongodb://127.0.0.1:27017'
    user     : 'root'
    password : 'root'
    database : 'test'

User = Thor.Model \user

User
  .fetch!
  .then!
  # .select [\id \login]
  # .where login: <[ toto tata ]>,  id: $gt: 4
  # .limit 1
  # .then console.log
  # .catch console.error

