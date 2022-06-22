//
//  MoviesListingPresenter.swift
//  Notflix
//
//  Created by Jose Vildosola on 19-06-22.
//
import UIKit

class MoviesListingPresenter: MoviesListingPresenterProtocol {
    var view: MoviesListingViewProtocol?
    var trendingMoviesUseCase: TrendingMoviesUseCaseProtocol
    var coordinator: Coordinator?
    
    init(trendingMoviesUseCase: TrendingMoviesUseCaseProtocol) {
        self.trendingMoviesUseCase = trendingMoviesUseCase
    }
    
    func getTrendingMovies() async {
        view?.showLoading()
        defer {
            // We dispatch this in the main queue because of async method is executed on background thread and it modifies the UI 
            DispatchQueue.main.async {
                self.view?.hideLoading()
            }
        }
        
        do {
            let movies = try await trendingMoviesUseCase.execute()
            let mappedMovies = movies.trendingMovies.map({
                MovieModel(movieId: $0.movieId, imageUrl: URL(string: $0.movieImage)!, title: $0.movieTitle, rating: String(format: "%@⭐️", $0.movieRating))
            })
            view?.showTrendingMovies(movies: mappedMovies)
        } catch {
            view?.getTrendingMoviesFailed(errorMessage: "Error al cargar el listado de peliculas")
        }
    }
    
    func showMovieDetails(movieId: String) {
        coordinator?.showMovieDetails(movieId: movieId)
    }
}
