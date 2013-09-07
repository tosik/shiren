_module_ 'Base', ->
  class @CommandMap
    constructor: ->
      @injector = new dijon.System()
      @commandSignals = []

    when: (signal) ->
      commandSignal = new Base.CommandSignal(signal, @injector)
      @register(commandSignal)
      commandSignal

    register: (commandSignal) ->
      @commandSignals.push commandSignal

    removeAll: ->
      @commandSignals = []
