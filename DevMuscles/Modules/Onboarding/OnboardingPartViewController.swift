//
//  OnboardingPartViewController.swift
//  DevMuscles
//
//  Created by Вячеслав Вовк on 10.02.2024.
//

import UIKit
import SnapKit

class OnboardingPartViewController: UIViewController {
//    private var disposeBag = DisposeBag()
    
    // MARK: - Private properties
    var imageToShow: UIImage? {
        didSet {
            imageView.image = imageToShow
        }
    }
    
    var titleText: String? {
        didSet {
            titleLabel.text = titleText
        }
    }
    
    var descriptionText: String? {
        didSet {
            descriptionLabel.text = descriptionText
        }
    }
    
    // MARK: - Private Views
    private let imageView = UIImageView()
    private let titleLabel = UILabel()
    private let descriptionLabel = UILabel()
    var button = UIButton()
    
    
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
private extension OnboardingPartViewController {
    
    func initialize() {
        view.addSubview(imageView)
        view.addSubview(titleLabel)
        view.addSubview(descriptionLabel)
        view.addSubview(button)

        titleLabel.font = .Integral.regular.size(of: 24)
        titleLabel.textColor = .white
        
        descriptionLabel.font = .Integral.extraBold.size(of: 24)
        descriptionLabel.textColor = .white
        descriptionLabel.numberOfLines = 0
        descriptionLabel.textAlignment = .center
        
        button.backgroundColor = AppColors.accentGreen
        button.layer.cornerRadius = 25
        button.setTitle("Start Now", for: .normal)
        button.setTitleColor(AppColors.blask, for: .normal)
        button.titleLabel?.font = .Integral.regular.size(of: 17)
    }
    
    
    // MARK: - Constraints
    func makeConstraints() {
        imageView.snp.makeConstraints { make in
            make.top.leading.trailing.equalToSuperview()
            make.height.equalTo(460)
        }
        
        titleLabel.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.top.equalTo(imageView.snp.bottom).offset(62)
        }
        
        descriptionLabel.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.top.equalTo(titleLabel.snp.bottom).offset(20)
        }
        
        button.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.top.equalTo(descriptionLabel.snp.bottom).offset(53)
            make.height.equalTo(50)
            make.width.equalTo(185)
        }
    }
}
