//
//  Genre.swift
//  movielist
//
//  Created by Igor Pino de Souza on 06/05/21.
//

import Foundation


struct genreArray: Codable {
    let genres: [Genre]
}

struct Genre: Codable {
    let id: Int
    let name: String
}

