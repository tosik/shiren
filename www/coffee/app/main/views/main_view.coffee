_module_ 'App.Main', ->
  class @MainView extends Base.View
    create: ->
      (=>
        view = new App.Main.FilterFormView
        view.root = @root
        @append(view)
      ).call()

      (=>
        view = new App.Main.CandidateListView
        view.root = @root
        @append(view)
      ).call()
