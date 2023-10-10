//
//  URLProvider.swift
//  RickAndMortyAPI
//
//  Created by Pablo Álvarez on 10/10/23.
//

import Foundation

/**
 Proporcionar la URL base que se utilizará para construir las URL de solicitud a la API.
 En este caso, la URL base se obtiene de la constante definida en el archivo Constants.swift.
 Este enfoque modular permite que la aplicación cambie fácilmente la URL base en el futuro si es necesario, sin modificar el código en múltiples lugares.
 */
class URLProvider: URLProviderProtocol {
    // Proporciona la URL base que se utilizará para construir las URL de solicitud a la API.
    func getBaseURL() -> String {
        // Devuelve la URL base desde la constante Constants.baseURL. La constante Constants.baseURL es una cadena que contiene la URL base de la API, como se define en el archivo Constants.swift.
        return Constants.baseURL
    }
    
}
