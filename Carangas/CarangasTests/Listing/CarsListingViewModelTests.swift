//
//  CarFormCoordinator.swift
//  Carangas
//
//  Created by Mauro Siqueira Jr on 21/09/20.
//


import XCTest
@testable import Carangas

class CarsListingViewModelTests: XCTestCase {

    //System Under Test
    var sut: CarsListingViewModel!
    /*
    override class func setUp() {
        print("1")
    }
    
    override func setUpWithError() throws {
        try super.tearDownWithError()
        print("2")
    }
    */
    
    override func setUp() {
        super.setUp()
        sut = CarsListingViewModel()
    }

    override func tearDown() {
        sut = nil
        super.tearDown()
    }
    
    /*
    override func tearDownWithError() throws {
        try super.tearDownWithError()
        print("5")
    }
    
    override class func tearDown() {
        print("6")
    }
    */
    
    func testCount() {
        //Given
        sut.Service = CarAPIStub.self
        
        //When
        sut.loadCars()
        
        //Then
        XCTAssertEqual(sut.count, 8, "Total de carros diferente do esperado")
    }
    
    func testFirstCarInfo() {
        //Given
        sut.Service = CarAPIStub.self
        let indexPath = IndexPath(row: 0, section: 0)
        
        //When
        sut.loadCars()
        let carViewModel = sut.getCarViewModelFor(indexPath)
        
        //Then
        XCTAssertEqual(carViewModel.title, "M3", "Nome do carro errado")
        XCTAssertEqual(carViewModel.brand, "Marca: Acura", "Nome do marca errada")
    }

}
