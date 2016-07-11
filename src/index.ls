class Thor

  config:
    db:
      type: \Ram

  config: (@config) ->
    # Add corresponding adapter

  Model: require \./Model

module.exports = new Thor
