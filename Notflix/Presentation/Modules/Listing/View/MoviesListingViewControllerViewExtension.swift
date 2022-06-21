//
//  MoviesListingViewControllerViewExtension.swift
//  Notflix
//
//  Created by Jose Vildosola on 20-06-22.
//

import UIKit

extension MoviesListingViewController: MoviesListingViewProtocol {
    func showLoading() {
        DispatchQueue.main.async {
            LoadingView.shared.showLoadingIn(self.view)
        }
    }
    
    func hideLoading() {
        DispatchQueue.main.async {
            LoadingView.shared.removeLoadingView()
        }
    }
    
    func showTrendingMovies(movies: [MovieModel]) {
        DispatchQueue.main.async {
            self.collectionViewDataSource.movies = movies
        }
    }
    
    func getTrendingMoviesFailed(errorMessage: String) {
        
    }
    
    
}
