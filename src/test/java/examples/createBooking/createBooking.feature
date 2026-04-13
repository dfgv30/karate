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

  @e06a
  Scenario Outline:  E06a-POST-500: headers content-type incorrecto
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
    * header['Content-Type'] = '<content>'
    * print header
    And headers header
    When method post
    Then status 500
    * print response
    Examples:
      | content   | firstname | lastname | totalprice | depositpaid | checkin    | checkout   | additionalneeds |
      | abcde     | Sung Jin  | Woo      | 666        | true        | 2006-04-30 | 2007-04-30 | Anime           |
      | 324233303 | Sung Jin  | Woo      | 666        | true        | 2006-04-30 | 2007-04-30 | Anime           |
      | asd5234   | Sung Jin  | Woo      | 666        | true        | 2006-04-30 | 2007-04-30 | Anime           |
      |           | Sung Jin  | Woo      | 666        | true        | 2006-04-30 | 2007-04-30 | Anime           |

  @e06b
  Scenario Outline:  E06b-POST-418: Headers accept incorrecto
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
    * header.Accept = '<accept>'
    * print header
    And headers header
    When method post
    Then status 418
    * print response
    Examples:
      | accept    | firstname | lastname | totalprice | depositpaid | checkin    | checkout   | additionalneeds |
      | abcde     | Sung Jin  | Woo      | 666        | true        | 2006-04-30 | 2007-04-30 | Anime           |
      | 324233303 | Sung Jin  | Woo      | 666        | true        | 2006-04-30 | 2007-04-30 | Anime           |
      | asd5234   | Sung Jin  | Woo      | 666        | true        | 2006-04-30 | 2007-04-30 | Anime           |
      |           | Sung Jin  | Woo      | 666        | true        | 2006-04-30 | 2007-04-30 | Anime           |

  @e06c
  Scenario Outline:  E06c-POST-200: body incorrecto
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
      |           | Yin      | 111        | true        | 2006-04-30 | 2007-04-30 | dinner          |
      | 3423      | Yin      | 111        | true        | 2006-04-30 | 2007-04-30 | dinner          |
      | a2bde4af  | Yin      | 111        | true        | 2006-04-30 | 2007-04-30 | dinner          |
      | a         | Yin      | 111        | true        | 2006-04-30 | 2007-04-30 | dinner          |
      | Cazador   |          | 111        | true        | 2006-04-30 | 2007-04-30 | dinner          |
      | Cazador   | 234234   | 111        | true        | 2006-04-30 | 2007-04-30 | dinner          |
      | Cazador   | a34df321 | 111        | true        | 2006-04-30 | 2007-04-30 | dinner          |
      | Cazador   | a        | 111        | true        | 2006-04-30 | 2007-04-30 | dinner          |
      | Cazador   | Wun      | ""         | true        | 2006-04-30 | 2007-04-30 | dinner          |
      | Cazador   | Wun      | "abcd"     | true        | 2006-04-30 | 2007-04-30 | dinner          |
      | Cazador   | Wun      | true       | true        | 2006-04-30 | 2007-04-30 | dinner          |
      | Cazador   | Wun      | 111        | ""          | 2006-04-30 | 2007-04-30 | dinner          |
      | Cazador   | Wun      | 111        | "abcd"      | 2006-04-30 | 2007-04-30 | dinner          |
      | Cazador   | Wun      | 111        | true        |            | 2007-04-30 | dinner          |
      | Cazador   | Wun      | 111        | true        | 30-04-2000 | 2007-04-30 | dinner          |
      | Cazador   | Wun      | 111        | true        | 9999-04-30 | 2007-04-30 | dinner          |
      | Cazador   | Wun      | 111        | true        | 2006-99-30 | 2007-04-30 | dinner          |
      | Cazador   | Wun      | 111        | true        | 2006-04-99 | 2007-04-30 | dinner          |
      | Cazador   | Wun      | 111        | true        | 2006-04-99 |            | dinner          |
      | Cazador   | Wun      | 111        | true        | 2006-04-99 | 30-04-2000 | dinner          |
      | Cazador   | Wun      | 111        | true        | 2006-04-99 | 9999-04-30 | dinner          |
      | Cazador   | Wun      | 111        | true        | 2006-04-99 | 2007-99-30 | dinner          |
      | Cazador   | Wun      | 111        | true        | 2006-04-99 | 2007-04-99 | dinner          |
      | Cazador   | Wun      | 111        | true        | 2006-04-30 | 2007-04-30 |                 |

  @e06d
  Scenario Outline:  E06d-POST-500: body incompleto
    Given url baseUrl
    * body.firstname = '<firstname>'
    * body.lastname = '<lastname>'
    * body.totalprice = <totalprice>
    * body.depositpaid = <depositpaid>
    * body.bookingdates.checkin = '<checkin>'
    * body.bookingdates.checkout = '<checkout>'
    * body.additionalneeds = '<additionalneeds>'
    * remove body.<field>
    * print body
    * request body
    Given headers header
    When method post
    Then status 500
    * print response
    Examples:
      | field                 | firstname | lastname | totalprice | depositpaid | checkin    | checkout   | additionalneeds |
      | firstname             | Sung Jin  | Woo      | 666        | true        | 2006-04-30 | 2007-04-30 | Anime           |
      | lastname              | Sung Jin  | Woo      | 666        | true        | 2006-04-30 | 2007-04-30 | Anime           |
      | totalprice            | Sung Jin  | Woo      | 666        | true        | 2006-04-30 | 2007-04-30 | Anime           |
      | depositpaid           | Sung Jin  | Woo      | 666        | true        | 2006-04-30 | 2007-04-30 | Anime           |
      | bookingdates.checkin  | Sung Jin  | Woo      | 666        | true        | 2006-04-30 | 2007-04-30 | Anime           |
      | bookingdates.checkout | Sung Jin  | Woo      | 666        | true        | 2006-04-30 | 2007-04-30 | Anime           |
