_module_ 'Base', ->
  class @ContextView extends Base.View
    constructor: (@mediatorInjector) ->

    registerRootView: (contextName) ->
      $("#view").append("<div id=\"#{contextName}\" />")
      @root = $("##{contextName}")

    create: ->
