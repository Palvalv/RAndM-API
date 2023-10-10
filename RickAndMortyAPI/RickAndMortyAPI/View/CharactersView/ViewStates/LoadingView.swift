//
//  LoadingView.swift
//  RickAndMortyAPI
//
//  Created by Pablo Álvarez on 10/10/23.
//

import SwiftUI

/**
 Muestra una pantalla de carga durante la ejecución de operaciones que requieren tiempo, como la carga de datos.
 Esta vista muestra una imagen de "Morty" y un mensaje de carga localizado, proporcionando una experiencia visual al usuario mientras espera que se completen las operaciones.
 */
struct LoadingView: View {
    
    var body: some View {
        VStack {
            Image("MortyFace")
                .resizable()
                .scaledToFit()
                .frame(width: 80)
            
            Text(NSLocalizedString("isLoading.true.characters", comment: ""))
                .modifier(InformationTextModifier())
        
        }
    }
}


struct LoadingView_Previews: PreviewProvider {
    static var previews: some View {
        LoadingView()
    }
}
