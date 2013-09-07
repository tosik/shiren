_module_ 'App.Main', ->
  class @ShowMainViewCommand
    context: undefined

    execute: ->
      console.log('show main view')

      view = new App.Main.MainView()
      view.root = @context.view.root
      @context.view.append(view)
