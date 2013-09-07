_module_ 'App.Main', ->
  class @MainView
    create: (parent) ->
      parent.append(@html)

    html: "<p>Toshiyuki Hirooka</p>"
