//
//  MainCoordinator.swift
//  Attestation
//
//  Created by Alexis Bridoux on 01/11/2020.
//

import UIKit

class MainCoordinator: Coordinator {

    let navigationController: UINavigationController

    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }

    func start() {
        let certificateController = CertificateViewController()
        let profileController = ProfileViewController()
        let profileNavController = UINavigationController(rootViewController: profileController)
        navigationController.pushViewController(certificateController, animated: false)
        navigationController.present(profileNavController, animated: true)
    }
}
