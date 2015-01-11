define [
  "underscore"
], (_) ->
  return {
  serverError:
    httpStatus: 500
    errorCode: 99999
    errorMessage: "Unknown Error occured"

  userForbidden:
    httpStatus: 403
    errorCode: 62
    errorMessage: "User does not have permission to this resource"

  userUnauthorized:
    httpStatus: 401
    errorCode: 1
    errorMessage: "Credentials are required to access this resource"

  notFound:
    httpStatus: 404
    errorCode: 99999
    errorMessage: "Unable to find resource"

  notImplemented:
    httpStatus: 501
    errorCode: 99999
    errorMessage: "Method not implemented"
  }
