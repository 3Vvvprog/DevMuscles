//
//  LogInCoordinator.swift
//  DevMuscles
//
//  Created Вячеслав Вовк on 11.02.2024.
//  Copyright © 2024 ___ORGANIZATIONNAME___. All rights reserved.
//

import UIKit

class LogInCoordinator: Coordinator {
    private let factory = SceneFactory.self
    
    override func start() {
        showLogIn()
    }
    
    override func finish() {
        finishDelegate?.coordinatorDidFinished(childCoordinator: self)
    }
}

private extension LogInCoordinator {
    func showLogIn() {
        let viewController = factory.makeLogInController(coordinator: self)
        navigationController?.pushViewController(viewController, animated: true)
    }
}
