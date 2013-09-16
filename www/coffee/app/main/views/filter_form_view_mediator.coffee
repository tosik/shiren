_module_ 'App.Main', ->
  class @FilterFormViewMediator extends Base.Mediator
    toolKinds: null
    filterForm: null

    onRegister: ->
      @view.toolKinds = @toolKinds
      @view.changed.add => @setFilterForm()

    setFilterForm: ->
      @filterForm.purchasePrice = @view.getPurchasePrice()
      @filterForm.sellingPrice = @view.getSellingPrice()
      @filterForm.kind = @view.getKind()
      @filterForm.temporaryName = @view.getTemporaryName()
      @filterForm.beforeDistinguishName = @view.getBeforeDistinguishName()
      @filterForm.changed.dispatch()
