//
//  CarFormCoordinator.swift
//  Carangas
//
//  Created by Mauro Siqueira Jr on 21/09/20.
//


import Foundation

protocol CarAPIProtocol {
    static func loadCars(onComplete: @escaping (Result<[Car], APIError>) -> Void)
}
