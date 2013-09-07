_module_ 'App.Main', ->
  class @CreateModelsCommand
    toolKinds: null

    execute: ->
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
