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
      tool = new App.Main.Tool
      @registeredTools.push tool
      console.log @tools.list
      console.log @registeredTools.list
