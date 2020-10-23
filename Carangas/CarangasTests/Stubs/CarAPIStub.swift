//
//  CarFormCoordinator.swift
//  Carangas
//
//  Created by Mauro Siqueira Jr on 21/09/20.
//


import Foundation
@testable import Carangas

class CarAPIStub: NSObject, CarAPIProtocol {
    
    static func loadCars(onComplete: @escaping (Result<[Car], APIError>) -> Void) {
        var cars: [Car] = []
        let url = Bundle(for: CarAPIStub.self).url(forResource: "CarsMocked", withExtension: "json")!
        let data = try! Data(contentsOf: url)
        cars = try! JSONDecoder().decode([Car].self, from: data)
        onComplete(.success(cars))
    }
}
