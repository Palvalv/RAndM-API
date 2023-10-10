//
//  APIError.swift
//  RickAndMortyAPI
//
//  Created by Pablo Álvarez on 10/10/23.
//

import Foundation

/**
 Define una enumeración de errores personalizados que se utilizan en la aplicación para manejar situaciones problemáticas relacionadas con la comunicación y decodificación de datos de la API externa.
 Cada error tiene una descripción localizada para mostrar a los usuarios y una descripción más detallada para ayudar en la depuración.
 */
enum APIError: Error, CustomStringConvertible {
    // La URL proporcionada para la solicitud es inválida o está mal formada.
    case badURL
    // Recibe una respuesta HTTP con un código de estado que indica un error.
    case badResponse(statusCode: Int)
    // Errores relacionados con la URL de la solicitud, como problemas de conectividad o de sesión.
    case url(URLError?)
    // Error al decodificar los datos de respuesta en el tipo esperado.
    case parsing(DecodingError?)
    // Error desconocido o no especificado.
    case unknown
    
    // Depende del caso de error y utiliza cadenas localizadas definidas en archivos de cadenas (Localizable.strings) para obtener mensajes de error legibles.
    var localizedDescription: String {
        switch self {
        case .unknown:
            return NSLocalizedString("error.message.badResponse", comment: "")
        case .badURL, .parsing:
            return NSLocalizedString("error.message.generic", comment: "")
        case .badResponse(_):
            return NSLocalizedString("error.message.statusCode", comment: "")
        case .url(let error):
            return error?.localizedDescription ?? NSLocalizedString("error.message.generic", comment: "")
        }
    }
    
    // Proporciona una descripción más detallada del error que puede ser útil para fines de depuración.
    var description: String {
        switch self {
        case .unknown:
            return NSLocalizedString("error.message.badResponse", comment: "")
        case .badURL:
            return NSLocalizedString("error.message.badURL", comment: "")
        case .url(let error):
            return error?.localizedDescription ?? NSLocalizedString("error.message.sesion", comment: "")
        case .parsing(let error):
            return NSLocalizedString("error.message.parsing", comment: "") + (error?.localizedDescription ?? "")
        case .badResponse(statusCode: let statusCode):
            return NSLocalizedString("error.message.statusCode", comment: "") + "\(statusCode)"
        }
    }
    
    
}
