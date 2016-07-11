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
  .then console.log
  .catch console.error
