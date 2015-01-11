define [
  "jquery"
  "app"
  "env"
], ($, app, env) ->

  app.module.controller "ExampleCtrl",
    ($scope,$location, $mdSidenav, $mdDialog,$myExampleService, $log)->

      #contactList - it works with mock
      $myExampleService.getContacts().then((contacts) ->
        $scope.contactList = contacts
      ).catch((e)->
        $log.error("unable to retrieve the contact list")
      )

      $scope.doAction = ->
        console.log "Action Taken"
        console.log "These are the current environment vars from (config/environment.env): ", env

      $scope.toggleMenu =->
        $mdSidenav("left").toggle()
