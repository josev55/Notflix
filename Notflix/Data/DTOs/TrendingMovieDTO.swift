//
//  MovieDTO.swift
//  Notflix
//
//  Created by Jose Vildosola on 20-06-22.
//

import Foundation

struct TrendingMovieDTO: Decodable {
    let id: Int
    let originalTitle: String
    let posterPath: String
    let voteAverage: Double
}
