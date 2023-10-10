//
//  BoxBackground.swift
//  RickAndMortyAPI
//
//  Created by Pablo Álvarez on 10/10/23.
//

import SwiftUI

/**
 Define un modificador de vista llamado BoxBackground que se utiliza para dar estilo a una vista, como un botón o un cuadro de texto, en la aplicación.
 Esto incluye agregar espacio de relleno, establecer un fondo de color, redondear las esquinas y agregar una sombra a la vista.
 */
struct BoxBackground: ViewModifier {
    func body(content: Content) -> some View {
        content
            .padding()
            .background(.darkGreenBackground)
            .clipShape(RoundedRectangle(cornerRadius: 20))
            .shadow(color: .black, radius: 2)
    }
}
