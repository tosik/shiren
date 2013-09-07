_module_ 'Base', ->
  class @ContextView extends Base.View
    constructor: (@mediatorInjector) ->

    regsiterRootView: (contextName) ->
      $("#view").append("<div id=\"#{contextName}\" />")
      @root = $("##{contextName}")

    create: ->
