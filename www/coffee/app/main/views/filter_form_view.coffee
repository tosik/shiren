_module_ 'App.Main', ->
  class @FilterFormView extends Base.View
    toolKinds: null
    changed: new Base.Signal

    create: ->
      @root.append(@getHtml())
      for input in @$('#filter-form input')
        input.onchange = => @changed.dispatch()
      for select in @$('#filter-form select')
        select.onchange = => @changed.dispatch()

    getHtml: ->
      """
      <div class="filter-form" id="filter-form">
        <label>売値 <input type="number" name="purchase-price" /></label><br />
        <label>買値 <input type="number" name="selling-price" /></label><br />
        <label>種類 #{@getToolKindSelectBox()}</label><br />
        <label>仮名 <input type="textfield" name="temporary-name" /></label><br />
      </div>
      """

    getToolKindSelectBox: ->
      options = ("<option value=\"#{kind.id}\">#{kind.name}</option>" for kind in @toolKinds.list)
      "<select name=\"kind\">#{options.join('')}</select>"

    getPurchasePrice: -> parseInt @$('#filter-form [name=purchase-price]').val()
    getSellingPrice: -> parseInt @$('#filter-form [name=selling-price]').val()
    getKind: -> @$('#filter-form [name=kind]').val()
    getTemporaryName: -> @$('#filter-form [name=temporary-name]').val()
