//
//  OnboardingCoordinator.swift
//  DevMuscles
//
//  Created Вячеслав Вовк on 10.02.2024.
//  Copyright © 2024 ___ORGANIZATIONNAME___. All rights reserved.
//

import UIKit

class OnboardingCoordinator: Coordinator {
    override func start() {
        showOnboarding()
    }
    
    override func finish() {
        finishDelegate?.coordinatorDidFinished(childCoordinator: self)
    }
}

private extension OnboardingCoordinator {
    func showOnboarding() {
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
//        let fourthVC = OnboardingPartViewController()
//        fourthVC.imageToShow = UIImage.creditCard
//        fourthVC.titleText = "Payment Online"
//        fourthVC.descriptionText = "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Dui ultricies sit massa."
        pages.append(firstVC)
        pages.append(secondVC)
        pages.append(thirdVC)
        let presenter = OnboardingViewPresenter(coordinator: self)
        let viewController = OnboardingViewController(pages: pages, viewOutput: presenter)
        navigationController?.pushViewController(viewController, animated: true)
    }
}
