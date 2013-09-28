_module_ 'App.Main', ->
  class @CandidateListViewMediator extends Base.Mediator
    tools: null
    filterForm: null
    registeredFilterForms: null

    onRegister: ->
      @filterForm.changed.add => @update()
      @view.registerButtonClicked.add => @register()
      @update()

    update: ->
      @view.matchedTools = @tools.filter()
      @view.registeredFilterForms = @registeredFilterForms
      @view.update()

    register: ->
      filterForm = @filterForm.clone()
      @registeredFilterForms.push filterForm
      @filterForm.registeredTools = []

      for tool in @getCheckedTools()
        t = @tools.find(tool.id)
        if t
          t.register()
          filterForm.registeredTools.push t
      for tool in @getNotCheckedTools()
        @tools.find(tool.id)?.unregister()

    getCheckedTools: ->
      matched = @tools.filter()
      matched[index] for index in @view.getCheckedItemIndexes()

    getNotCheckedTools: ->
      matched = @tools.filter()
      matched[index] for index in @view.getNotCheckedItemIndexes()
