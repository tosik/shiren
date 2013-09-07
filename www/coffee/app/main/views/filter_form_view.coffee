_module_ 'App.Main', ->
  class @FilterFormView extends Base.View
    create: ->
      @root.append(@html)

    html: """
      <div class="filter-form">
        <label>売値 <input type="number" /></label><br />
        <label>買値 <input type="number" /></label><br />
        <label>種類 <select>
          <option value="武器">武器</value>
          <option value="盾">盾</value>
          <option value="腕輪">腕輪</value>
          <option value="壷">壷</value>
          <option value="巻物">巻物</value>
          <option value="杖">杖</value>
          <option value="草・種">草・種</value>
          </select>
        </label><br />
        <label>仮名 <input type="textfield" /></label><br />
        <label>未識別名 <input type="textfield" /></label><br />
      </div>
          """