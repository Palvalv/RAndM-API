//
//  RickAndMortyAPIApp.swift
//  RickAndMortyAPI
//
//  Created by Pablo Álvarez on 10/10/23.
//

import SwiftUI

/**
 Define la estructura principal de la aplicación, crea una ventana con una vista principal ContentView y establece un esquema de color oscuro como preferido.
 Esta estructura define cómo se inicia la aplicación y cuál es su vista principal.
 */
@main
struct RickAndMortyAPIApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
                .preferredColorScheme(.dark)
        }
    }
}
