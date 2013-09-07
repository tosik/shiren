_module_ 'Base', ->
  class @Signal
    constructor: ->
      @slots = []
      @onceSlots = []

    add: (fn) ->
      @slots.push(fn)

    addOnce: (fn) ->
      @onceSlots.push(fn)

    remove: (fn) ->
      @slots.splice(@slots.indexOf(fn), 1)
      @onceSlots.splice(@onceSlots.indexOf(fn), 1)

    removeAll: ->
      @slots = []
      @onceSlots = []

    dispatch: ->
      slot.call() for slot in @slots
      slot.call() for slot in @onceSlots
      @onceSlots = []
