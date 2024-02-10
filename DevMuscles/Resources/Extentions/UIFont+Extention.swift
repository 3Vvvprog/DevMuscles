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
    
    enum ProximaNova {
        enum bold {
            static func size(of size: CGFloat) -> UIFont {
                return UIFont(name: Constants.ProximaNova.bold, size: size)!
            }
        }
        
        enum extraBold {
            static func size(of size: CGFloat) -> UIFont {
                return UIFont(name: Constants.ProximaNova.extraBold, size: size)!
            }
        }
    }
    
    enum Satoshi {
        enum bold {
            static func size(of size: CGFloat) -> UIFont {
                return UIFont(name: Constants.Satoshi.bold, size: size)!
            }
        }
        
        enum medium {
            static func size(of size: CGFloat) -> UIFont {
                return UIFont(name: Constants.Satoshi.medium, size: size)!
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
        
        enum ProximaNova {
            static let bold = "ProximaNova-Bold"
            static let extraBold = "ProximaNova-Extrabld"
        }
        
        enum Satoshi {
            static let bold = "Satoshi-Bold"
            static let medium = "Satoshi-Medium"
        }
    }
}

