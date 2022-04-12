//
//  UIColorExtension.swift
//  SHSwiftUICode
//
//  Created by Seok Ho on 2022/04/12.
//

import Foundation
import UIKit

extension UIColor {

    convenience init(red: Int, green: Int, blue: Int, alpha: CGFloat = 1.0) {
        
        let redValue = CGFloat(red) / 255.0
        let greenValue = CGFloat(green) / 255.0
        let blueValue = CGFloat(blue) / 255.0
        self.init(red: redValue, green: greenValue, blue: blueValue, alpha: alpha)
        
    }
    
}
