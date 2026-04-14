@regresion-get
Feature: GET-Restful-Booker

  Background:
    * def baseUrl = 'https://restful-booker.herokuapp.com/booking'
    * def header = read('classpath:headers/getBookingIds-headers.json')
    #* def param = read('classpath:param/users-param.json')

  #GetBookingIds
  @e02 @happypath
  Scenario: E02-GET-200: check all ID
    Given url baseUrl
    When method get
    Then status 200
    * print response

  @e03 @happypath
  Scenario Outline: E03-GET-200: check ID by firstname and lastname
    Given  url baseUrl
    * def param = {firstname: '<firstname>', lastname: '<lastname>'}
    And params param
    When method get
    Then status 200
    * print response
    Examples:
      | firstname | lastname |
      | sally     | brown    |

  @e04 @happypath
  Scenario Outline: E04-GET-200: check ID by checkin and checkout
    Given url baseUrl
    * def param = {checkin: '<checkin>', checkout: '<checkout>'}
    And params param
    When method get
    Then status 200
    * print response
    Examples:
      | checkin    | checkout   |
      | 2014-03-13 | 2014-05-21 |

    #GetBooking
  @e05 @happypath
  Scenario Outline: E05-GET-200: check ID
    * def fullUrl = baseUrl + '/' + '<id>'
    * print fullUrl
    Given url fullUrl
    And headers header
    * print header
    When method get
    Then status 200
    * print response
    Examples:
      | id  |
      | 901 |