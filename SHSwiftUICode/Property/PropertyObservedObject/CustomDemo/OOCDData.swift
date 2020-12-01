//
//  OOCDData.swift
//  SHSwiftUICode
//
//  Created by Seok Ho on 2020/12/01.
//

import SwiftUI

/*
 可被观察对象
 一般在appdelegate里进行初始化
 也可以在 主View 里进行初始化
 这个例子我在 主View
 */
class OOCDData: ObservableObject {
    
    // 想要被观察的变量
    @Published
    var nickname: String = ""
    
    var realname: String = ""
    
}
