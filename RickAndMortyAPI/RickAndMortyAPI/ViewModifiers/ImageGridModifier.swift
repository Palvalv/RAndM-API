//
//  ImageGridModifier.swift
//  RickAndMortyAPI
//
//  Created by Pablo Álvarez on 10/10/23.
//

import SwiftUI

/**
 Define un modificador de vista llamado ImageGridModifier que se utiliza para dar formato y estilo específicos a las imágenes que se muestran en una cuadrícula en la aplicación.
 Esto incluye asegurarse de que las imágenes se escalen y ajusten correctamente dentro de cuadros de 130x130 puntos sin distorsionarlas.
 */
struct ImageGridModifier: ViewModifier {
    func body(content: Content) -> some View {
        content
            .scaledToFit()
            .frame(width: 130, height: 130)
    }
    
}
