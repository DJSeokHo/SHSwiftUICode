//
//  CustomPropertyWrapper.swift
//  SHSwiftUICode
//
//  Created by Seok Ho on 2020/12/01.
//


/*
 属性包装装饰
 用于限制某些属性的异常值
 
 这个例子我要限制的大小在10-100范围内
 */
@propertyWrapper
struct CustomPropertyWrapper {
    private var value: Int = 0
    
    var wrappedValue: Int {
        get {
            value
        }
        set {
            if newValue < 10 {
                value = 10
            }
            else if newValue > 100 {
                value = 100
            }
            else {
                value = newValue
            }
        }
    }
    
    init(wrappedValue: Int) {
        self.wrappedValue = wrappedValue
    }
}
