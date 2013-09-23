_module_ 'App.Main', ->
  class @Tool extends Base.Actor
    name: undefined
    description: undefined
    basePurchasePrice: undefined
    intervalPurchasePrice: undefined
    baseSellingPrice: undefined
    intervalSellingPrice : undefined
    kind: undefined

    level: undefined
    temporaryName: undefined

    isMatched: (filterForm) ->
      filterForm.purchasePrice in @getPurchasePriceList()

    getPurchasePriceList: () ->
      base = @basePurchasePrice
      interval = @intervalPurchasePrice
      base + interval * i for i in [0..5]
