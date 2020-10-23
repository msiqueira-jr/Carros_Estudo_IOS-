//
//  CarFormCoordinator.swift
//  Carangas
//
//  Created by Mauro Siqueira Jr on 21/09/20.
//


import Foundation

//https://app.quicktype.io/ -> Criando Models a partir de um JSON
class Car: Codable {
    
    var _id: String?
    var brand: String = ""
    var name: String = ""
    var gasType: Int = 0
    var price: Double = 0
    
    var fuel: String {
        switch gasType {
        case 0:
            return "Flex"
        case 1:
            return "Álcool"
        default:
            return "Gasolina"
        }
    }
    
    var formattedPrice: String {
        let formatter = NumberFormatter()
        formatter.numberStyle = .currency
        formatter.locale = Locale(identifier: "pt_BR")
        return formatter.string(from: NSNumber(value: price)) ?? "R$ \(price)"
    }
    
}
