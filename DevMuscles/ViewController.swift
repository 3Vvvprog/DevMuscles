//
//  ViewController.swift
//  DevMuscles
//
//  Created by Вячеслав Вовк on 10.02.2024.
//

import UIKit
import SnapKit

class ViewController: UIViewController {
    private var label = UILabel()
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        view.backgroundColor = .white
        
        view.addSubview(label)
        label.text = "Main Label"
        label.textColor = .black
        
        
        
        
        label.snp.makeConstraints { make in
            make.center.equalToSuperview()
        }
    }


}

