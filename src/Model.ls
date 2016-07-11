require! {
  \./QueryBuilder : QueryBuilder
}

class Model

  (@name, @adapter) ->


  fetch: ->
    new QueryBuilder @

module.exports = Model
