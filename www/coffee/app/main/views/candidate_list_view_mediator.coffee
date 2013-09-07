_module_ 'App.Main', ->
  class @CandidateListViewMediator extends Base.Mediator
    tools: null

    onRegister: ->
      @view.matchedTools = @tools.list
