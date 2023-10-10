//
//  RickAndMortyResponse.swift
//  RickAndMortyAPI
//
//  Created by Pablo Álvarez on 10/10/23.
//

import UIKit
import Combine

/**
 Representa la respuesta de la API, dicha estructura contiene propiedades opcionales que almacenan información general y una lista de personajes.
 */

/*
Conforma a los protocolos Codable y Equatable.
'Codable' indica que esta estructura puede ser codificada y decodificada desde y hacia formato JSON u otros formatos.
'Equatable' permite comparar dos instancias de esta estructura para verificar si son iguales.
*/
struct RickAndMortyResponse: Codable, Equatable {
    // Almacena información general sobre la respuesta: número total de elementos, número de páginas, enlaces a páginas siguientes y anteriores.
    var info: InfoResponse?
    // Almacena un array de objetos de tipo CharacterResponse que representa la lista de personajes.
    var results: [CharacterResponse]?
    
    // Crear una respuesta predeterminada, para inicializar datos cuando no se ha recibido una respuesta de la API.
    static func createDefault() -> RickAndMortyResponse {
            var response = RickAndMortyResponse()
            response.info = InfoResponse(count: 1, pages: 1, next: nil, prev: nil)
            response.results = [CharacterResponse.createDefault()]
            return response
        }
    
}
