//
//  AppInfoView.swift
//  RickAndMortyAPI
//
//  Created by Pablo Álvarez on 10/10/23.
//

import SwiftUI

/**
 Muestra información sobre que el objetivo de la aplicación.
 La vista utiliza un VStack para organizar el contenido verticalmente y muestra un texto que se obtiene de los archivos de localización. 
 */
struct AppInfoView: View {
    var body: some View {
        VStack {
            Text(NSLocalizedString("view.about.appInfo", comment: ""))
                .modifier(InformationTextModifier())
        }
    }
}

struct AppInfoView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
