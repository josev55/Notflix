//
//  MoviesListingViewControllerUIExtension.swift
//  Notflix
//
//  Created by Jose Vildosola on 18-06-22.
//
import UIKit

extension MoviesListingViewController {
    func loadCollectionUI() {
        let layout = UICollectionViewFlowLayout()
        layout.minimumInteritemSpacing = 8.0
        layout.sectionInset = UIEdgeInsets(top: 8, left: 8, bottom: 8, right: 8)

        let cv = UICollectionView(frame: .zero, collectionViewLayout: layout)
        cv.translatesAutoresizingMaskIntoConstraints = false
        cv.showsVerticalScrollIndicator = false
        cv.showsHorizontalScrollIndicator = false

        view.addSubview(cv)

        NSLayoutConstraint.activate([
            cv.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            cv.topAnchor.constraint(equalTo: view.topAnchor),
            cv.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            cv.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])

        moviesCollectionView = cv
    }
}
