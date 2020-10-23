//
//  CarFormCoordinator.swift
//  Carangas
//
//  Created by Mauro Siqueira Jr on 21/09/20.
//

import Foundation

//https://developer.apple.com/videos/play/wwdc2015/408/
struct CarCellViewModel: VehicleCellProtocol {
    
    private var car: Car
    
    init(car: Car) {
        self.car = car
    }
    
    var name: String {
        car.name
    }
    
    var brand: String {
        car.brand.uppercased()
    }
    
}
