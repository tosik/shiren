_module_ 'App.Main', ->
  class @Tools extends Base.Actor
    list: null

    constructor: ->
      @list = []

    push: (value) ->
      @list.push value

    concat: (list) ->
      @list = @list.concat list

    unique: ->
      @list = @list.unique()

    filter: ->
      tool for tool in @list when tool.isMatched(@getFilterForm())

    getFilterForm: ->
      @context.injector.getObject("filterForm")

    find: (id) ->
      found = @list.filter((x) -> x.id == id)
      if found.length > 0
        found[0]
      else
        null

    registered: ->
      @list.filter (x) -> x.registered