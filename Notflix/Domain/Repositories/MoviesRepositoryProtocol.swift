//
//  MoviesRepositoryProtocol.swift
//  Notflix
//
//  Created by Jose Vildosola on 20-06-22.
//

protocol MoviesRepositoryProtocol {
    func getTrendingMovies() async throws -> TrendingMoviesDTO
}
