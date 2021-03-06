//
//  results.swift
//  movielist
//
//  Created by Igor Pino de Souza on 04/05/21.
//

import Foundation

struct results: Codable {
    let movies: [Movie]
    
    enum CodingKeys: String, CodingKey {
            case movies = "results"
        }

}

