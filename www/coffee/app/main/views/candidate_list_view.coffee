_module_ 'App.Main', ->
  class @CandidateListView extends Base.View
    matchedTools: []
    registerButtonClicked: new Base.Signal

    create: ->
      @update()

    getHtml: ->
      """
      <div class="candidate-list">
        <table>#{@getToolItems()}</table>
        <input type="button" name="register" value="登録" />
      </div>
      """

    getToolItems: ->
      (@getToolItem(@matchedTools[index], index) for index in [0..@matchedTools.length-1]).join('')

    getToolItem: (tool, index) ->
      """
      <tr>
        <td><input type="checkbox" data-toolid="#{index}" /></td>
        <td>#{tool.name}</td>
        <td>#{tool.basePurchasePrice}</td>
        <td>#{tool.baseSellingPrice}</td>
      </tr>
      """

    update: ->
      @$(".candidate-list").remove()
      @root.append(@getHtml())
      @$('.candidate-list input[name=register]').click => @registerButtonClicked.dispatch()

    getCheckedItemIndexes: ->
      $(item).data("toolid") for item in @$(".candidate-list input[type=checkbox]:checked")