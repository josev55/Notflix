//
//  MoviesListingViewProtocol.swift
//  Notflix
//
//  Created by Jose Vildosola on 19-06-22.
//

protocol MoviesListingViewProtocol {
    func showLoading()
    func hideLoading()
    func showTrendingMovies(movies: [MovieModel])
    func getTrendingMoviesFailed(errorMessage: String)
}
