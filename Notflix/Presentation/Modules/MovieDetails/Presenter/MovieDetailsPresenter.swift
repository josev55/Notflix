//
//  MovieDetailsPresenter.swift
//  Notflix
//
//  Created by Jose Vildosola on 21-06-22.
//
import Foundation

class MovieDetailsPresenter: MovieDetailsPresenterProtocol {
    var view: MovieDetailsViewProtocol?
    var movieDetailsUseCase: MovieDetailsUseCaseProtocol
    
    init(movieDetailsUseCase: MovieDetailsUseCaseProtocol) {
        self.movieDetailsUseCase = movieDetailsUseCase
    }
    
    func getMovieDetails(movieId: String) async throws {
        view?.showLoading()
        defer {
            DispatchQueue.main.async {
                self.view?.hideLoading()
            }
        }
        do {
            let movieDetails = try await movieDetailsUseCase.execute(movieId: movieId)
            let mappedMovieDetails = MovieDetailsModel(
                movieHomepageURL: URL(string: movieDetails.homepageLink)!,
                movieCoverImageURL: URL(string: movieDetails.coverImage)!,
                movieTagline: movieDetails.tagline,
                movieTitle: movieDetails.title,
                movieDescription: movieDetails.description
            )
            DispatchQueue.main.async {
                self.view?.showMovieDetails(movieDetails: mappedMovieDetails)
            }
            
        } catch {
            DispatchQueue.main.async {
                self.view?.getMovieDetailsFailed()
            }
        }
    }
}
