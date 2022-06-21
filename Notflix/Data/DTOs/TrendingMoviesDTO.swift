//
//  TrendingMoviesDTO.swift
//  Notflix
//
//  Created by Jose Vildosola on 20-06-22.
//

import Foundation

struct TrendingMoviesDTO: Decodable {
    let results: [TrendingMovieDTO]
}
