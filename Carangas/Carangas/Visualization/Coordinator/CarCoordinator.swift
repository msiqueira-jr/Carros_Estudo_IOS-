//
//  CarFormCoordinator.swift
//  Carangas
//
//  Created by Mauro Siqueira Jr on 21/09/20.
//


import UIKit

class CarCoordinator: Coordinator {
    
    var navigationController: UINavigationController
    var childCoordinators: [Coordinator] = []
    var parentCoordinator: Coordinator?
    var carViewModel: CarViewModel
    
    init(navigationController: UINavigationController, carViewModel: CarViewModel) {
        self.navigationController = navigationController
        self.carViewModel = carViewModel
    }
    
    func start() {
        let viewController = CarViewController.instantiateFromStoryboard(.visualization)
        viewController.viewModel = carViewModel
        viewController.coordinator = self
        navigationController.pushViewController(viewController, animated: true)
    }
    
    func editCar(with viewModel: CarFormViewModel) {
        let childCoordinator = CarFormCoordinator(navigationController: navigationController, carFormViewModel: viewModel)
        childCoordinator.parentCoordinator = self
        add(childCoordinator: childCoordinator)
        childCoordinator.start()
    }
    
    func childDidFinish(_ child: Coordinator?) {
        parentCoordinator?.childDidFinish(self)
    }
    
    deinit {
        print("CarCoordinator deinit")
    }
}


