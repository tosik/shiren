_module_ 'App.Main', ->
  class @Tool extends Base.Actor
    id: undefined

    name: undefined
    description: undefined
    basePurchasePrice: undefined
    intervalPurchasePrice: undefined
    baseSellingPrice: undefined
    intervalSellingPrice : undefined
    kind: undefined
    minLevel: undefined
    maxLevel: undefined

    level: undefined
    temporaryName: undefined

    registered: false

    equals: (filterForm) ->
      matched = true

      if filterForm.purchasePrice
        matched &&= filterForm.purchasePrice == @getPurchasePrice()
      if filterForm.sellingPrice
        matched &&= filterForm.sellingPrice == @getSellingPrice()
      if filterForm.kind && filterForm.kind != 'none'
        matched &&= filterForm.kind == @kind

      matched

    isMatched: (filterForm) ->
      true in (item.equals(filterForm) for item in @getExpanded())

    getPurchasePriceList: ->
      base = @basePurchasePrice
      interval = @intervalPurchasePrice
      @getPriceList(base, interval)

    getSellingPriceList: ->
      base = @baseSellingPrice
      interval = @intervalSellingPrice
      @getPriceList(base, interval)

    getPriceList: (base, interval) ->
      base + interval * i for i in @getLevelWidth()

    getLevelWidth: ->
      [@minLevel..@maxLevel]


    getPurchasePrice: ->
      @getPurchasePriceList()[@level]

    getSellingPrice: ->
      @getSellingPriceList()[@level]


    getExpanded: ->
      for level in @getLevelWidth()
        tool = new App.Main.Tool
        tool.id = @id
        tool.level = level
        tool.basePurchasePrice = @basePurchasePrice
        tool.baseSellingPrice = @baseSellingPrice
        tool.intervalPurchasePrice = @intervalPurchasePrice
        tool.intervalSellingPrice = @intervalSellingPrice
        tool.kind = @kind
        tool.name = @name
        tool.description = @description
        tool.minLevel = @minLevel
        tool.maxLevel = @maxLevel
        tool

    register: ->
      @registered = true
