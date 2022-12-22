//
//  results.swift
//  movielist
//
//  Created by Igor Pino de Souza on 04/05/21.
//

import Foundation

struct APICallResult: Codable {
    let movies: [Movie]
    let totalPages: Int
    let totalResults: Int
    
    enum CodingKeys: String, CodingKey {
            case movies = "results"
            case totalPages = "total_pages"
            case totalResults = "total_results"
        }

}

