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
      for tool in @getNotCheckedTools()
        @tools.find(tool.id)?.unregister()

    getCheckedTools: ->
      matched = @tools.filter()
      matched[index] for index in @view.getCheckedItemIndexes()

    getNotCheckedTools: ->
      matched = @tools.filter()
      matched[index] for index in @view.getNotCheckedItemIndexes()
