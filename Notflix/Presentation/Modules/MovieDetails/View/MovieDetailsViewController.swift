//
//  MovieDetailsViewController.swift
//  Notflix
//
//  Created by Jose Vildosola on 21-06-22.
//

import UIKit

class MovieDetailsViewController: UIViewController {
    weak var playerContainer: UIView!
    weak var playButton: UIImageView!
    weak var thumbnailImageView: UIImageView!
    weak var titleLabel: UILabel!
    weak var tagLineLabel: UILabel!
    weak var homepageButton: UIButton!
    weak var descriptionTextView: UITextView!
    var presenter: MovieDetailsPresenterProtocol?
    var movieId: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.navigationBar.prefersLargeTitles = false
        self.title = "Movie Details"
        presenter?.view = self
        Task {
            if let movieId = movieId {
                do {
                    try await self.presenter?.getMovieDetails(movieId: movieId)
                } catch {
                    // TODO: Handle unhandled error with an error view
                }
            }
        }
    }
    
    override func loadView() {
        super.loadView()
        view.backgroundColor = .white
        setupPlayerContainer()
        setupThumbnailImageView()
        setupPlayImageView()
        setupTitleLabel()
        setupTagLineLabel()
        setupHomepageButton()
        setupDescriptionView()
    }
}
