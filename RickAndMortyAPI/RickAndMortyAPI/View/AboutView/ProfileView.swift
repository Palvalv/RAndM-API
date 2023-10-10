//
//  ProfileView.swift
//  RickAndMortyAPI
//
//  Created by Pablo Álvarez on 10/10/23.
//

import SwiftUI

/**
 Muestra información sobre el perfil del desarrollador de la aplicación.
 La vista utiliza un VStack para organizar el contenido verticalmente y muestra un título de sección seguido de dos líneas de texto que contienen detalles como el perfil de LinkedIn y la dirección de correo electrónico del desarrollador.
 */
struct ProfileView: View {
    var body: some View {
        VStack(spacing: 10) {
            Text(NSLocalizedString("view.profile.infoHeader", comment: ""))
                .font(.callout.bold())
            
            VStack(spacing: 5) {
                Text(NSLocalizedString("view.profile.candidateLinkedin", comment: ""))
                Text(NSLocalizedString("view.profile.candidateMail", comment: ""))
            }
                .font(.caption)
        }
        .padding()
    }
        
}

struct ProfileView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileView()
    }
}
