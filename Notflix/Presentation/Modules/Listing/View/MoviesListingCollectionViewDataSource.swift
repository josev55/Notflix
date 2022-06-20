//
//  MoviesListingCollectionViewDataSource.swift
//  Notflix
//
//  Created by Jose Vildosola on 18-06-22.
//

import UIKit

class MoviesListingCollectionViewDataSource: NSObject, UICollectionViewDataSource {
    weak var collectionView: UICollectionView!
    var movies: [Any] {
        didSet {
            collectionView.reloadData()
        }
    }
    
    init(_ movies: [Any], collectionView: UICollectionView) {
        self.movies = movies
        self.collectionView = collectionView
    }
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return movies.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: MoviesListingCollectionViewCell.typeName, for: indexPath) as? MoviesListingCollectionViewCell ?? UICollectionViewCell()
        cell.backgroundColor = .red
        return cell
    }
}
