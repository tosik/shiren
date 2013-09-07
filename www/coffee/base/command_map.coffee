_module_ 'Base', ->
  class @CommandMap
    constructor: (@mainInjector) ->
      @injector = new dijon.System()
      @commandSignals = []

    when: (signal) ->
      commandSignal = new Base.CommandSignal(signal, @injector, @mainInjector)
      @register(commandSignal)
      commandSignal

    register: (commandSignal) ->
      @commandSignals.push commandSignal

    removeAll: ->
      @commandSignals = []
