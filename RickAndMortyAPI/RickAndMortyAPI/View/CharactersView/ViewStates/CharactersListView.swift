//
//  CharactersListView.swift
//  RickAndMortyAPI
//
//  Created by Pablo Álvarez on 10/10/23.
//

import SwiftUI

/**
 Muestra la lista de personajes que se organizan en una cuadrícula vertical que admite desplazamiento y cada elemento de la cuadrícula es un enlace de navegación a una vista de detalle del personaje.
 Cada celda de la cuadrícula incluye una imagen y el nombre del personaje, y se aplican modificadores para dar estilo y decoración a la vista.
 */
struct CharactersListView: View {
    var characters: [CharacterResponse]
    let imageSize: CGFloat = 100
    
    let colums = [GridItem(.adaptive(minimum: 150))]
    
    var body: some View {
            ScrollView {
                LazyVGrid(columns: colums, spacing: 30)  {
                    ForEach(characters) { character in
                        NavigationLink {
                            CharacterDetailView(character: character)
                        } label: {
                            VStack(spacing: 20) {
                                    ImageView(character: character)
                                        .frame(width: imageSize, height: imageSize)
                                       
                                    Text(character.name)
                                        .font(.headline)
                                        .foregroundColor(.white)
                            }
                        }
                }
                    .modifier(GridModifier())
                    .overlay(CardGradient())
            }
              
        }
    }
}


struct CharactersListView_Previews: PreviewProvider {
    static var previews: some View {
        CharactersListView(characters: NetworkManager.successState().characterArray)
    }
}
