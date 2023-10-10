//
//  GridModifier.swift
//  RickAndMortyAPI
//
//  Created by Pablo Álvarez on 10/10/23.
//

import SwiftUI

/**
 Define un modificador de vista llamado GridModifier que se utiliza para aplicar un estilo a las vistas que forman parte de una cuadrícula en la aplicación.
 Este estilo incluye agregar espacio de relleno vertical y establecer un tamaño fijo para las vistas en la cuadrícula.
 */
struct GridModifier: ViewModifier {
    func body(content: Content) -> some View {
        content
            .padding(.vertical)
            .frame(width: 170, height: 200)
    }
}
