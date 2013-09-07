_module_ 'App.Main', ->
  class @SayHelloCommand
    message: null

    execute: ->
      console.log "Hello #{@message}"