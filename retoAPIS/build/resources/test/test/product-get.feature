#Author: miguel Rubide


Feature: Obtener todos los productos de su tienda y validar que uno de sus productos

  Background:
    * def testData = read('classpath:data/datosPrueba.json')
    * url testData[0].url
    * def productId = testData[0].productId
    * def category = testData[0].category
    * def title = testData[0].title
    * def rate = testData[0].rate

  Scenario: Validar el producto estrella
    Given path '/'
    When method get
    Then status 200
  # Filtrar los productos con el ID,category, title,rate
    * def productoEncontrado = karate.filter(response, item => item.id == productId && item.category == category && item.title == title && item.rating.rate == rate)[0]
    * karate.log('Producto encontrado:', productoEncontrado)