//
//  XMPropertyWrapper.swift
//  SHSwiftUICode
//
//  Created by mac on 2023/03/13.
//

import Foundation

@propertyWrapper
struct ColorValue {
    
    private var value: Int = 0
    
    var wrappedValue: Int {
        
        get {
            return self.value
        }
        
        set {
            
            if newValue < 0 {
                self.value = 0
            }
            else if newValue > 255 {
                self.value = 255
            }
            else {
                self.value = newValue
            }
        }
    }
    
    init(initValue: Int) {
        self.wrappedValue = initValue
    }
    
}

struct MyColor {
    
    @ColorValue
    var red: Int
    
    @ColorValue
    var green: Int
    
    @ColorValue
    var blue: Int
}
