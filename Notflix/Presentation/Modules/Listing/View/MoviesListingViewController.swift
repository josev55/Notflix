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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        moviesCollectionView.register(MoviesListingCollectionViewCell.self, forCellWithReuseIdentifier: MoviesListingCollectionViewCell.typeName)
        collectionViewDataSource = MoviesListingCollectionViewDataSource([], collectionView: self.moviesCollectionView)
        collectionViewDelegateFlowLayout = MoviesListingCollectionViewDelegateFlowLayout()
        moviesCollectionView.dataSource = collectionViewDataSource
        moviesCollectionView.delegate = collectionViewDelegateFlowLayout
        
        presenter?.view = self
        Task {
            do {
                try await presenter?.getTrendingMovies()
            } catch {
                
            }
        }
    }

    override func loadView() {
        super.loadView()
        loadCollectionUI()
    }
}
