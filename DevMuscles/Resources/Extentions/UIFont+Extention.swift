//
//  UIFont+Extention.swift
//  DevMuscles
//
//  Created by Вячеслав Вовк on 10.02.2024.
//

import UIKit

extension UIFont {
    enum Integral {
        enum bold {
            static func size(of size: CGFloat) -> UIFont {
                return UIFont(name: Constants.Integral.bold, size: size)!
            }
        }
        
        enum extraBold {
            static func size(of size: CGFloat) -> UIFont {
                return UIFont(name: Constants.Integral.extraBold, size: size)!
            }
        }
        
        enum regular {
            static func size(of size: CGFloat) -> UIFont {
                return UIFont(name: Constants.Integral.regular, size: size)!
            }
        }
    }
}

private extension UIFont {
    enum Constants {
        enum Integral {
            static let bold = "IntegralCF-Bold"
            static let extraBold = "IntegralCF-ExtraBold"
            static let regular = "IntegralCF-Regular"
        }
    }
}

