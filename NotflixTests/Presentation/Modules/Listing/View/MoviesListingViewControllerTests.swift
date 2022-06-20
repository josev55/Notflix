//
//  MoviesListingViewControllerTests.swift
//  NotflixTests
//
//  Created by Jose Vildosola on 19-06-22.
//

import XCTest
@testable import Notflix

class MoviesListingViewControllerTests: XCTestCase {
    var viewController: MoviesListingViewController!
    

    override func setUpWithError() throws {
        viewController = MoviesListingViewController()
    }
    
    func testViewControllerViewDidLoadCorrectly() {
        // Arrange
        viewController.loadView()
        
        // Act
        viewController.viewDidLoad()
        
        // Assert
        XCTAssertNotNil(viewController.moviesCollectionView.dataSource)
        XCTAssertNotNil(viewController.moviesCollectionView.delegate)
    }
    
    func testViewControllerLoadsCollectionViewCorrectly() {
        // Arrange
        viewController.loadView()
        
        // Act
        let viewHasCollectionViewAsSubview = viewController.view.subviews.contains(where: { $0 is UICollectionView })
        
        // Assert
        XCTAssertTrue(viewHasCollectionViewAsSubview)
    }

    override func tearDownWithError() throws {
        viewController = nil
    }
}
