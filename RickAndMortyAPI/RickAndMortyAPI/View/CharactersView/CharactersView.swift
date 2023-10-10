//
//  CharactersView.swift
//  RickAndMortyAPI
//
//  Created by Pablo Álvarez on 10/10/23.
//

import SwiftUI

/**
 Define la vista llamada CharactersView que se utiliza para mostrar la lista de personajes.
 Gestiona el estado de carga, los errores y la visualización de la lista de personajes, dependiendo de la información proporcionada por el networkManager.
 */
struct CharactersView: View {
    // La anotación @StateObject declara y gestiona objetos observables que controlan el estado de una vista.
    @StateObject var networkManager = NetworkManager()
    
    var body: some View {
        VStack {
            // Si la vista está en proceso de cargar datos desde la red, muestra la vista LoadingView().
            if networkManager.isLoading {
                LoadingView()
            // Si ha ocurrido un error al cargar los datos desde la red y se muestra la vista de ErrorView().
            } else if networkManager.errorMessage != nil {
                ErrorView(networkManager: networkManager)
            } else {
            // Si ninguna de las condiciones anteriores se cumple, se muestra una vista llamada CharactersListView que muestra la lista de personajes.
            // La lista de personajes se obtiene desde networkManager.decodeResponse?.results, decodificada correctamente una respuesta de la API y extraído los resultados.
                CharactersListView(characters: networkManager.decodeResponse?.results ?? [])
            }
        }
    }
        
}

struct CharactersView_Previews: PreviewProvider {
    static var previews: some View {
        CharactersView()
    }
}
