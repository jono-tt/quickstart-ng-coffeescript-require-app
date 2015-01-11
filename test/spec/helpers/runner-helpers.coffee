define [
  "angular"
  "angularMocks"
  "underscore"
  "app"
], (angular, mocks, _, app) ->
  beforeEach ->
    #Load our application module for each test
    module(app.name)

  console.log "Mocking Blob"
  window.Blob = class FakeBlob
    constructor: ->
      @data = "some data"
      @size = @data.length
      @type = "type"
      @encoding = "encoding"

  console.log "Mocking File"
  window.File = class File
    constructor: (parts, name)->
      @name = name
      @parts = parts

  window.FileReader = class MockFileReader
    @queue: []
    readAsText: (file)->
      FileReader.queue.push {
        scope: @
        cb: @onload
        value: {target: {result: file.data}}
      }

    @flush: ()->
      for item in FileReader.queue
        item.cb.call(item.scope, item.value)

      FileReader.queue = []


  RunnerHelpers =
    loadModules: (moduleNames) ->
      beforeEach ->
        moduleNames = if _.isArray(moduleNames) then moduleNames else [moduleNames]
        # Load the directive's module
        for moduleName in moduleNames
          module moduleName

    createModuleTestCtx: (moduleNames, injectFeatures) ->
      #Setup module for each directive test
      @loadModules(moduleNames)

      return RunnerHelpers.createInjectCtx(injectFeatures)

    createControllerCtx: (controllerName, injectFeatures, beforeControllerCreated) ->
      injectFeatures = [] unless _.isArray(injectFeatures)

      ctx = @createInjectCtx(injectFeatures)
      beforeEach ->
        beforeControllerCreated(ctx) if beforeControllerCreated
        ctx.ctrl = ctx.$controller(controllerName, ctx)

      return ctx

    createInjectCtx: (injectFeatures = [], applyProvide) ->
      # Inject in angular constructs otherwise,
      #  you would need to inject these into each test
      context = {}
      args = ["$rootScope", "$compile", "$controller"]
      injectFeatures = if _.isArray(injectFeatures) then injectFeatures else [injectFeatures]
      allInjects = _.reject(_.unique(args.concat injectFeatures), (item) -> !item)

      #For injection to work the arg names need to match so create a wrapper function
      func = eval("""
        f = function(#{allInjects.join(',')}) {
          #{ 'context[\'' + name + '\'] = ' + name for name in allInjects };
          context['$scope'] = $rootScope.$new()
        }
      """)

      beforeEach ->
        if applyProvide
          module ($provide)->
            applyProvide($provide)
            return null

        inject.apply context, [func]

      return context

    createDirective: (runtimeContext, data, template) ->
      # Setup scope state
      runtimeContext.$scope.data = data

      # Create directive
      elm = runtimeContext.$compile(template)(runtimeContext.$scope)

      # Trigger watchers
      runtimeContext.$scope.$apply()

      # Return
      return elm

  return RunnerHelpers
