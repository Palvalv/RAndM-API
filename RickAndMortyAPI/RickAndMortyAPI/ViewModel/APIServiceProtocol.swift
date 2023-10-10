//
//  APIServiceProtocol.swift
//  RickAndMortyAPI
//
//  Created by Pablo Álvarez on 10/10/23.
//

import Foundation

/**
 Define un protocolo que especifica un método fetch que debe ser implementado por cualquier servicio de API en la aplicación.
 Este protocolo proporciona una abstracción que permite que varios servicios de API se ajusten a un conjunto común de comportamientos para realizar solicitudes y manejar los resultados de manera consistente.
 */
protocol APIServiceProtocol {
    func fetch<T: Decodable>(_ type: T.Type, url: URL?, completion: @escaping(Result<T, APIError>) -> Void) 
    
}
