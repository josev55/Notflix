//
//  LoadingViewTests.swift
//  NotflixTests
//
//  Created by Jose Vildosola on 20-06-22.
//

import XCTest
@testable import Notflix

class LoadingViewTests: XCTestCase {
    var containerView: UIView!

    override func setUpWithError() throws {
        containerView = UIView()
    }
    
    func testShowLoadingAddsViewInView() {
        // Act
        LoadingView.shared.showLoadingIn(containerView)
        
        // Assert
        XCTAssertTrue(containerView.subviews.count == 1)
    }
    
    func testHideLoadingRemovesViewFromSuperview() {
        // Arrange
        LoadingView.shared.showLoadingIn(containerView)
        
        // Act
        LoadingView.shared.removeLoadingView()
        
        // Assert
        XCTAssertTrue(containerView.subviews.count == 0)
    }

    override func tearDownWithError() throws {
        containerView = nil
    }
}
