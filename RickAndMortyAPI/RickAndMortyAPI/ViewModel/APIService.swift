//
//  APIService.swift
//  RickAndMortyAPI
//
//  Created by Pablo Álvarez on 10/10/23.
//

import Foundation

/**
 Define una estructura APIService que se utiliza para realizar solicitudes a una API web y decodificar las respuestas en objetos Swift.
 Esta estructura se encarga de manejar varios casos de error posibles durante la solicitud y la decodificación de datos JSON.
 El resultado de la solicitud se pasa a través de un cierre de finalización que puede ser utilizado por otras partes de la aplicación para procesar la respuesta de la API.
 */
struct APIService: APIServiceProtocol {
    // Realiza solicitudes a la API, procesa las respuestas, devuelve los datos decodificados o informa sobre cualquier error que ocurra durante el proceso de solicitud y decodificación.
    func fetch<T: Decodable>(_ type: T.Type, url: URL?, completion: @escaping(Result<T, APIError>) -> Void) {

        // Comprueba que la URL proporcionada no sea nula. Si la URL es nula, se crea un error APIError.badURL y se llama a la función de finalización con un resultado fallido que contiene este error.
        guard let url = url else {
            let error = APIError.badURL
            completion(Result.failure(error))
            return
        }

        // Se encarga de realizar la solicitud a la URL proporcionada y devolver los datos, la respuesta y cualquier error que ocurra durante la solicitud.
        let task = URLSession.shared.dataTask(with: url) {(data, response, error) in
            // Verifica si se produjo un error durante la solicitud.
            // Si el error es una instancia de URLError, se llama a la función de finalización con un resultado fallido que contiene el error de URL.
            if let error = error as? URLError {
                completion(Result.failure(APIError.url(error)))
            // Verifica si la respuesta es una instancia de HTTPURLResponse y si el código de estado HTTP no está en el rango 200-299(respuesta exitosa).
            // Si la respuesta no está en ese rango, se llama a la función de finalización con un resultado fallido que contiene el código de estado HTTP como un error.
            } else if let response = response as? HTTPURLResponse, !(200...299).contains(response.statusCode) {
                completion(Result.failure(APIError.badResponse(statusCode: response.statusCode)))
            // No hay errores, se decodifican los datos de respuesta utilizando un objeto JSONDecoder.
            // Si la decodificación tiene éxito, se llama a la función de finalización con un resultado exitoso que contiene el objeto decodificado.
            // Si la decodificación falla, se llama a la función de finalización con un resultado fallido que contiene el error de decodificación.
            } else if let data = data {
                let decoder = JSONDecoder()
                do {
                    let decodeResponse = try decoder.decode(type, from: data)
                    completion(Result.success(decodeResponse))
                    print(decodeResponse)

                } catch {
                    completion(Result.failure(APIError.parsing(error as? DecodingError)))
                }
            }
        }
        // Reanuda la tarea de solicitud, lo que inicia la solicitud a la API.
        task.resume()

    }
    
    
}
