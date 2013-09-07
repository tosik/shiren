_module_ 'App.Main', ->
  class @CandidateListView
    create: ->
      @root.append(@html)

    html: """
      <div class="candidate-list">
        <table>
          <tr>
            <td>□</td>
            <td>こんにちはの草</td>
            <td>候補件数</td>
            <td>説明</td>
          </tr>
          <tr>
            <td>□</td>
            <td>こんにちはの草</td>
            <td>候補件数</td>
            <td>説明</td>
          </tr>
          <tr>
            <td>□</td>
            <td>こんにちはの草</td>
            <td>候補件数</td>
            <td>説明</td>
          </tr>
        </table>
      </div>
          """
    