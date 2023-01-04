//
//  CheckInternetConnectionTests.swift
//  movielistTests
//
//  Created by Igor Pino de Souza on 04/01/23.
//

import XCTest
@testable import movielist


class CheckInternetConnectionTests: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }
    
    func testStartMonitoring_WhenAppShowsUp_ShouldReturnTrue() {
        // Arrange
        let sut = CheckInternetConnection.shared
        // Act
        let isConnected = sut.startMonitoring()
        // Assert
        XCTAssertTrue(isConnected, "startMonitoring() should have returned TRUE - No internet connection")
    }
}
