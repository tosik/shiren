_module_ 'App.Main', ->
  class @MainContext extends Base.Context
    startup: ->
      @commandMap.when(@startupDone).then(App.Main.SayHelloCommand)

    shutdown: ->
