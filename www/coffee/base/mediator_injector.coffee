_module_ 'Base', ->
  class @MediatorInjector
    mediators: {}

    constructor: (@mainInjector) ->
      @injector = new dijon.System()
      @injector.mapOutlet('view')

    registerView: (view) ->
      @injector.mapValue('view', view)

    addView: (view) ->
      @registerView(view)
      mediator = @injector.instantiate(view.constructor)
      @injector.injectInto(mediator)
      @mainInjector.injectInto(mediator)
      mediator.onRegister?()
      @mediators[view] = mediator

    removeView: (view) ->
      mediator = @mediators[view]
      @mediators[view] = null
      mediator.onRemove?()

    map: (viewClass, mediatorClass) ->
      @injector.mapClass(viewClass, mediatorClass)
