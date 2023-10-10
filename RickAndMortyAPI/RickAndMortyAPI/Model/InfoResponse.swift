//
//  InfoResponse.swift
//  RickAndMortyAPI
//
//  Created by Pablo Álvarez on 10/10/23.
//

import UIKit
import Combine

/**
 Representa información general relacionada con la respuesta de la API que facilita la decodificación y el manejo de esta información.
 */
struct InfoResponse: Codable, Equatable {
    var count: Int
    var pages: Int
    var next: String?
    var prev: String?
    
}
