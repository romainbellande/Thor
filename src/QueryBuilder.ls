require! {
  bluebird : Promise
  \./adapters/Adapter
}

class QueryBuilder

  (@model) ->

  then: (cb) ->
    @model.adapter.query @
      .then cb
      
module.exports = QueryBuilder
