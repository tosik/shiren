_module_ 'App.Main', ->
  class @ToolKinds extends Base.Actor
    list: []

    push: (value) ->
      @list.push value
