require.config
  paths:
    jquery: "../bower_components/jquery/dist/jquery"
    domReady: "../bower_components/requirejs-domready/domReady"
    underscore: "../bower_components/underscore/underscore"
    store: "../bower_components/store-js/store"
    moment: "../bower_components/moment/min/moment-with-locales.min"
    jsonPath: "../libs/jsonpath-0.8.0"

    es5Shim: "../bower_components/es5-shim/es5-shim"
    consoleShim: "../bower_components/console-shim/console-shim"
    json3: "../bower_components/json3/lib/json3.min"
    promise: "../bower_components/es6-promise/promise.min"

    hammer: "../bower_components/hammerjs/hammer"
    hammerProxy: '../config/hammer-proxy'
    angular: "../bower_components/angular/angular"
    ngAnimate: "../bower_components/angular-animate/angular-animate.min"
    ngAria: "../bower_components/angular-aria/angular-aria.min"
    ngMaterial: "../bower_components/angular-material/angular-material"

    ngRoute: "../bower_components/angular-route/angular-route"

    baseObject: "scripts/helpers/base-object"
    app: "scripts/app/app"
    additionalNgDependencies: "scripts/app/additional-ng-dependencies"
    env: "../env"

  shim:
    hammer:
      exports: "Hammer"

    angular:
      exports: "angular"
      deps: [ "jquery" ]

    ngRoute:
      exports: "angularRoute"
      deps: [ "angular" ]

    ngAnimate:
      exports: "angularAnimate"
      deps: [ "angular" ]

    ngAria:
      exports: "angularAria"
      deps: [ "angular" ]

    ngMaterial:
      exports: "angularMaterial"
      deps: ["angular"]

    ngBootstrap:
      deps: [ "angular" ]

    underscore:
      exports: "_"

    jsonPath:
      exports: "jsonPath"

    promise:
      exports: "Promise"

  deps: [
    "jquery","hammer","hammerProxy", "angular", "ngMaterial", "ngAnimate", "ngAria", "consoleShim",
    "es5Shim", "consoleShim","json3", "underscore", "baseObject", "promise", "env"
  ]
