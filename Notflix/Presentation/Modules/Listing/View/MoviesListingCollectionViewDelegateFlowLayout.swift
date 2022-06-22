//
//  MoviesListingCollectionViewDelegateFlowLayout.swift
//  Notflix
//
//  Created by Jose Vildosola on 19-06-22.
//

import UIKit

class MoviesListingCollectionViewDelegateFlowLayout: NSObject, UICollectionViewDelegateFlowLayout {
    var presenter: MoviesListingPresenterProtocol?
    var dataSource: [MovieModel]?
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        guard let flowLayout = collectionViewLayout as? UICollectionViewFlowLayout else { return CGSize(width: 0, height: 0) }
        let interItemSpacing = flowLayout.minimumInteritemSpacing
        let leftInset = flowLayout.sectionInset.left
        let rightInset = flowLayout.sectionInset.right
        let cellSpacing =  interItemSpacing + leftInset + rightInset
        let cellWidth = (collectionView.bounds.size.width - cellSpacing) / 2
        let cellHeight = cellWidth * 1.4
        return CGSize(width: cellWidth, height: cellHeight)
    }
}

// Extension for delegate methods
extension MoviesListingCollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        guard let movie = dataSource?[indexPath.row] else { return }
        
        presenter?.showMovieDetails(movieId: movie.movieId)
    }
}
