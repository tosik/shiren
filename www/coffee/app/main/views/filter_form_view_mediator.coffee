_module_ 'App.Main', ->
  class @FilterFormViewMediator extends Base.Mediator
    toolKinds: null

    onRegister: ->
      @view.toolKinds = @toolKinds
    