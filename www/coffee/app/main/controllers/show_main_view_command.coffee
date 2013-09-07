_module_ 'App.Main', ->
  class @ShowMainViewCommand
    context: undefined

    execute: ->
      console.log('show main view')

      view = new App.Main.MainView()
      @context.view.append(view)