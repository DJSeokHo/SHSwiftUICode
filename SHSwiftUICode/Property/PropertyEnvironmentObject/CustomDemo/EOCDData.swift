//
//  EOCDData.swift
//  SHSwiftUICode
//
//  Created by Seok Ho on 2020/12/01.
//

import SwiftUI

/*
 在appdelegate 里初始化
 在主view进行 environmentObject，目的在于把这个可观察的对象变成环境变量
 这样就可以实现每个view都能使用，却不用每个view都注入这个对象
 */
class EOCDData: ObservableObject {
    
    @Published
    var nickname = ""
    
}
