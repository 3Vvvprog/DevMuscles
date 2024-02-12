//
//  AppCoordinator.swift
//  DevMuscles
//
//  Created Вячеслав Вовк on 10.02.2024.
//  Copyright © 2024 ___ORGANIZATIONNAME___. All rights reserved.
//

import UIKit

class AppCoordinator: Coordinator {
    
    private let factory = SceneFactory.self
    private let userStorage = UserStorage.shared
    
    override func start() {
        if userStorage.passedOnboarding {
            showLoginFlow()
        }else {
            showOnboardingFlow()
        }
    }
    
    override func finish() {
        print("AppCoordinator finish")
    }
}

// MARK: - Navigation methods
private extension AppCoordinator {
    func showOnboardingFlow() {
        guard let navigationController = navigationController else { return }
        factory.makeOnboardingFlow(coordinator: self, navigationController: navigationController, finishDelegate: self)
    }
    
    func showMainFlow() {
        
    }
    
    func showLoginFlow() {
        guard let navigationController = navigationController else { return }
        factory.makeLogInFlow(coordinator: self, navigationController: navigationController, finishDelegate: self)
    }
}

extension AppCoordinator: CoordinatorFinishDelegate {
    func coordinatorDidFinished(childCoordinator: CoordinatorProtocol) {
        removeChildCoordinator(childCoordinator)
        
        switch childCoordinator.type {
        case .onboarding:
            navigationController?.viewControllers.removeAll()
            showLoginFlow()
        case .app:
            return
        default:
            navigationController?.popViewController(animated: false)
        }
    }
}
