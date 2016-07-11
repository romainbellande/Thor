require! {
  knex
  \./Adapter
  \prelude-ls : {each}
}

class SQL extends Adapter

  (config) ->
    @config = {}

    @config.client = config.type

    @config.connection = config

    @driver = knex @config

  query: (builder) ->

    query = @driver builder.model.name

    builder.queries |> each ~>
      query := @[it.method] query, it.params

    query

<[ select where ]>
  |> each (name) ->
    SQL::[name] = (query, params) ->
      query.select params

module.exports = SQL
