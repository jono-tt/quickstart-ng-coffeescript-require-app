define [
  "app"
  "env"
  "underscore"
  "runnerHelpers"
  "../../mock/portal-mocks.coffee"
], (app, env, _, RunnerHelpers, PortalMock) ->
  describe "Example Controller", ->
    ctx = RunnerHelpers.createControllerCtx 'ExampleCtrl',
    ["$q", "$httpBackend", "$myExampleService"], (ctx)->

      ctx.$scope.hasSomePreFilledProperty = "i do"

      #To retrieve the data that contain the list of services
      spyOn(ctx.$myExampleService, "getContacts").andCallThrough()
      PortalMock.initMocks(ctx.$httpBackend)

    it "should have an action function", ->
      spyOn console, "log"
      expect(ctx.$scope.doAction).toBeDefined()
      ctx.$scope.doAction()
      expect(console.log).toHaveBeenCalledWith "Action Taken"

    it "should have prefilled properties on the scope", ->
      expect(ctx.$scope.hasSomePreFilledProperty).toEqual "i do"

    it "Should get the list of services", ->
      ctx.$httpBackend.flush()
      expect(ctx.$myExampleService.getContacts).toHaveBeenCalled()
      expect(ctx.$scope.contactList).toEqual(PortalMock.Fixtures.contactList)
