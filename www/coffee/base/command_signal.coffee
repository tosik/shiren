_module_ 'Base', ->
  class @CommandSignal
    constructor: (@signal, @injector, @mainInjector) ->

    then: (commandClass) ->
      @signal.add =>
        instance = new commandClass()
        @injector.injectInto(commandClass)
        @mainInjector.injectInto(instance)
        instance.execute?()

