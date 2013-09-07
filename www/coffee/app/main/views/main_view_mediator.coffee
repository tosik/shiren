_module_ 'App.Main', ->
  class @MainViewMediator extends Base.Mediator
    onRegister: ->
      console.log @view
