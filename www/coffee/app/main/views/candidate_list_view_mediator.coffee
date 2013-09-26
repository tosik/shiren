_module_ 'App.Main', ->
  class @CandidateListViewMediator extends Base.Mediator
    tools: null
    filterForm: null
    registeredTools: null

    onRegister: ->
      @filterForm.changed.add => @update()
      @view.registerButtonClicked.add => @register()
      @update()

    update: ->
      @view.matchedTools = @tools.filter()
      @view.update()

    register: ->
      @registeredTools.push tool for tool in @getCheckedTools()
      console.log @registeredTools.list

    getCheckedTools: ->
      matched = @tools.filter()
      matched[index] for index in @view.getCheckedItemIndexes()
