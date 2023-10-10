//
//  RickAndMortyAPITests.swift
//  RickAndMortyAPITests
//
//  Created by Pablo Álvarez on 10/10/23.
//

import XCTest
import Combine
@testable import RickAndMortyAPI

/**
 Contiene pruebas unitarias que evalúan el comportamiento de NetworkManager en diferentes escenarios, incluidos los casos de éxito y error al obtener datos de personajes de la serie  a través de una API simulada.
 Estas pruebas ayudan a garantizar que la aplicación maneje adecuadamente las respuestas exitosas y los errores durante la obtención de datos.
 */

final class RickAndMortyAPITests: XCTestCase {
    // Este método se llama antes de ejecutar cada prueba. En este caso, no contiene ninguna configuración adicional.
    override func setUp() {
        
    }
    
    // Este método se llama después de ejecutar cada prueba, no realiza ninguna tarea específica en este archivo.
    override func tearDown() {
        
    }
    
    // Almacena un conjunto de suscripciones a editoriales. Esto se utiliza para administrar las suscripciones a Combine que se utilizan en las pruebas.
    var subscriptions = Set<AnyCancellable>()
    
    // Verifica el caso de éxito al obtener datos de personajes de la serie.
    func test_getting_characters_success() {
        // Se crea un resultado de éxito que contiene una respuesta predeterminada de personajes.
        let result = Result<RickAndMortyResponse, APIError>.success(RickAndMortyResponse.createDefault())
        
        // Se crea una instancia de NetworkManager utilizando APIMockService con el resultado preparado.
        let fetcher = NetworkManager(service: APIMockService(result: result))
        
        // Se crea una expectativa llamada "getting characters" para asegurarse de que los datos de personajes se obtienen correctamente.
        let promise = expectation(description: "getting characters")
        
        // Se suscribe al valor de $decodeResponse de fetcher (un @Published de tipo RickAndMortyResponse?) y se cumple la expectativa si los personajes no son nulos.
        fetcher.$decodeResponse.sink { characters in
            if characters != nil {
                promise.fulfill()
            }
        }.store(in: &subscriptions)
        
        // Se espera que se cumpla la expectativa dentro de un límite de tiempo.
        wait(for: [promise], timeout: 2)
    }
    
    // Verifica el manejo de errores al cargar datos de personajes.
    func test_loading_error() {
        // Se crea un resultado de fallo (Result<RickAndMortyResponse, APIError>.failure) que representa un error de URL (APIError.badURL).
        let result = Result<RickAndMortyResponse, APIError>.failure(APIError.badURL)

        // Se crea una instancia de NetworkManager utilizando APIMockService con el resultado de error preparado.
        let fetcher = NetworkManager(service: APIMockService(result: result))

        /* Se crean dos expectativas: una para verificar que no se cargaron personajes y otra para verificar que se muestra un mensaje de error.
        Se suscribe a los valores de $characterArray y $errorMessage de fetcher.
        La primera expectativa se cumple si no se cargaron personajes (el array de personajes está vacío).
        La segunda expectativa se cumple si se establece un mensaje de error en $errorMessage.
        */
        let promise = expectation(description: "show error message")
        fetcher.$characterArray.sink { characters in
            if !characters.isEmpty {
                XCTFail()
            }

        }.store(in: &subscriptions)

        fetcher.$errorMessage.sink { message in
            if message != nil {
                promise.fulfill()
            }
        }.store(in: &subscriptions)

        // Se espera que ambas expectativas se cumplan dentro de un límite de tiempo.
        wait(for: [promise], timeout: 2)
    }
    

}
