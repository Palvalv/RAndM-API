//
//  URLProviderProtocol.swift
//  RickAndMortyAPI
//
//  Created by Pablo Álvarez on 10/10/23.
//

import Foundation

/**
 Proporciona una abstracción que permite que diferentes proveedores de URL se ajusten a un conjunto común de comportamientos para proporcionar la URL base de la API de manera consistente.
 Esto facilita la sustitución de proveedores de URL en la aplicación sin cambiar el código que realiza las solicitudes a la API.
 */
protocol URLProviderProtocol {
    func getBaseURL() -> String
    
}
