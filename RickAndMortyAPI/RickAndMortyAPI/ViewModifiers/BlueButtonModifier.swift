//
//  BlueButtonModifier.swift
//  RickAndMortyAPI
//
//  Created by Pablo Álvarez on 10/10/23.
//

import SwiftUI

/**
 Define un modificador de vista llamado BlueButtonModifier que se utiliza para dar estilo a un botón en la aplicación.
 Esto incluye establecer un ancho fijo, agregar espacio de relleno, establecer un fondo de color, redondear las esquinas y agregar una sombra al botón.
 */
struct BlueButtonModifier: ViewModifier {
    func body(content: Content) -> some View {
        content
            .frame(width: 270)
            .padding()
            .background(.darkBlueBackground)
            .clipShape(RoundedRectangle(cornerRadius: 10))
            .shadow(color: .lightBlueBackground, radius: 6)
    }
}
