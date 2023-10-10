//
//  InformationTextModifier.swift
//  RickAndMortyAPI
//
//  Created by Pablo Álvarez on 10/10/23.
//

import SwiftUI

/**
 Define un modificador de vista llamado InformationTextModifier que se utiliza para centrar el texto y agregar un espacio de relleno alrededor del contenido de texto en las vistas en las que se aplica.
 Este modificador se utiliza para dar formato y estilo específicos a las vistas de texto que muestran información en la aplicación.
 */
struct InformationTextModifier: ViewModifier {
    func body(content: Content) -> some View {
        content
            .multilineTextAlignment(.center)
            .padding(30)
    }
}

