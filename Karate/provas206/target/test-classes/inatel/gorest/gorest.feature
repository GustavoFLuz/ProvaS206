Feature: Testando API Go Rest

Background: background
    * def url_base = 'https://gorest.co.in/'

Scenario: Verifica se os users estão cadastrados corretamente na API
  Given url url_base
  And path "/public/v2/users"
  When method get
  Then status 200
  And match each $ contains {"id": "#number","name":"#string","email":"#string","gender":"#string","status":"#string"}

Scenario: Verifica retorno de array no endpoint de posts
    Given url url_base
    And path "/public/v2/posts"
    When method get
    Then status 200
    And match $ == "#[]"

Scenario: Verifica cadastro de usuário
    Given url url_base
    And path "/public/v2/users"
    And header Authorization = 'Bearer 7449e64b23c6199d1cb303f50b772a1f9e7745103c89e67c06a1843088be7b2c'
    And request {"name":"TestKarate","email":"testKarate@test.com","gender":"male","status":"inactive"}
    When method post
    Then status 201
    
Scenario: Verifica retornos encadeados de posts por usuário
    Given url url_base
    And path "/public/v2/users"
    When method get
    Then status 200
    And def id = $[0].id
    Given url url_base
    And path "/public/v2/users/" + id + "/posts"
    When method get
    Then status 200

Scenario: Verifica endpoint inválido
    Given url url_base
    And path "/public/v3/users"
    When method get
    Then status 404


