//
//  MoviesListingCollectionViewDataSourceTests.swift
//  NotflixTests
//
//  Created by Jose Vildosola on 19-06-22.
//

import XCTest
@testable import Notflix

class MoviesListingCollectionViewDataSourceTests: XCTestCase {
    var collectionView: MockUICollectionView!
    var dataSource: MoviesListingCollectionViewDataSource!
    
    override func setUpWithError() throws {
        collectionView = MockUICollectionView(frame: .zero, collectionViewLayout: UICollectionViewFlowLayout())
        collectionView.register(MoviesListingCollectionViewCell.self, forCellWithReuseIdentifier: MoviesListingCollectionViewCell.typeName)
        dataSource = MoviesListingCollectionViewDataSource([], collectionView: collectionView)
    }
    
    func testShouldReturnCorrectNumberOfSections() {
        // Act
        let numbersOfSections = dataSource.numberOfSections(in: collectionView)
        
        // Assert
        XCTAssertEqual(numbersOfSections, 1)
    }
    
    func testShouldReturnCorrectNumberOfItems() {
        // Arrange
        dataSource.movies = [1, 2, 3, 4]
        
        // Act
        let numberOfItems = dataSource.collectionView(collectionView, numberOfItemsInSection: 0)
        
        // Assert
        XCTAssertEqual(numberOfItems, 4)
    }
    
    func testShouldReturnCorrectTypeOfCell() {
        // Act
        let cell = dataSource.collectionView(collectionView, cellForItemAt: IndexPath(row: 0, section: 0))
        
        // Assert
        XCTAssertNotNil(cell as? MoviesListingCollectionViewCell)
        
    }
    
    func testDidReloadDataOnMoviesSet() {
        // Act
        dataSource.movies = [1, 2]
        
        // Assert
        XCTAssertTrue(collectionView.didCallReloadData)
    }

    override func tearDownWithError() throws {
        collectionView = nil
    }
}

class MockUICollectionView: UICollectionView {
    var didCallReloadData = false
    
    override func reloadData() {
        self.didCallReloadData = true
    }
}
