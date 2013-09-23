_module_ 'App.Main', ->
  class @Tools extends Base.Actor
    list: []

    push: (value) ->
      @list.push value

    filter: ->
      tool for tool in @list when tool.isMatched(@getFilterForm())

    getFilterForm: ->
      @context.injector.getObject("filterForm")
