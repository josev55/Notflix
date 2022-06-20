//
//  MoviesListingCollectionViewDelegateFlowLayout.swift
//  Notflix
//
//  Created by Jose Vildosola on 19-06-22.
//

import UIKit

class MoviesListingCollectionViewDelegateFlowLayout: NSObject, UICollectionViewDelegateFlowLayout {
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
