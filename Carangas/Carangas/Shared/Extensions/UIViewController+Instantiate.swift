//
//  CarFormCoordinator.swift
//  Carangas
//
//  Created by Mauro Siqueira Jr on 21/09/20.
//

import UIKit

extension UIViewController {
    
    static func instantiateFromStoryboard(_ storyboard: UIStoryboard) -> Self {
        let name = String(describing: self)
        return storyboard.instantiateViewController(withIdentifier: name) as! Self
    }
}
