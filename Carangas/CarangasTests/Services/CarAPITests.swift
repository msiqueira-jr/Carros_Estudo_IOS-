//
//  CarFormCoordinator.swift
//  Carangas
//
//  Created by Mauro Siqueira Jr on 21/09/20.
//


import XCTest
@testable import Carangas

class CarAPITests: XCTestCase {

    private var sut = CarAPI.self
    
    override func setUp() {
        super.setUp()
    }

    override func tearDown() {
        super.tearDown()
    }
    
    func testLoadCarsResponseSuccess() {
        //Given
        let promise = expectation(description: "Sucesso")
        
        //When
        sut.loadCars { (result) in
            defer {
                promise.fulfill()
            }
            switch result {
            case .success:
                XCTAssertTrue(true)
            case .failure(let apiError):
                XCTFail(apiError.errorMessage)
            }
        }
        
        //Then
        wait(for: [promise], timeout: 3.0)
    }
    

}
