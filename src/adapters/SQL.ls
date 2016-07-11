require! {
  knex
  \./Adapter
  \prelude-ls : {each, obj-to-pairs, is-type, keys}
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

  where: (query, params) ->
    params
      |> obj-to-pairs
      |> each ->
        if is-type \Array it.1
          query := query.whereIn ...it
        else if is-type \Object it.1
          it.1
            |> keys
            |> each (...) ->
              | \$gt => query.where it.0, \>, it.1.$gt
        else
          query := query.where ...it

    query


<[ select limit ]>
  |> each (name) ->
    SQL::[name] = (query, params) ->
      query[name] params

module.exports = SQL
