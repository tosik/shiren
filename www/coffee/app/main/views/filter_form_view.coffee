_module_ 'App.Main', ->
  class @FilterFormView extends Base.View
    toolKinds: null

    create: ->
      @root.append(@getHtml())

    getHtml: () ->
      """
      <div class="filter-form">
        <label>売値 <input type="number" /></label><br />
        <label>買値 <input type="number" /></label><br />
        <label>種類 #{@getToolKindSelectBox()}</label><br />
        <label>仮名 <input type="textfield" /></label><br />
        <label>未識別名 <input type="textfield" /></label><br />
      </div>
      """

    getToolKindSelectBox: () ->
      options = ("<option value=\"#{kind.id}\">#{kind.name}</option>" for kind in @toolKinds.list)
      console.log options
      "<select>#{options.join('')}</select>"
