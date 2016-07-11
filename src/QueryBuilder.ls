require! {
  bluebird : Promise
  \./adapters/Adapter
  \prelude-ls : {each}
}

class QueryBuilder

  queries: []

  (@model) ->

  then: (done) ->
    @model.adapter.query @
      .then done

_createMiddleware = (name) ->
  QueryBuilder::[name] = ->
    @queries.push do
      method: name
      params: it
    @

<[ select where limit ]>
  |> each _createMiddleware

module.exports = QueryBuilder
