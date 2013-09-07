_module_ 'App.Main', ->
  class @ToolKind extends Base.Actor
    id: undefined
    name: undefined

    constructor: (@id, @name) ->
