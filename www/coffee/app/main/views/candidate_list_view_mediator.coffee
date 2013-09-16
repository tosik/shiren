_module_ 'App.Main', ->
  class @CandidateListViewMediator extends Base.Mediator
    tools: null
    filterForm: null

    onRegister: ->
      @filterForm.changed.add => @update()
      @update()

    update: ->
      @view.matchedTools = @tools.filter()
