//
//  LogInViewController.swift
//  DevMuscles
//
//  Created Вячеслав Вовк on 11.02.2024.
//  Copyright © 2024 ___ORGANIZATIONNAME___. All rights reserved.
//

import UIKit

class LogInViewController: UIViewController {
    var viewModel: LogInViewModel!
    var viewOutput: LogInViewOutput!
//    private var disposeBag = DisposeBag()
    
    // MARK: - Private Properties
    
    init(viewModel: LogInViewModel!, viewOutput: LogInViewOutput!) {
        self.viewModel = viewModel
        self.viewOutput = viewOutput
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        initialize()
        makeConstraints()
        view.backgroundColor = AppColors.accentGreen
        
    }
    
    
    // MARK: - Private Constants
//    private enum Constants {
//
//    }
    
}

// MARK: - Private Setup
private extension LogInViewController {
    
    func initialize() {
        
    }
    
    
    // MARK: - Constraints
    func makeConstraints() {
        
    }
}
