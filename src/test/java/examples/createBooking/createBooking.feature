@regresion-create
Feature: POST-create-Restful-Booker

  Background:
    * def baseUrl = 'https://restful-booker.herokuapp.com/booking'
    * def header = read('classpath:headers/postBooking-headers.json')
    * def body = read('classpath:body/postBooking-body.json')

    @e06
    Scenario Outline:  E06-POST-200: create book
      Given url baseUrl
      * body.firstname = '<firstname>'
      * body.lastname = '<lastname>'
      * body.totalprice = <totalprice>
      * body.depositpaid = <depositpaid>
      * body.bookingdates.checkin = '<checkin>'
      * body.bookingdates.checkout = '<checkout>'
      * body.additionalneeds = '<additionalneeds>'
      * print body
      And request body
      And headers header
      When method post
      Then status 200
      * print response
      Examples:
        | firstname | lastname | totalprice | depositpaid | checkin    | checkout   | additionalneeds |
        | Sung Jin  | Woo      | 666        | true        | 2006-04-30 | 2007-04-30 | Anime           |

  @e06
  Scenario Outline:  E06-POST-200: create book
    Given url baseUrl
    * body.firstname = '<firstname>'
    * body.lastname = '<lastname>'
    * body.totalprice = <totalprice>
    * body.depositpaid = <depositpaid>
    * body.bookingdates.checkin = '<checkin>'
    * body.bookingdates.checkout = '<checkout>'
    * body.additionalneeds = '<additionalneeds>'
    * print body
    Given request body
    Given headers header
    When method post
    Then status 200
    * print response
    Examples:
      | firstname | lastname | totalprice | depositpaid | checkin    | checkout   | additionalneeds |
      | Sung Jin  | Woo      | 666        | true        | 2006-04-30 | 2007-04-30 | Anime           |

  @e06a
  Scenario Outline:  E06a-POST-200: headers incorrecto
    Given url baseUrl
    * body.firstname = '<firstname>'
    * body.lastname = '<lastname>'
    * body.totalprice = <totalprice>
    * body.depositpaid = <depositpaid>
    * body.bookingdates.checkin = '<checkin>'
    * body.bookingdates.checkout = '<checkout>'
    * body.additionalneeds = '<additionalneeds>'
    * print body
    Given request body
    Given headers header
    When method post
    Then status 200
    * print response
    Examples:
      | firstname | lastname | totalprice | depositpaid | checkin    | checkout   | additionalneeds |
      | Sung Jin  | Woo      | 666        | true        | 2006-04-30 | 2007-04-30 | Anime           |