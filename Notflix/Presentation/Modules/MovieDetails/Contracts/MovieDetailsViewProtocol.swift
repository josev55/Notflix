//
//  MovieDetailsViewProtocol.swift
//  Notflix
//
//  Created by Jose Vildosola on 21-06-22.
//

protocol MovieDetailsViewProtocol {
    func showLoading()
    func hideLoading()
    func showMovieDetails(movieDetails: MovieDetailsModel)
    func getMovieDetailsFailed()
}
