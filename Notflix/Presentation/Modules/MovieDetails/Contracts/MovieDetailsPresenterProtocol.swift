//
//  MovieDetailsPresenterProtocol.swift
//  Notflix
//
//  Created by Jose Vildosola on 21-06-22.
//

protocol MovieDetailsPresenterProtocol {
    var view: MovieDetailsViewProtocol? { get set }
    func getMovieDetails(movieId: String) async throws
}
