class Adapter
  (config) ->
    @client = config.type
    @database = config.database
    @host = config.host
    @connection = config

  @create = (config) ->
    switch config.db.type
      | \mysql or \postgres => new (require \./SQL) config.db
      | \mongodb => new (require \./MongoDB) config.db

  query: -> ...

  select: -> ...

  where: -> ...

module.exports = Adapter
