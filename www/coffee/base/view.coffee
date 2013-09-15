_module_ 'Base', ->
  class @View
    root: undefined
    parent: undefined
    mediatorInjector: undefined
    $: (query) ->
      @root.find(query)

    append: (view) ->
      view.mediatorInjector = @mediatorInjector
      @mediatorInjector.addView(view)
      view.parent = this
      view.create?()

    remove: (view) ->
      @mediatorInjector.removeView(view)
      view.delete?()
