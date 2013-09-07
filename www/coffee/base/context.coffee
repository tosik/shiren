_module_ 'Base', ->
  injector = new dijon.System

  class @Context
    startupDone: new Base.Signal
    shutdownDone: new Base.Signal
    injector: injector
    commandMap: new Base.CommandMap(injector)

    constructor: (@sharedSignals = null) ->
      @mediatorInjector = new Base.MediatorInjector(@injector)

      @startup?()
      @startupDone.dispatch()
