_module_ 'App.Main', ->
  class @MainContext extends Base.Context
    startup: ->
      @injector.mapValue("message", "tosik")
      @injector.mapOutlet("message")

      @commandMap.when(@startupDone)
        .then(App.Main.SayHelloCommand)
        .and(App.Main.ShowMainViewCommand)

      @mediatorMap.map(App.Main.MainView, App.Main.MainViewMediator)


    shutdown: ->
