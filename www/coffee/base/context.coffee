_module_ 'Base', ->
  class @Context
    startupDone: new Base.Signal
    shutdownDone: new Base.Signal
    commandMap: new Base.CommandMap

    constructor: ->
      @mediatorInjector = new Base.MediatorInjector

      @startup?()
      @startupDone.dispatch()
