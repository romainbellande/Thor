require! {
  \./adapters/Adapter
  \./Model
}

class Thor

  adapter: {}
  config:
    db:
      type: \Ram

  config: (@config) ->
    @adapter = Adapter.create @config

  Model: (name, config) ->
    config = config || @config

    if config !== @config
      adapter = Adapter.create @config

    new Model name, adapter || @adapter

module.exports = new Thor
