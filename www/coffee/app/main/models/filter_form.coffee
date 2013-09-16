_module_ 'App.Main', ->
  class @FilterForm extends Base.Actor
    changed: new Base.Signal

    purchasePrice: null
    sellingPrice: null
    kind: null
    temporaryName: null
    beforeDistinguishName: null
