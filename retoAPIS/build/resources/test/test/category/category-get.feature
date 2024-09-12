#Author: miguel Rubide
Feature: Validar la cantidad de productos por categoria y producto especifico

  Background:
    * def testData = read('classpath:data/dataCategory.json')
    * def baseUrl = testData[0].url
    * def expectedId = testData[0].id
    * def expectedLength = testData[0].longth
    * def category = testData[0].category
    * def requestUrl  = baseUrl + category
    * url requestUrl

  Scenario: Validar la cantidad de productos por categoria y la presencia de un producto en dicha categoria
    Given path '/'
    When method get
    Then status 200
  # Verificar si la lista de IDs contiene el ID esperado
    And match $..id contains expectedId
    And match $.length() == expectedLength
 # Verificar que la lista de productos no está vacía antes de aplicar el filtro
    * assert response.length > 0

# Aplicar el filtro solo a los primeros 3 elementos de la lista
    * def productosEncontrados = response[0, 1, 2]

  # Loguear todos los productos encontrados
    * karate.forEach(productosEncontrados, producto => karate.log('Producto encontrado:', producto))