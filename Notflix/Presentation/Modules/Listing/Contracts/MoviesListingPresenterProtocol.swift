//
//  MoviesListingPresenterProtocol.swift
//  Notflix
//
//  Created by Jose Vildosola on 19-06-22.
//
protocol MoviesListingPresenterProtocol {
    var view: MoviesListingViewProtocol? { get set }
    func getTrendingMovies() async throws
}
