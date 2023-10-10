//
//  ErrorView.swift
//  RickAndMortyAPI
//
//  Created by Pablo Álvarez on 10/10/23.
//

import SwiftUI

/**
 Muestra un mensaje de error y un botón de "intentar de nuevo" en caso de que ocurra un error durante la carga de datos desde una red.
 La vista muestra el mensaje de error, una imagen y un botón interactivo para permitir que el usuario intente nuevamente la operación que falló.
 */
struct ErrorView: View {
    @ObservedObject var networkManager: NetworkManager
    
    var body: some View {
            VStack {
                Image("kisspngSickSancheza")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 100, height: 140)
                
                Text(networkManager.errorMessage ?? NSLocalizedString("error.message.generic", comment: ""))
                    .foregroundColor(.black)
                    .modifier(InformationTextModifier())
                    
                Button {
                    networkManager.getCharactersData(url: URL(string: networkManager.getCharactersUrl(urlProvider: URLProvider())))
                } label: {
                    Text(NSLocalizedString("button.tryAgain", comment: ""))
                        .font(Font.body.bold())
                        .foregroundColor(.white)
                        .modifier(BoxBackground())
                }
                .padding()
            }
        .background(
            Image("GreenBackground")
                .renderingMode(.original)
                .resizable()
                .modifier(BackgroundImageModifier())
                .edgesIgnoringSafeArea(.all)
                
        )
        .modifier(BoxBackground())
    }
        
    
}

struct ErrorView_Previews: PreviewProvider {
    static var previews: some View {
//        ErrorView()
        ErrorView(networkManager: NetworkManager())
    }
}
