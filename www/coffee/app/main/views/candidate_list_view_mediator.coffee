_module_ 'App.Main', ->
  class @CandidateListViewMediator extends Base.Mediator
    tools: null
    filterForm: null

    onRegister: ->
      @filterForm.changed.add => @update()
      @view.registerButtonClicked.add => @register()
      @update()

    update: ->
      @view.matchedTools = @tools.filter()
      @view.update()

    register: ->
      for tool in @getCheckedTools()
        @tools.find(tool.id)?.register()

    getCheckedTools: ->
      matched = @tools.filter()
      matched[index] for index in @view.getCheckedItemIndexes()
