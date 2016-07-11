require! {
  \./QueryBuilder : QueryBuilder
}

class Model

  (@name, @config) ->

  fetch: ->
    new QueryBuilder @

module.exports = Model
