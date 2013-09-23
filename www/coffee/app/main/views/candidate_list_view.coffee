_module_ 'App.Main', ->
  class @CandidateListView extends Base.View
    matchedTools: []

    create: ->
      @update()

    getHtml: ->
      """
      <div class="candidate-list">
        <table>#{@getToolItems()}</table>
      </div>
      """

    getToolItems: ->
      (@getToolItem(tool) for tool in @matchedTools).join('')

    getToolItem: (tool) ->
      """
      <tr>
        <td><input type="checkbox" /></td>
        <td>#{tool.name}</td>
        <td>#{tool.basePurchasePrice}</td>
        <td>#{tool.baseSellingPrice}</td>
      </tr>
      """

    update: ->
      @$(".candidate-list").remove()
      @root.append(@getHtml())
