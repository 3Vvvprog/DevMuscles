//
//  OnboardingCoordinator.swift
//  DevMuscles
//
//  Created Вячеслав Вовк on 10.02.2024.
//  Copyright © 2024 ___ORGANIZATIONNAME___. All rights reserved.
//

import UIKit

class OnboardingCoordinator: Coordinator {
    private let factory = SceneFactory.self
    
    override func start() {
        showOnboarding()
    }
    
    override func finish() {
        finishDelegate?.coordinatorDidFinished(childCoordinator: self)
    }
}

private extension OnboardingCoordinator {
    func showOnboarding() {
        let viewController = factory.makeOnboardingController(coordinator: self)
        navigationController?.pushViewController(viewController, animated: true)
    }
}
