define [
  "underscore"
  "../mock/generic-fixtures"
], (_, GenericFixtures) ->
  Fixtures = {

    contactList:contactList = [
      {
        id: '1'
        face : '../../../public/ui-assets/img/contact.jpeg',
        name: 'Daniele'
        surname: 'Zurico'
        phone:'1234-5678901'
      },
      {
        id: '2'
        face : '../../../public/ui-assets/img/contact.jpeg',
        name: 'Jonathan'
        surname: 'Langley'
        phone:'1234-5678901'
      }
    ]
  }

  initMocks = ($httpBackend) ->

    #Get list of users
    $httpBackend.whenGET('/accounts')
    .respond(200, _.clone(Fixtures.contactList))
    #You should mock also the failure cases

  return {
  Fixtures: Fixtures
  initMocks: initMocks
  }
