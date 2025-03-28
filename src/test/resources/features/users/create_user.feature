Feature: Crear un usuario en Reqres

  Background:
    * url 'https://jsonplaceholder.typicode.com/'
#Metodo Post se espera un 201
  Scenario: Crear un nuevo usuario exitosamente
    Given path '/users/'
    And request { "name": "John Doe", "job": "QA Engineer"}
    When method POST
    Then status 201
    And match response == {name: "John Doe", job: "QA Engineer", id: '#notnull'}
    * print response

#Metodo Get se espera un 200
  Scenario: Obtener un usuario existente
    * def userId = karate.get('response.Id', 'defaultValue')
    Given path '/users/', userId
    When method get
    Then status 200
    And match response.data.first_name == 'John'
    * print response