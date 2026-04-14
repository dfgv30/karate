@regresion-update
Feature: PUT-create-Restful-Booker

  Background:
    * call read('classpath:examples/postAuth/postAuth.feature@happypath')
    * def baseUrl = 'https://restful-booker.herokuapp.com/booking'
    * def header = read('classpath:headers/updateBooking-headers.json')
    * def body = read('classpath:body/postBooking-body.json')

  @e07
  Scenario Outline:  E07-PUT-200: update book
    * def fullUrl = baseUrl + '/' + '<id>'
    Given url fullUrl
    * body.firstname = '<firstname>'
    * body.lastname = '<lastname>'
    * body.totalprice = <totalprice>
    * body.depositpaid = <depositpaid>
    * body.bookingdates.checkin = '<checkin>'
    * body.bookingdates.checkout = '<checkout>'
    * body.additionalneeds = '<additionalneeds>'
    * print body
    Given request body
    * header.Cookie = 'token=' + token
    * print header
    Given headers header
    When method put
    Then status 200
    * print response
    Examples:
      | id | firstname | lastname | totalprice | depositpaid | checkin    | checkout   | additionalneeds |
      | 142  | Cazador   | Wun      | 111        | true        | 2006-04-30 | 2007-04-30 | dinner          |

  @e07a
  Scenario Outline:  E07a-PUT-400: update book. Header content-type incorrecto
    * def fullUrl = baseUrl + '/' + '<id>'
    Given url fullUrl
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
    * header.Cookie = 'token=' + token
    * print header
    Given headers header
    When method put
    Then status 400
    * print response
    Examples:
      | content   | id   | firstname | lastname | totalprice | depositpaid | checkin    | checkout   | additionalneeds |
      | abcde     | 1597 | Cazador   | Wun      | 111        | true        | 2006-04-30 | 2007-04-30 | dinner          |
      | 324233303 | 1597 | Cazador   | Wun      | 111        | true        | 2006-04-30 | 2007-04-30 | dinner          |
      | asd5234   | 1597 | Cazador   | Wun      | 111        | true        | 2006-04-30 | 2007-04-30 | dinner          |
      |           | 1597 | Cazador   | Wun      | 111        | true        | 2006-04-30 | 2007-04-30 | dinner          |

  @e07b
  Scenario Outline:  E07b-PUT-418: update book. Header Accept incorrecto
    * def fullUrl = baseUrl + '/' + '<id>'
    Given url fullUrl
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
    * header.Cookie = 'token=' + token
    * print header
    Given headers header
    When method put
    Then status 418
    * print response
    Examples:
      | accept        | id   | firstname | lastname | totalprice | depositpaid | checkin    | checkout   | additionalneeds |
      | a             | 1286 | Cazador   | Wun      | 111        | true        | 2006-04-30 | 2007-04-30 | dinner          |
      | 2342623446533 | 1286 | Cazador   | Wun      | 111        | true        | 2006-04-30 | 2007-04-30 | dinner          |
      | kas304sjh92   | 1286 | Cazador   | Wun      | 111        | true        | 2006-04-30 | 2007-04-30 | dinner          |
      |               | 1286    | Cazador   | Wun      | 111        | true        | 2006-04-30 | 2007-04-30 | dinner          |

  @e07c
  Scenario Outline:  E07c-PUT-403: update book. Header Cookie incorrecto
    * def fullUrl = baseUrl + '/' + '<id>'
    Given url fullUrl
    * body.firstname = '<firstname>'
    * body.lastname = '<lastname>'
    * body.totalprice = <totalprice>
    * body.depositpaid = <depositpaid>
    * body.bookingdates.checkin = '<checkin>'
    * body.bookingdates.checkout = '<checkout>'
    * body.additionalneeds = '<additionalneeds>'
    * print body
    Given request body
    * header.Cookie = '<cookie>'
    * print header
    Given headers header
    When method put
    Then status 403
    * print response
    Examples:
      | cookie    | id   | firstname | lastname | totalprice | depositpaid | checkin    | checkout   | additionalneeds |
      | a         | 1597 | Cazador   | Wun      | 111        | true        | 2006-04-30 | 2007-04-30 | dinner          |
      | 234723423 | 1597 | Cazador   | Wun      | 111        | true        | 2006-04-30 | 2007-04-30 | dinner          |
      | 1209shsdf | 1597 | Cazador   | Wun      | 111        | true        | 2006-04-30 | 2007-04-30 | dinner          |
      |           | 1597 | Cazador   | Wun      | 111        | true        | 2006-04-30 | 2007-04-30 | dinner          |

  @e07d
    #Este scenario no debería de tener status 200, porque no cumple con el formato del body correcto, pero se entiende que es una API BÁSICA
  Scenario Outline:  E07d-PUT-200: Body incorrecto
    * def fullUrl = baseUrl + '/' + '<id>'
    Given url fullUrl
    * body.firstname = '<firstname>'
    * body.lastname = '<lastname>'
    * body.totalprice = <totalprice>
    * body.depositpaid = <depositpaid>
    * body.bookingdates.checkin = '<checkin>'
    * body.bookingdates.checkout = '<checkout>'
    * body.additionalneeds = '<additionalneeds>'
    * print body
    Given request body
    * header.Cookie = 'token=' + token
    * print header
    Given headers header
    When method put
    Then status 200
    * print response
    Examples:
      | id  | firstname | lastname | totalprice | depositpaid | checkin    | checkout   | additionalneeds |
      | 142 |           | Yin      | 111        | true        | 2006-04-30 | 2007-04-30 | dinner          |
      | 142 | 3423      | Yin      | 111        | true        | 2006-04-30 | 2007-04-30 | dinner          |
      | 142 | a2bde4af  | Yin      | 111        | true        | 2006-04-30 | 2007-04-30 | dinner          |
      | 142 | a         | Yin      | 111        | true        | 2006-04-30 | 2007-04-30 | dinner          |
      | 142 | Cazador   |          | 111        | true        | 2006-04-30 | 2007-04-30 | dinner          |
      | 142 | Cazador   | 234234   | 111        | true        | 2006-04-30 | 2007-04-30 | dinner          |
      | 142 | Cazador   | a34df321 | 111        | true        | 2006-04-30 | 2007-04-30 | dinner          |
      | 142 | Cazador   | a        | 111        | true        | 2006-04-30 | 2007-04-30 | dinner          |
      | 142 | Cazador   | Wun      | ""         | true        | 2006-04-30 | 2007-04-30 | dinner          |
      | 142 | Cazador   | Wun      | "abcd"     | true        | 2006-04-30 | 2007-04-30 | dinner          |
      | 142 | Cazador   | Wun      | true       | true        | 2006-04-30 | 2007-04-30 | dinner          |
      | 142 | Cazador   | Wun      | 111        | ""          | 2006-04-30 | 2007-04-30 | dinner          |
      | 142 | Cazador   | Wun      | 111        | "abcd"      | 2006-04-30 | 2007-04-30 | dinner          |
      | 142 | Cazador   | Wun      | 111        | true        |            | 2007-04-30 | dinner          |
      | 142 | Cazador   | Wun      | 111        | true        | 30-04-2000 | 2007-04-30 | dinner          |
      | 142 | Cazador   | Wun      | 111        | true        | 9999-04-30 | 2007-04-30 | dinner          |
      | 142 | Cazador   | Wun      | 111        | true        | 2006-99-30 | 2007-04-30 | dinner          |
      | 142 | Cazador   | Wun      | 111        | true        | 2006-04-99 | 2007-04-30 | dinner          |
      | 142 | Cazador   | Wun      | 111        | true        | 2006-04-99 |            | dinner          |
      | 142 | Cazador   | Wun      | 111        | true        | 2006-04-99 | 30-04-2000 | dinner          |
      | 142 | Cazador   | Wun      | 111        | true        | 2006-04-99 | 9999-04-30 | dinner          |
      | 142 | Cazador   | Wun      | 111        | true        | 2006-04-99 | 2007-99-30 | dinner          |
      | 142 | Cazador   | Wun      | 111        | true        | 2006-04-99 | 2007-04-99 | dinner          |
      | 142 | Cazador   | Wun      | 111        | true        | 2006-04-30 | 2007-04-30 |                 |

  @e07e
  Scenario Outline:  E07e-PUT-400: body incompleto
    * def fullUrl = baseUrl + '/' + '<id>'
    Given url fullUrl
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
    * header.Cookie = 'token=' + token
    * print header
    Given headers header
    When method put
    Then status 400
    * print response
    Examples:
      | field                 | id  | firstname | lastname | totalprice | depositpaid | checkin    | checkout   | additionalneeds |
      | firstname             | 142 | Sung Jin  | Woo      | 666        | true        | 2006-04-30 | 2007-04-30 | Anime           |
      | lastname              | 142 | Sung Jin  | Woo      | 666        | true        | 2006-04-30 | 2007-04-30 | Anime           |
      | totalprice            | 142 | Sung Jin  | Woo      | 666        | true        | 2006-04-30 | 2007-04-30 | Anime           |
      | depositpaid           | 142 | Sung Jin  | Woo      | 666        | true        | 2006-04-30 | 2007-04-30 | Anime           |
      | bookingdates.checkin  | 142 | Sung Jin  | Woo      | 666        | true        | 2006-04-30 | 2007-04-30 | Anime           |
      | bookingdates.checkout | 142   | Sung Jin  | Woo      | 666        | true        | 2006-04-30 | 2007-04-30 | Anime           |

