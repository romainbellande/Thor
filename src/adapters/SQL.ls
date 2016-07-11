require! {
  knex
  \./Adapter
}

class SQL extends Adapter

  (config) ->
    @config = {}

    @config.client = config.type

    @config.connection = config

    @driver = knex @config

  query: (builder) ->
    @driver builder.model.name
      .select \*

module.exports = SQL
