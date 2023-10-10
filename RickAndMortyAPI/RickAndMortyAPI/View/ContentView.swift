//
//  ContentView.swift
//  RickAndMortyAPI
//
//  Created by Pablo Álvarez on 10/10/23.
//

import SwiftUI

/**
 Define la vista principal de la aplicación, esta contiene imágenes, botones y enlaces de navegación para permitir que el usuario interactúe con la aplicación y navegue a otras vistas.
 Utiliza GeometryReader para adaptarse al tamaño de la pantalla y presenta un fondo con una imagen de fondo y un color semi-transparente.
 */
struct ContentView: View {
    var body: some View {
        // Obtener información sobre la vista, su tamaño y posición en la pantalla con el objetivo de hacer que la vista sea sensible al tamaño de la pantalla y al dispositivo en el que se ejecuta la aplicación.
        GeometryReader { geometry in
            NavigationView {
                VStack(spacing: 55) {
                        Image("imgC1")
                            .resizable()
                            .scaledToFill()
                            .frame(maxWidth: geometry.size.width)
                    
                    VStack(spacing: 10) {
                        NavigationLink {
                            CharactersView()
                        } label: {
                            Text(NSLocalizedString("button.mainView.characters", comment: ""))
                        }
                        .modifier(BlueButtonModifier())
                        
                        NavigationLink {
                            AboutView()
                        } label: {
                            Text(NSLocalizedString("button.mainView.about", comment: ""))
                        }
                        .modifier(BlueButtonModifier())
                        .padding()
                        Spacer()
                    }
                    
                    Image("Rick-and-Morty")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 280)
                        .padding()
                    
                }
                .frame(width: geometry.size.width, height: geometry.size.height)
                
                .background(.black.opacity(0.1))
                .background(
                    Image("DarkStarsSky")
                        .renderingMode(.original)
                        .resizable()
                        .scaledToFill()
                        .edgesIgnoringSafeArea(.bottom)
                    
                )
            }
           
        }
        
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
