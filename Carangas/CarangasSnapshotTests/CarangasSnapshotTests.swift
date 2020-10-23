//
//  CarFormCoordinator.swift
//  Carangas
//
//  Created by Mauro Siqueira Jr on 21/09/20.
//


import XCTest
import FBSnapshotTestCase
@testable import Carangas

class CarangasSnapshotTests: FBSnapshotTestCase {

    var sut: CarViewController!
    var car: Car {
        let car = Car()
        car.name = "Civic"
        car.brand = "Honda"
        car.price = 25000.00
        car.gasType = 0
        return car
    }
    
    override func setUp() {
        super.setUp()
        
        recordMode = false
        //usesDrawViewHierarchyInRect = true
        fileNameOptions = [.screenSize]
        
        sut = CarViewController.instantiateFromStoryboard(.visualization)
    }

    override func tearDown() {
        sut = nil
        super.tearDown()
    }

    func testView() {
        //Give
        sut.viewModel = CarViewModel(car: car)
        
        //When
        sut.beginAppearanceTransition(true, animated: false)
        sut.endAppearanceTransition()
        
        //Then
        FBSnapshotVerifyView(sut.view)
    }

}
