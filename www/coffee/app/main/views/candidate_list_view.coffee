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
        <td><input type="checkbox" #{if tool.registered then 'checked' else ''} data-index="#{index}" /></td>
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
      $(item).data("index") for item in @$(".candidate-list input[type=checkbox]:checked")

    getNotCheckedItemIndexes: ->
      checkedIndexes = @getCheckedItemIndexes()
      indexes = [0..@matchedTools.length-1]

      dest = []
      for index in indexes
        unless index in checkedIndexes
          dest.push index
      console.log indexes
      console.log checkedIndexes
      console.log dest
      dest
