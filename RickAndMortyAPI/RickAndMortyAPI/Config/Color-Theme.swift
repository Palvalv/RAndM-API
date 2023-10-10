//
//  Color-Theme.swift
//  RickAndMortyAPI
//
//  Created by Pablo Álvarez on 10/10/23.
//

import SwiftUI

/**
 Representan colores específicos y personalizados que se utilizan en la interfaz de usuario de la aplicación.
 Se definen como constantes para que puedan reutilizarse en toda la aplicación, lo que facilita el mantenimiento y la consistencia de los colores..
 */
extension ShapeStyle where Self == Color {
    static var darkGreenBackground: Color {
        Color(red: 0, green: 0.3, blue: 0)
    }
    
    static var mediumGreenBackground: Color {
        Color(red: 0, green: 0.5, blue: 0.2)
    }
    
    static var lightGreenBackground: Color {
        Color(red: 0, green: 0.7, blue: 0.1)
    }
    
    static var lightBlueBackground: Color {
        Color(red: 0, green: 0.7, blue: 0.7)
    }
    
    static var lightBackground: Color {
        Color(red: 0.2, green: 0.2, blue: 0.3)
    }
    
    static var darkBlueBackground: Color {
        Color(red: 0, green: 0.2, blue: 0.3)
    }
    
}
