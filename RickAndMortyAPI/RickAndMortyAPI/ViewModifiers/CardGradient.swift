//
//  CardGradient.swift
//  RickAndMortyAPI
//
//  Created by Pablo Álvarez on 10/10/23.
//

import SwiftUI

/**
 Define un gradiente de colores utilizado para decorar el fondo del componente de tarjeta en la aplicación.
 Este gradiente se crea utilizando dos colores y se aplica al borde del rectángulo que representa la tarjeta.
 */
struct CardGradient: View {
    var myGradient = Gradient(
        colors: [
            .lightBlueBackground,
            .lightGreenBackground
        ]
    )
    
    var body: some View {
        Rectangle()
            .stroke(
                LinearGradient(
                    gradient: myGradient,
                    startPoint: .leading,
                    endPoint: .trailing
                ),
                lineWidth: 3
            )
    }
}
