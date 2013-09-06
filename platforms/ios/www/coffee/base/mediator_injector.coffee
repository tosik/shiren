_module_ 'Base', ->
  class @MediatorInjector
    mediators: {}

    constructor: ->
      @injector = new dijon.System()
      @injector.mapOutlet('view')

    registerView: (view) ->
      @injector.mapValue('view', view)

    addView: (view) ->
      @registerView(view)
      mediator = new(eval @getMediatorName(view))
      @injector.injectInto(mediator)
      mediator.onRegister?()
      @mediators[view] = mediator

    removeView: (view) ->
      mediator = @mediators[view]
      @mediators[view] = null
      mediator.onRemove?()

    getMediatorName: (view) ->
      view.constructor.name + "Mediator"
