//
//  CarFormCoordinator.swift
//  Carangas
//
//  Created by Mauro Siqueira Jr on 21/09/20.
//


import UIKit

class CarFormCoordinator: Coordinator {
        
    var navigationController: UINavigationController
    var childCoordinators: [Coordinator] = []
    var parentCoordinator: Coordinator?
    let carFormViewModel: CarFormViewModel
    
    init(navigationController: UINavigationController, carFormViewModel: CarFormViewModel? = nil) {
        self.navigationController = navigationController
        self.carFormViewModel = carFormViewModel ?? CarFormViewModel()
    }
    
    func start() {
        let viewController = CarFormViewController.instantiateFromStoryboard(.form)
        viewController.viewModel = carFormViewModel
        viewController.coordinator = self
        navigationController.pushViewController(viewController, animated: true)
    }
    
    func childDidFinish(_ child: Coordinator?) {
        parentCoordinator?.childDidFinish(self)
    }
    
    deinit {
        print("CarFormCoordinator deinit")
    }
}
