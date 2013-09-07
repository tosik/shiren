_module_ 'Base', ->
  class @CommandSignal
    constructor: (@signal, @injector) ->

    then: (commandClass) ->
      @signal.add =>
        if @injector.hasMapping(commandClass)
          @injector.instantiate(commandClass).execute?()
        else
          new commandClass().execute?()

