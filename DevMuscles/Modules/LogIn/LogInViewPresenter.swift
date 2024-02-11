//
//  LogInViewPresenter.swift
//  DevMuscles
//
//  Created Вячеслав Вовк on 11.02.2024.
//  Copyright © 2024 ___ORGANIZATIONNAME___. All rights reserved.
//

import Foundation

protocol LogInViewOutput: AnyObject {
    func finishModule()
}

class LogInViewPresenter: LogInViewOutput {
    
    
    // MARK: - Properties
    weak var coordinator: LogInCoordinator!
    
    init(coordinator: LogInCoordinator!) {
        self.coordinator = coordinator
    }
    
    func finishModule() {
        coordinator.finish()
    }
    
    
}

