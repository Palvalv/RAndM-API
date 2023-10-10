//
//  APIMockService.swift
//  RickAndMortyAPI
//
//  Created by Pablo Álvarez on 10/10/23.
//

import Foundation

/**
 Simular respuestas de solicitud a la API con fines de testing.
 La estructura toma un resultado predefinido y lo utiliza como resultado de la solicitud simulada cuando se llama a la función fetch.
 Esto permite realizar pruebas de componentes que dependen de servicios de API sin necesidad de realizar solicitudes reales a la red.
 */
struct APIMockService: APIServiceProtocol {
    // Almacena un resultado de tipo Result<RickAndMortyResponse, APIError>. Este resultado se utiliza para simular la respuesta de una solicitud a la API.
    // El tipo Result es un tipo enum que puede tener dos casos: success (éxito) o failure (fracaso). En este caso, result contendrá uno de estos dos casos.
    var result: Result<RickAndMortyResponse, APIError>
    
    func fetch<T: Decodable>(_ type: T.Type, url: URL?, completion: @escaping(Result<T, APIError>) -> Void) {
        guard let result = result as? Result<T, APIError> else {
            let error = APIError.badURL
            completion(Result.failure(error))
            return
        }
        completion(result)
    }
    
    
}
