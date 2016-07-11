class Adapter

  @create = (config) ->
    switch config.db.type
      | \mysql or \postgres => new (require \./SQL) config.db

  query: -> ...

module.exports = Adapter
