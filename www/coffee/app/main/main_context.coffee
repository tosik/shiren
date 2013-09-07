_module_ 'App.Main', ->
  class @MainContext extends Base.Context
    startup: ->
      @view.regsiterRootView("main-context")

      @injector.mapValue("message", "tosik")
      @injector.mapOutlet("message")

      @commandMap.when(@startupDone)
        .then(App.Main.SayHelloCommand)
        .and(App.Main.CreateModelsCommand)
        .and(App.Main.ShowMainViewCommand)

      @mediatorMap.map(App.Main.MainView, App.Main.MainViewMediator)
      @mediatorMap.map(App.Main.FilterFormView, App.Main.FilterFormViewMediator)
      @mediatorMap.map(App.Main.CandidateListView, App.Main.CandidateListViewMediator)

      @injector.mapSingleton("toolKinds", App.Main.ToolKinds)
      @injector.mapOutlet("toolKinds")
      @injector.mapSingleton("tools", App.Main.Tools)
      @injector.mapOutlet("tools")

    shutdown: ->
