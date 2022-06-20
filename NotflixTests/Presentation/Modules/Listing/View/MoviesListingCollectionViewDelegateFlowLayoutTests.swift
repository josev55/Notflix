//
//  MoviesListingCollectionViewDelegateFlowLayoutTest.swift
//  NotflixTests
//
//  Created by Jose Vildosola on 19-06-22.
//

import XCTest
@testable import Notflix

class MoviesListingCollectionViewDelegateFlowLayoutTests: XCTestCase {
    var flowLayout: UICollectionViewLayout!
    var collectionView: UICollectionView!
    var collectionViewDelegateFlowLayout: MoviesListingCollectionViewDelegateFlowLayout!
    
    override func setUpWithError() throws {
        flowLayout = UICollectionViewFlowLayout()
        collectionViewDelegateFlowLayout = MoviesListingCollectionViewDelegateFlowLayout()
        collectionView = UICollectionView(frame: CGRect(x: 0, y: 0, width: 320, height: 500), collectionViewLayout: flowLayout)
        collectionView.delegate = collectionViewDelegateFlowLayout
    }
    
    func testFlowLayoutDidCalculateCorrectSizeForItemWithSpacingDimensions() {
        // Arrange
        guard let layout = flowLayout as? UICollectionViewFlowLayout else { return }
        layout.minimumInteritemSpacing = 10
        layout.sectionInset = UIEdgeInsets(top: 0, left: 10, bottom: 0, right: 10)
        
        // Act
        let itemSize = collectionViewDelegateFlowLayout.collectionView(collectionView, layout: flowLayout, sizeForItemAt: IndexPath(row: 0, section: 0))
        
        // Assert
        XCTAssertEqual(itemSize.width, 145)
        XCTAssertEqual(itemSize.height, 145 * 1.4)
    }
    
    func testFlowLayoutDidCalculateCorrectSizeForItemWithoutSpacingDimensions() {
        // Act
        let itemSize = collectionViewDelegateFlowLayout.collectionView(collectionView, layout: flowLayout, sizeForItemAt: IndexPath(row: 0, section: 0))
        
        // Assert
        XCTAssertEqual(itemSize.width, 155)
        XCTAssertEqual(itemSize.height, 155 * 1.4)
    }

    override func tearDownWithError() throws {
        flowLayout = nil
        collectionView = nil
    }
}
