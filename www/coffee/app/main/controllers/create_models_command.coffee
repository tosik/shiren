_module_ 'App.Main', ->
  class @CreateModelsCommand
    toolKinds: null
    tools: null

    execute: ->
      @createToolKinds()
      @createTools()

    createToolKinds: ->
      for value in [
        ["none", "-"],
        ["weapon", "武器"],
        ["shield", "盾"],
        ["ring", "腕輪"],
        ["pod", "壷"],
        ["roll", "巻物"],
        ["wand", "杖"],
        ["seed", "草・種"],
      ]
        [id, name] = value
        value = new App.Main.ToolKind(id, name)
        @toolKinds.push value

    createTools: ->
      tool = new App.Main.Tool
      tool.name = "識別の壺"
      tool.basePurchasePrice = 1000
      tool.baseSellingPrice = 500
      tool.intervalPurchasePrice = tool.basePurchasePrice / 10
      tool.intervalSellingPrice = tool.baseSellingPrice / 10
      tool.description = "入れたアイテムは識別される。"
      @tools.push tool
