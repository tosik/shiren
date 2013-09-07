_module_ 'App.Main', ->
  class @SayHelloCommand
    execute: ->
      console.log 'Hello'