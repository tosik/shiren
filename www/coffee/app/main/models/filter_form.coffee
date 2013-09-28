_module_ 'App.Main', ->
  class @FilterForm extends Base.Actor
    changed: new Base.Signal

    purchasePrice: null
    sellingPrice: null
    kind: null
    temporaryName: null

    registeredTools: null

    constructor: ->
      @registeredTools = []

    clone: ->
      form = new App.Main.FilterForm
      form.purchasePrice = @purchasePrice
      form.sellingPrice = @sellingPrice
      form.kind = @kind
      form.temporaryName = @temporaryName
      form
