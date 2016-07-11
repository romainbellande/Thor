require! {
  Thor: \..
}

User = Thor.Model \user

User
  .fetch!
  .then console.log
  .catch console.error
