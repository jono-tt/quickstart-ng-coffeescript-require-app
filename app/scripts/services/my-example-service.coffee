define [
  "app"
], (app) ->

  app.module.factory "$myExampleService", ($q, $http, $log, $interval)->

    handleResponse = (callDfd, dfd) ->
      callDfd.success((data, status, headers, config) ->
        dfd.resolve(data)
      ).error((data, status, headers, config) ->
        dfd.reject(data)
      )

    service =
      getContacts: () ->
        dfd = $q.defer()
        handleResponse($http.get("/accounts"), dfd)
        return dfd.promise

    return service
