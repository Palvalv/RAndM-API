//
//  NetworkManager.swift
//  RickAndMortyAPI
//
//  Created by Pablo Álvarez on 10/10/23.
//

import Foundation

/**
 Gestiona la comunicación con la API externa para obtener datos de personajes.
 Notifica a las vistas cuando cambian los datos importantes, como la carga de personajes o la aparición de errores.
 */

// Con Observable, puede notificar a las vistas cuando ocurren cambios en sus propiedades anotadas con @Published.
// Esto permite que las vistas se actualicen automáticamente cuando cambian los datos gestionados por NetworkManager.
class NetworkManager: ObservableObject {
    // Almacena en un array que contiene objetos de tipo CharacterResponse que representan los personajes obtenidos de la API.
    @Published var characterArray = [CharacterResponse]()
    // Almacena todos los personajes obtenidos de la API en un solo objeto.
    @Published var decodeResponse: RickAndMortyResponse? = nil
    // Indica con un booleano si se está realizando una solicitud a la API en ese momento.
    @Published var isLoading: Bool = false
    // Indica un mensaje de error en caso de que ocurra un problema durante la solicitud a la API.
    @Published var errorMessage: String? = nil
    
    let service: APIServiceProtocol
    let characterUrl = "/character/"
    
    // Toma un objeto que cumple con el protocolo URLProviderProtocol y devuelve la URL completa para obtener datos de personajes.
    // Combina la URL base proporcionada por URLProvider con la parte de la URL específica para los personajes.
    func getCharactersUrl(urlProvider: URLProviderProtocol) -> String {
        return urlProvider.getBaseURL() + characterUrl
    }
    
    // Inicializador
    init(service: APIServiceProtocol = APIService(), urlProvider: URLProviderProtocol = URLProvider()) {
        self.service = service
        getCharactersData(url: URL(string: getCharactersUrl(urlProvider: urlProvider)))
    }
    
    
    func getCharactersData(url: URL?) {
        // Indica que la solicitud está en progreso y borra cualquier mensaje de error existente.
        isLoading = true
        errorMessage = nil
        
        // Obtiene datos de tipo RickAndMortyResponse desde la URL proporcionada.
        service.fetch(RickAndMortyResponse.self, url: url) { [unowned self] result in
            
            // En función del resultado de la solicitud, actualiza las propiedades isLoading, errorMessage y decodeResponse.
            // Si la solicitud tiene éxito, los datos se agregan al array characterArray o al objeto decodeResponse para un almacenamiento centralizado.
            DispatchQueue.main.async {
                self.isLoading = false
                switch result {
                case .failure(let error):
                    self.errorMessage = error.localizedDescription
                    print(error)
                case .success(let decodedResponse):
                    if let nextCharacterPage = decodedResponse.info?.next {
                        let nextURL = URL(string: nextCharacterPage)
                        
                        //Obtiene recursivamente datos de caracteres de la página siguiente.
                        self.getCharactersData(url: nextURL)
                    }
                    
                    if let results = decodedResponse.results {
                        if  self.decodeResponse == nil {
                            self.decodeResponse = decodedResponse
                        } else {
                            self.decodeResponse?.results?.append(contentsOf: results)
                        }
                    }
                }
            }
        }
    }
    
    
    //Metodos de ayuda de vista previa en un estado de error y de exito simulado.
    static func errorState() -> NetworkManager {
        let fetcher = NetworkManager()
        fetcher.errorMessage = APIError.url(URLError.init(.notConnectedToInternet)).localizedDescription
        return fetcher
    }
    
    
    static func successState() -> NetworkManager {
        let fetcher = NetworkManager()
        fetcher.characterArray = [CharacterResponse.createDefault()]
        return fetcher
    }
    
}
