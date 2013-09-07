_module_ 'Base', ->
  injector = new dijon.System
  mediatorInjector = new Base.MediatorInjector(injector)

  class @Context
    startupDone: new Base.Signal
    shutdownDone: new Base.Signal
    injector: injector
    commandMap: new Base.CommandMap(injector)
    mediatorMap: mediatorInjector
    view: new Base.ContextView(mediatorInjector)

    constructor: (@sharedSignals = null) ->
      @injector.mapValue('context', this)
      @injector.mapOutlet('context')

      @startup?()
      @startupDone.dispatch()
