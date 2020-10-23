//
//  CarFormCoordinator.swift
//  Carangas
//
//  Created by Mauro Siqueira Jr on 21/09/20.
//

import UIKit

protocol VehicleCellProtocol {
    var name: String {get}
    var brand: String {get}
}

class CarTableViewCell: UITableViewCell {

    func configure(with viewModel: VehicleCellProtocol) {
        textLabel?.text = viewModel.name
        detailTextLabel?.text = viewModel.brand
    }

}
