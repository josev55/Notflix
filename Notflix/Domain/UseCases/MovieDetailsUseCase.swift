//
//  MovieDetailsUseCase.swift
//  Notflix
//
//  Created by Jose Vildosola on 21-06-22.
//

import Foundation

protocol MovieDetailsUseCaseProtocol {
    func execute(movieId: String) async throws -> MovieDetailsEntity
}

final class MovieDetailsUseCase {
    private let moviesRepository: MoviesRepositoryProtocol
    
    init(moviesRepository: MoviesRepositoryProtocol) {
        self.moviesRepository = moviesRepository
    }
}

extension MovieDetailsUseCase: MovieDetailsUseCaseProtocol {
    func execute(movieId: String) async throws -> MovieDetailsEntity {
        let movieDetails = try await moviesRepository.getMovieDetailsFor(movieId: movieId)
        
        return MovieDetailsEntity(
            homepageLink: movieDetails.homepage,
            coverImage: String(format: "%@%@", SharedConfig.instance.tmdbImageBaseUrl, movieDetails.backdropPath),
            tagline: movieDetails.tagline,
            title: movieDetails.title,
            description: movieDetails.overview
        )
    }
}
