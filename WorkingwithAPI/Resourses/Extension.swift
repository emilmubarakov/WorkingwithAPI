//
//  File.swift
//  WorkingwithAPI
//
//  Created by e.mubarakov on 29.05.2023.
//

import Foundation
import UIKit

extension UIColor {
    
    static let backgroundColor = UIColor.black
    static let mainBlueTint = UIColor.white
    static let disabledButtonColor = UIColor.gray
    
    static func rgb(red: CGFloat, green: CGFloat, blue: CGFloat) -> UIColor {
        return UIColor(red: red/255, green: green/255, blue: blue/255, alpha: 1)
    }
}
