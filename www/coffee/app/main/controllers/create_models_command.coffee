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
      items = [
        {
          name: "識別の壺"
          basePurchasePrice: 1000
          baseSellingPrice: 500
          intervalPurchasePrice: 100
          intervalSellingPrice: 50
          description: "入れたアイテムは識別される。"
          kind: "pod"
          minLevel: 0
          maxLevel: 5
        }
        {
          name: "保存の壺"
          basePurchasePrice: 1600
          baseSellingPrice: 600
          intervalPurchasePrice: 160
          intervalSellingPrice: 60
          description: "アイテムを出し入れできる。"
          kind: "pod"
          minLevel: 0
          maxLevel: 5
        }
      ]

      for item in items
        tool = new App.Main.Tool
        for key, value of item
          tool[key] = value
        @tools.push tool
