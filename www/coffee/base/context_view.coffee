_module_ 'Base', ->
  class @ContextView
    constructor: (@mediatorInjector) ->

    append: (view) ->
      @mediatorInjector.addView(view)

    remove: (view) ->
      @mediatorInjector.removeView(view)
