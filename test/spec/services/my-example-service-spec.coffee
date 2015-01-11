define [
  "app"
  "runnerHelpers"
  "angularMocks"
  "scripts/services/my-example-service"
  "../../mock/portal-mocks.coffee"
  "../../mock/generic-fixtures.coffee"
], (app, RunnerHelpers, ngMocks, mod, PortalMocks, GenericFixture) ->

  describe "My Example Service", ->
    #TODO: Inject your service by specifying it in the RunnerHelper
    ctx = RunnerHelpers.createInjectCtx(["$myExampleService", "$httpBackend"])
    resp = null
    srv = null

    beforeEach ->
      PortalMocks.initMocks(ctx.$httpBackend)
      resp = null
      srv = ctx.$myExampleService

    describe "get contacts services", ->
      it "should get contacts successfully", ->
        srv.getContacts().then (r) ->
          resp = r

        ctx.$httpBackend.flush()
        expect(resp).toEqual(PortalMocks.Fixtures.contactList)
