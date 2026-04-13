Feature: Restful-Booker

  Background:
   * url 'https://restful-booker.herokuapp.com/auth'
   * def body = read('classpath:body/postAuth-body.json')
   * def header = read('classpath:headers/postAuth-headers.json')

  @e01 @happypath
  Scenario: E01-POST-200: create token
    Given request body
    And headers header
    When method post
    Then status 200
    * print response
    * def token = response.token
    * print token

  @e01a  @unhappypath
  Scenario Outline: E01a-POST-200: create token. Header vacio e incorrecto
    Given request body
    * header['Content-Type'] = '<content>'
    * print header
    * headers header
    When method post
    Then status 200
    * print response
    * def token = response.token
    * print token
    Examples:
      | content |
      | abcd    |
      |         |

  @e01b  @unhappypath
  Scenario Outline: E01b-POST-200: create token. Body incorrecto
    * body.username = '<user>'
    * body.password = '<pass>'
    Given request body
    * headers header
    When method post
    Then status 200
    * print response
    * def token = response.token
    * print token
    Examples:
      | user     | pass        |
      | adfvetsd | password123 |
      |          | password123 |
      | 2a20sb5g | password123 |
      | admin    | 123         |
      | admin    |             |
      | admin    | abc0293asd  |




