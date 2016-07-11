require! {
  bluebird : Promise
}

class QueryBuilder

  (@model) ->

  then: (cb) -> cb 'lol' + @model.name; @
  catch: (cb) -> cb 'pas lol' + @model.name; @

module.exports = QueryBuilder
