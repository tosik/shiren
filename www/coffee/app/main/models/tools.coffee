_module_ 'App.Main', ->
  class @Tools extends Base.Actor
    list: []

    push: (value) ->
      @list.push value

    filter: ->
      []

    getFilterForm: ->
      @context.injector.getObject("filterForm")
