console.log Base.Mediator

class FooViewMediator extends Base.Mediator
  onRegister: ->
    console.log 'on register'
    @view.talk()

  onRemove: ->
    console.log 'on remove'

class FooView
  talk: -> console.log 'hello'

injector = new Base.MediatorInjector
foo = new FooView
injector.addView(foo)
injector.removeView(foo)
