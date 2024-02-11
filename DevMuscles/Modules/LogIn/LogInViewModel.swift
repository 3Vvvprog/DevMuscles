//
//  LogInViewModel.swift
//  DevMuscles
//
//  Created Вячеслав Вовк on 11.02.2024.
//  Copyright © 2024 ___ORGANIZATIONNAME___. All rights reserved.
//

import UIKit

protocol LogInViewModelDelegate: AnyObject {
    func reloadData()
    func fetchData()
}

class LogInViewModel {
    
    init() {
        
    }
}

extension LogInViewModel: LogInViewModelDelegate {
    func reloadData() {
        
    }
    
    func fetchData() {
    }
}
