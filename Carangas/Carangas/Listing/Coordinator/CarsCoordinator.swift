//
//  CarFormCoordinator.swift
//  Carangas
//
//  Created by Mauro Siqueira Jr on 21/09/20.
//


import UIKit

class CarsCoordinator: Coordinator {
    
    var navigationController: UINavigationController
    var childCoordinators: [Coordinator] = []
    var parentCoordinator: Coordinator?

    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    func start() {
        let viewController = CarsTableViewController.instantiateFromStoryboard(.listing)
        viewController.coordinator = self
        navigationController.pushViewController(viewController, animated: false)
    }
    
    func createCar() {
        let childCoordinator = CarFormCoordinator(navigationController: navigationController)
        childCoordinator.parentCoordinator = self
        add(childCoordinator: childCoordinator)
        childCoordinator.start()
    }
    
    func showCarWith(viewModel: CarViewModel) {
        let childCoordinator = CarCoordinator(navigationController: navigationController, carViewModel: viewModel)
        childCoordinator.parentCoordinator = self
        add(childCoordinator: childCoordinator)
        childCoordinator.start()
    }
    
    deinit {
        print("CarsCoordinator deinit")
    }
    
}

extension CarsCoordinator: CarCreator, CarPresenter {
    
}
