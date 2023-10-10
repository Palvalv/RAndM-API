//
//  CharacterDetailView.swift
//  RickAndMortyAPI
//
//  Created by Pablo Álvarez on 10/10/23.
//

import SwiftUI

/**
 Muestra detalles específicos de un personaje escogido por el usuario.
 La vista incluye la imagen del personaje, su nombre y detalles adicionales como especie, tipo, género y ubicación.
 Estos detalles se organizan de manera ordenada en la vista para proporcionar información detallada sobre el personaje.
 */
struct CharacterDetailView: View {
    var character: CharacterResponse
    let imageSize: CGFloat = 150
    
    var body: some View {
            ScrollView {
                VStack(spacing: 20) {
                    ImageView(character: character)
                        .frame(width: imageSize, height: imageSize)
                    Text(character.name)
                        .font(.title)
                    VStack(alignment: .leading, spacing: 8) {
                        Text("Species: \(character.species)")
                        if character.type != "" {
                            Text("Type: \(character.type)")
                        }
                        Text("Gender: \(character.gender)")
                        Text("Location: \(character.location?.name ?? "Unknown")")
                    }
            }
                .padding()
                .overlay(CardGradient())
        }
    }
}

struct CharacterDetailView_Previews: PreviewProvider {
    static var previews: some View {
        CharacterDetailView(character: NetworkManager.successState().characterArray[0])
    }
}
