//
//  SceneFactory.swift
//  DevMuscles
//
//  Created by Вячеслав Вовк on 11.02.2024.
//

import UIKit

struct SceneFactory {
    
    //MARK: - OnboardingCoordinator
    static func makeOnboardingController(coordinator: OnboardingCoordinator) -> OnboardingViewController {
        var pages = [OnboardingPartViewController]()
        let firstVC = OnboardingPartViewController()
        firstVC.imageToShow = UIImage._1
        firstVC.titleText = "MEET YOUR COACH,"
        firstVC.descriptionText = "START YOUR JORNEY"
        
        let secondVC = OnboardingPartViewController()
        secondVC.imageToShow = UIImage._2
        secondVC.titleText = "CREATE A WORKOUT PLAN"
        secondVC.descriptionText = "TO STAY FIT"
        let thirdVC = OnboardingPartViewController()
        thirdVC.imageToShow = UIImage._3
        thirdVC.titleText = "ACTION IS THE"
        thirdVC.descriptionText = "KEY TO ALL SUCCESS"
        pages.append(firstVC)
        pages.append(secondVC)
        pages.append(thirdVC)
        let presenter = OnboardingViewPresenter(coordinator: coordinator)
        let viewController = OnboardingViewController(pages: pages, viewOutput: presenter)
        return viewController
    }
    
    
    // MARK: - OnboardingFlow
    static func makeOnboardingFlow(coordinator: AppCoordinator, navigationController: UINavigationController, finishDelegate: CoordinatorFinishDelegate) {
        let onboardingCoordinator = OnboardingCoordinator(type: .onboarding, navigationController: navigationController, finishDelegate: finishDelegate)
        coordinator.addChildCoordinator(onboardingCoordinator)
        onboardingCoordinator.start()
    }
    
    // MARK: - LogInCoordinator
    static func makeLogInController(coordinator: LogInCoordinator) -> LogInViewController {
        let presenter = LogInViewPresenter(coordinator: coordinator)
        let viewModel = LogInViewModel()
        let viewController = LogInViewController(viewModel: viewModel, viewOutput: presenter)
        return viewController
    }
    
    // MARK: - LogInFlow
    static func makeLogInFlow(coordinator: AppCoordinator, navigationController: UINavigationController, finishDelegate: CoordinatorFinishDelegate) {
        let logInCoordinator = LogInCoordinator(type: .logIn, navigationController: navigationController)
        coordinator.addChildCoordinator(logInCoordinator)
        logInCoordinator.start()
    }
}
