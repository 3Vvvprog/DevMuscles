//
//  LogInViewController.swift
//  DevMuscles
//
//  Created Вячеслав Вовк on 11.02.2024.
//  Copyright © 2024 ___ORGANIZATIONNAME___. All rights reserved.
//

import UIKit
import SnapKit

class LogInViewController: UIViewController {
    var viewModel: LogInViewModel!
    var viewOutput: LogInViewOutput!
//    private var disposeBag = DisposeBag()
    
    // MARK: - Private Properties
    private var mainImage = UIImageView()
    private var topLoginButton: UIButton = {
        let button = UIButton(type: .system)
        button.backgroundColor = .clear
        button.setTitle("Login", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.titleLabel?.font = .boldSystemFont(ofSize: 13)
        return button
    }()
    
    private var topSignUpButton: UIButton = {
        let button = UIButton(type: .system)
        button.backgroundColor = .clear
        button.setTitle("Sign up", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.titleLabel?.font = .boldSystemFont(ofSize: 13)
        return button
    }()
    let activeView = UIView()
    
    private let welcomeLabel: UILabel = {
        let label = UILabel()
        label.text = "WELCOME"
        label.font = .Integral.regular.size(of: 36)
        label.textColor = .white
        return label
    }()
    
    
    private let emailLabel: UILabel = {
        let label = UILabel()
        label.text = "Email"
        label.font = .systemFont(ofSize: 11)
        label.textColor = AppColors.accentGreen
        return label
    }()
    private let emailTextField: UITextField = {
        let textField = UITextField()
        textField.attributedPlaceholder = NSAttributedString(
            string: "Email",
            attributes: [NSAttributedString.Key.foregroundColor: UIColor.white]
        )
        textField.tintColor = .white
        textField.textColor = .white
        textField.layer.borderColor = UIColor.clear.cgColor
        return textField
    }()
    private let emailUnderline = UIView()
    private let emailCorrectImageView = UIImageView()
    
    
    // MARK: - Password
    private let passwordLabel: UILabel = {
        let label = UILabel()
        label.text = "Password"
        label.font = .systemFont(ofSize: 11)
        label.textColor = AppColors.accentGreen
        return label
    }()
    private let passwordTextField: UITextField = {
        let textField = UITextField()
        textField.attributedPlaceholder = NSAttributedString(
            string: "Password",
            attributes: [NSAttributedString.Key.foregroundColor: UIColor.white]
        )
        textField.tintColor = .white
        textField.textColor = .white
        textField.layer.borderColor = UIColor.clear.cgColor
        return textField
    }()
    private let passwordUnderline = UIView()
    private let passwordShowedImageView = UIImageView()
    
    
    private var forgotPasswordButton: UIButton = {
        let button = UIButton(type: .system)
        button.backgroundColor = .clear
        button.setTitle("Forgot Password", for: .normal)
        button.setTitleColor(AppColors.accentGreen, for: .normal)
        button.titleLabel?.font = .boldSystemFont(ofSize: 13)
        return button
    }()
    
    private var loginButton: UIButton = {
        let button = UIButton(type: .system)
        button.backgroundColor = AppColors.accentGreen
        button.setTitle("Login", for: .normal)
        button.setTitleColor(.black, for: .normal)
        button.titleLabel?.font = .boldSystemFont(ofSize: 17)
        button.layer.cornerRadius = 25
        return button
    }()
    
    private var appleBackView: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor(red: 58/255.0, green: 58/255.0, blue: 60/255.0, alpha: 1.000)
        view.layer.cornerRadius = 27
        return view
    }()
    
    private var appleImageView: UIImageView = {
        let view = UIImageView()
        view.image = UIImage.apple
        return view
    }()
    
    private var googleBackView: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor(red: 58/255.0, green: 58/255.0, blue: 60/255.0, alpha: 1.000)
        view.layer.cornerRadius = 27
        return view
    }()
    
    private var googleImageView: UIImageView = {
        let view = UIImageView()
        view.image = UIImage.google
        return view
    }()
    
    
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
        view.backgroundColor = AppColors.blask
        
    }
    
    
    // MARK: - Private Constants
//    private enum Constants {
//
//    }
    
}

// MARK: - Private Setup
private extension LogInViewController {
    
    func initialize() {
        view.addSubview(mainImage)
        mainImage.image = UIImage.loginView
        view.addSubview(topLoginButton)
        view.addSubview(activeView)
        activeView.backgroundColor = AppColors.accentGreen
        view.addSubview(topSignUpButton)
        
        view.addSubview(welcomeLabel)
        
        view.addSubview(emailTextField)
        view.addSubview(emailUnderline)
        emailUnderline.backgroundColor = AppColors.darkGray
        view.addSubview(emailLabel)
        view.addSubview(emailCorrectImageView)
        emailCorrectImageView.image = UIImage.tickSquare
        
        view.addSubview(passwordTextField)
        view.addSubview(passwordUnderline)
        passwordUnderline.backgroundColor = AppColors.darkGray
        view.addSubview(passwordLabel)
        view.addSubview(passwordShowedImageView)
        passwordShowedImageView.image = UIImage.showPass
        
        view.addSubview(forgotPasswordButton)
        view.addSubview(loginButton)
        
        view.addSubview(appleBackView)
        appleBackView.addSubview(appleImageView)
        
        view.addSubview(googleBackView)
        googleBackView.addSubview(googleImageView)
    }
    
    
    // MARK: - Constraints
    func makeConstraints() {
        mainImage.snp.makeConstraints { make in
            make.top.leading.trailing.equalToSuperview()
            make.height.equalTo(460)
        }
        
        topLoginButton.snp.makeConstraints { make in
            make.top.equalToSuperview().inset(58)
            make.leading.equalTo(view.snp.leading).inset(32)
        }
        
        topSignUpButton.snp.makeConstraints { make in
            make.top.equalToSuperview().inset(58)
            make.leading.equalTo(topLoginButton.snp.trailing).offset(32)
        }
        
        activeView.snp.makeConstraints { make in
            make.centerX.equalTo(topLoginButton.snp.centerX)
            make.top.equalTo(topLoginButton.snp.bottom).offset(1)
            make.width.equalTo(topLoginButton.snp.width)
            make.height.equalTo(3)
        }
        
        welcomeLabel.snp.makeConstraints { make in
            make.leading.trailing.equalToSuperview().inset(32)
            make.top.equalTo(activeView.snp.bottom).offset(211)
        }
        
        emailCorrectImageView.snp.makeConstraints { make in
            make.top.equalTo(mainImage.snp.bottom).offset(50)
            make.trailing.equalTo(view.snp.trailing).inset(47)
            make.height.width.equalTo(20)
        }
        
        emailTextField.snp.makeConstraints { make in
            make.leading.equalToSuperview().inset(48)
            make.trailing.equalTo(emailCorrectImageView.snp.leading).inset(-10)
            make.top.equalTo(mainImage.snp.bottom).offset(30)
            make.height.equalTo(60)
        }
        
        emailUnderline.snp.makeConstraints { make in
            make.leading.trailing.equalToSuperview().inset(32)
            make.top.equalTo(emailTextField.snp.bottom)
            make.height.equalTo(1)
        }
        
        emailLabel.snp.makeConstraints { make in
            make.leading.trailing.equalToSuperview().inset(49)
            make.bottom.equalTo(emailTextField.snp.top).offset(10)
        }
        
        
        passwordShowedImageView.snp.makeConstraints { make in
            make.top.equalTo(emailUnderline.snp.bottom).offset(38)
            make.trailing.equalTo(view.snp.trailing).inset(45)
            make.height.width.equalTo(24)
        }
        
        passwordTextField.snp.makeConstraints { make in
            make.leading.equalToSuperview().inset(48)
            make.trailing.equalTo(passwordShowedImageView.snp.leading).inset(-10)
            make.centerY.equalTo(passwordShowedImageView.snp.centerY)
            make.height.equalTo(60)
        }
        
        passwordUnderline.snp.makeConstraints { make in
            make.leading.trailing.equalToSuperview().inset(32)
            make.top.equalTo(passwordTextField.snp.bottom)
            make.height.equalTo(1)
        }
        
        passwordLabel.snp.makeConstraints { make in
            make.leading.trailing.equalToSuperview().inset(49)
            make.bottom.equalTo(passwordTextField.snp.top).offset(10)
        }
        
        forgotPasswordButton.snp.makeConstraints { make in
            make.top.equalTo(passwordUnderline.snp.bottom).offset(20)
            make.trailing.equalToSuperview().inset(42)
        }
        
        loginButton.snp.makeConstraints { make in
            make.trailing.equalToSuperview().inset(33)
            make.bottom.equalTo(view.safeAreaLayoutGuide).inset(30)
            make.height.equalTo(50)
            make.width.equalTo(125)
        }
        
        appleBackView.snp.makeConstraints { make in
            make.centerY.equalTo(loginButton.snp.centerY)
            make.leading.equalToSuperview().inset(32)
            make.width.height.equalTo(54)
        }
        
        appleImageView.snp.makeConstraints { make in
            make.center.equalToSuperview()
            make.width.height.equalTo(24)
        }
        
        googleBackView.snp.makeConstraints { make in
            make.centerY.equalTo(loginButton.snp.centerY)
            make.leading.equalTo(appleBackView.snp.trailing).offset(21)
            make.width.height.equalTo(54)
        }
        
        googleImageView.snp.makeConstraints { make in
            make.center.equalToSuperview()
            make.width.height.equalTo(24)
        }
    }
}
