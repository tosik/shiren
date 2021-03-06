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
      toolId = 0

      for item in App.Main.Tools_vo.items
        tool = new App.Main.Tool
        toolId += 1
        for key, value of item
          tool[key] = value
        tool.id = toolId
        @tools.push tool
