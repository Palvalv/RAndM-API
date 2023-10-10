//
//  BackgroundImageModifier.swift
//  RickAndMortyAPI
//
//  Created by Pablo Álvarez on 10/10/23.
//

import SwiftUI

/**
 Define un modificador de vista llamado BackgroundImageModifier que se utiliza para escalar y ajustar el tamaño de las imágenes de fondo en la aplicación para que llenen el espacio disponible sin distorsionarse.
 Limita el ancho de la imagen de fondo a 500 puntos.
 Este modificador se utiliza para dar formato y estilo específicos a las vistas que representan imágenes de fondo en la aplicación.
 */
struct BackgroundImageModifier: ViewModifier {
    func body(content: Content) -> some View {
        content
            .scaledToFill()
            .frame(width: 500)
    }
}
