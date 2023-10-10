//
//  Location.swift
//  RickAndMortyAPI
//
//  Created by Pablo Álvarez on 10/10/23.
//

import UIKit
import Combine

/**
 Representa información sobre la ubicación de un personaje.
 */
struct Location: Codable, Hashable {
    var name: String?
    var url: String?
    
}
