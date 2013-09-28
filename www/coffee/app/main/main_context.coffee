_module_ 'App.Main', ->
  class @MainContext extends Base.Context
    startup: ->
      @view.registerRootView("main-context")

      @mapValue("message", "tosik")

      @commandMap.when(@startupDone)
        .then(App.Main.SayHelloCommand)
        .and(App.Main.CreateModelsCommand)
        .and(App.Main.ShowMainViewCommand)

      @mediatorMap.map(App.Main.MainView, App.Main.MainViewMediator)
      @mediatorMap.map(App.Main.FilterFormView, App.Main.FilterFormViewMediator)
      @mediatorMap.map(App.Main.CandidateListView, App.Main.CandidateListViewMediator)

      @mapSingleton("toolKinds", App.Main.ToolKinds)
      @mapSingleton("tools", App.Main.Tools)
      @mapSingleton("filterForm", App.Main.FilterForm)
      @mapSingleton("registeredFilterForms", Array)

    mapSingleton: (name, klass) ->
      @injector.mapSingleton(name, klass)
      @injector.mapOutlet(name)

    mapClass: (name, klass) ->
      @injector.mapClass(name, klass)
      @injector.mapOutlet(name)

    mapValue: (name, value) ->
      @injector.mapValue(name, value)
      @injector.mapOutlet(name)

    shutdown: ->
