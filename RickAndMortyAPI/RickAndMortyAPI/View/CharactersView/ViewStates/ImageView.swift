//
//  ImageView.swift
//  RickAndMortyAPI
//
//  Created by Pablo Álvarez on 10/10/23.
//

import SwiftUI

/**
 Define una vista que se utiliza para mostrar una imagen de un personaje.
 La vista utiliza AsyncImage para cargar la imagen de forma asincrónica desde una URL.
 Si la imagen se carga correctamente, se muestra.
 Si hay un error al cargar la imagen, se intenta cargar una imagen predeterminada.
 Si no se puede cargar ninguna imagen, se muestra un indicador de progreso (ProgressView) en su lugar.
 */
struct ImageView: View {
    var character: CharacterResponse
    
    var body: some View {
        // La aplicación puede continuar ejecutando otras tareas mientras la imagen se descarga en segundo plano.
        // No se bloquea el hilo principal de la aplicación, permite que la interfaz de usuario siga siendo receptiva y que los usuarios puedan interactuar con la aplicación sin interrupciones.
        AsyncImage(url: URL(string: character.image)) { phase in
            if let image = phase.image {
                image
                    .resizable()
                    .modifier(ImageGridModifier())

            } else if phase.error != nil {
                AsyncImage(url: URL(string: Constants.defaultImage)) { phase in
                    if let image = phase.image {
                        image
                            .resizable()
                            .modifier(ImageGridModifier())
                    }
                }
            } else {
                ProgressView()
            }
        }
    }
}


struct ImageView_Previews: PreviewProvider {
    static var previews: some View {
        ImageView(character: NetworkManager.successState().characterArray[0])
    }
}
