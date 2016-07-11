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
  .where login: <[ toto tata ]>,  id: $gt: 4
  .limit 1
  .then console.log
  .catch console.error
