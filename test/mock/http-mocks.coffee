define [
  "env"
  "app"
  "underscore"
  "../mock/portal-mocks"
], (env, app, _,
    PortalMocks
) ->

  app.module.run ($httpBackend)->

    PortalMocks.initMocks($httpBackend)

    $httpBackend.whenGET().passThrough()
    $httpBackend.whenPOST().passThrough()
    $httpBackend.whenPUT().passThrough()
    $httpBackend.whenDELETE().passThrough()
