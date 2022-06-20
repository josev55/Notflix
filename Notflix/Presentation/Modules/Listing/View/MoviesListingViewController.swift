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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        moviesCollectionView.register(MoviesListingCollectionViewCell.self, forCellWithReuseIdentifier: MoviesListingCollectionViewCell.typeName)
        collectionViewDataSource = MoviesListingCollectionViewDataSource([1, 2, 3, 4, 5], collectionView: self.moviesCollectionView)
        collectionViewDelegateFlowLayout = MoviesListingCollectionViewDelegateFlowLayout()
        moviesCollectionView.dataSource = collectionViewDataSource
        moviesCollectionView.delegate = collectionViewDelegateFlowLayout
    }

    override func loadView() {
        super.loadView()
        loadCollectionUI()
    }
}
