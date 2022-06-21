//
//  TrendingMoviesUseCase.swift
//  Notflix
//
//  Created by Jose Vildosola on 20-06-22.
//

protocol TrendingMoviesUseCaseProtocol {
    func execute() async throws -> TrendingMoviesEntity
}

final class TrendingMoviesUseCase {
    private let moviesRepository: MoviesRepositoryProtocol
    
    init(moviesRepository: MoviesRepositoryProtocol) {
        self.moviesRepository = moviesRepository
    }
}

extension TrendingMoviesUseCase: TrendingMoviesUseCaseProtocol {
    func execute() async throws -> TrendingMoviesEntity {
        let trendingMovies = try await moviesRepository.getTrendingMovies()
        let mappedTrendingMovies = trendingMovies.results.map({
            TrendingMovieEntity(movieId: String($0.id), movieTitle: $0.originalTitle, movieImage: String(format: "%@%@", SharedConfig.instance.tmdbImageBaseUrl, $0.posterPath), movieRating: String($0.voteAverage))
        })

        return TrendingMoviesEntity(trendingMovies: mappedTrendingMovies)
    }
}
