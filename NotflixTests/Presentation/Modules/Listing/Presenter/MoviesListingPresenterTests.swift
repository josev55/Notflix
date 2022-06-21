//
//  MoviesListingPresenterTests.swift
//  NotflixTests
//
//  Created by Jose Vildosola on 20-06-22.
//

import XCTest
@testable import Notflix

class MoviesListingPresenterTests: XCTestCase {
    var presenter: MoviesListingPresenter!
    var moviesListingView: MoviesListingViewMock!

    override func setUpWithError() throws {
        presenter = MoviesListingPresenter()
        moviesListingView = MoviesListingViewMock()
        presenter.view = moviesListingView
    }
    
    func testGetTrendingMoviesSucceed() {
        // Act
        presenter.getTrendingMovies()
        
        // Assert
        XCTAssertTrue(moviesListingView.didCallShowLoading)
        XCTAssertTrue(moviesListingView.didCallShowTrendingMovies)
        XCTAssertTrue(moviesListingView.didCallHideLoading)
    }

    override func tearDownWithError() throws {
        presenter = nil
        moviesListingView = nil
    }
}

class MoviesListingViewMock: MoviesListingViewProtocol {
    var didCallShowLoading = false
    var didCallHideLoading = false
    var didCallGetTrendingMoviesFailed = false
    var didCallShowTrendingMovies = false

    func showLoading() {
        didCallShowLoading = true
    }
    
    func hideLoading() {
        didCallHideLoading = true
    }
    
    func getTrendingMoviesFailed(errorMessage: String) {
        didCallGetTrendingMoviesFailed = true
    }
    
    func showTrendingMovies(movies: [MovieModel]) {
        didCallShowTrendingMovies = true
    }
}
