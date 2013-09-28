_module_ 'App.Main', ->
  class @CandidateListView extends Base.View
    matchedTools: null
    registerButtonClicked: new Base.Signal
    registeredFilterForms: null

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
        #{@getRegisteredFilterFormsTag(tool)}
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
      dest

    getRegisteredFilterFormsTag: (tool) ->
      forms = @getRegisteredFilterForms(tool)
      content = (form.temporaryName for form in forms).join(',')
      "<td>#{content}</td>"

    getRegisteredFilterForms: (tool) ->
      forms = []
      for form in @registeredFilterForms
        toolIds = (t.id for t in form.registeredTools)
        console.log @registeredFilterForms
        if tool.id in toolIds
          forms.push form

      forms