require! {
  \. : Thor
}

User = new Thor.Model \user

User
  .fetch!
  .then console.log
  .catch console.error
