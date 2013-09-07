_module_ 'Base', ->
  class @ContextView
    constructor: (@mediatorInjector) ->

    regsiterRootView: (contextName) ->
      $("#view").append("<div id=\"#{contextName}\" />")
      @root = $("##{contextName}")

    append: (view) ->
      @mediatorInjector.addView(view)
      view.create?(@root)

    remove: (view) ->
      @mediatorInjector.removeView(view)
