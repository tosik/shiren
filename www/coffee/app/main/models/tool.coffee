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
      matched = true

      if filterForm.purchasePrice
        matched &&= filterForm.purchasePrice in @getPurchasePriceList()
      if filterForm.sellingPrice
        matched &&= filterForm.sellingPrice in @getSellingPriceList()

      matched

    getPurchasePriceList: () ->
      base = @basePurchasePrice
      interval = @intervalPurchasePrice
      @getPriceList(base, interval)

    getSellingPriceList: () ->
      base = @baseSellingPrice
      interval = @intervalSellingPrice
      @getPriceList(base, interval)

    getPriceList: (base, interval) ->
      base + interval * i for i in [0..5]
