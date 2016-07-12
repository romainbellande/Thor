require! \mongoose
test = require \assert
'use strict'
Adapter = require \./Adapter
class MongoDB extends Adapter
  (config) ->
    super ...
    @connect!

  connect: ->
    url = @host + \/ + @database
    mongoose.connect url, (err, db) ~>
      if err?
        console.log "db #{@database}: connection error", err
      else
        console.log "db #{@database}: connection successfull"

  query: (builder) ->
    console.log \query
    mongoose.connection.on \open ->
      mongoose.connection.db.collection builder.model.name, (err, collection) ->
        collection.find!toArray (err2, doc) ->
          console.log err2 if err2?
          console.log doc

     # builder.queries |> each ~>
     #  query := @[it.method] query, it.params

  select: ->
    console.log \select



module.exports = MongoDB
