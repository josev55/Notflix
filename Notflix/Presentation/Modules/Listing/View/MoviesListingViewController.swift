//
//  MoviesListingViewController.swift
//  Notflix
//
//  Created by Jose Vildosola on 18-06-22.
//

import UIKit

class MoviesListingViewController: UIViewController {
    weak var moviesCollectionView: UICollectionView!
    var collectionViewDataSource: MoviesListingCollectionViewDataSource!
    var collectionViewDelegateFlowLayout: MoviesListingCollectionViewDelegateFlowLayout!
    var presenter: MoviesListingPresenterProtocol?
    var coordinator: Coordinator?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        moviesCollectionView.register(MoviesListingCollectionViewCell.self, forCellWithReuseIdentifier: MoviesListingCollectionViewCell.typeName)
        collectionViewDataSource = MoviesListingCollectionViewDataSource([], collectionView: self.moviesCollectionView)
        collectionViewDelegateFlowLayout = MoviesListingCollectionViewDelegateFlowLayout()
        collectionViewDelegateFlowLayout.dataSource = collectionViewDataSource.movies
        collectionViewDelegateFlowLayout.presenter = presenter
        moviesCollectionView.dataSource = collectionViewDataSource
        moviesCollectionView.delegate = collectionViewDelegateFlowLayout
        self.title = "Trending"
        presenter?.view = self
        Task {
            do {
                try await presenter?.getTrendingMovies()
            } catch {
                // TODO: Handle unhandled error with an error view
            }
        }
    }

    override func loadView() {
        super.loadView()
        loadCollectionUI()
    }
}
