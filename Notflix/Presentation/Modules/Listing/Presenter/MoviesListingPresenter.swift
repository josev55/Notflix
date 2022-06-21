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
    
    init(trendingMoviesUseCase: TrendingMoviesUseCaseProtocol) {
        self.trendingMoviesUseCase = trendingMoviesUseCase
    }
    
    func getTrendingMovies() async {
        view?.showLoading()
        defer {
            DispatchQueue.main.async {
                self.view?.hideLoading()
            }
        }
        
        do {
            let movies = try await trendingMoviesUseCase.execute()
            let mappedMovies = movies.trendingMovies.map({
                MovieModel(imageUrl: URL(string: $0.movieImage)!, title: $0.movieTitle, rating: String(format: "%@⭐️", $0.movieRating))
            })
            view?.showTrendingMovies(movies: mappedMovies)
        } catch {
            view?.getTrendingMoviesFailed(errorMessage: "Error al cargar el listado de peliculas")
        }
    }
}
