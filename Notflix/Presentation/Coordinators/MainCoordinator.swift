//
//  MainCoordinator.swift
//  Notflix
//
//  Created by Jose Vildosola on 21-06-22.
//

import UIKit

protocol Coordinator {
    var childCoordinators: [Coordinator] { get set }
    var navigationController: UINavigationController { get set }

    func showMovieDetails(movieId: String)
}

class MainCoordinator: Coordinator {
    var childCoordinators = [Coordinator]()
    let appDelegate = UIApplication.shared.delegate as? AppDelegate
    
    var navigationController: UINavigationController
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
        self.navigationController.navigationBar.prefersLargeTitles = true
        self.navigationController.navigationItem.largeTitleDisplayMode = .always
    }
    
    func showMovieDetails(movieId: String) {
        if let container = appDelegate?.container, let vc = container.resolve(MovieDetailsViewController.self) {
            vc.movieId = movieId
            self.navigationController.pushViewController(vc, animated: true)
        }
    }
}
