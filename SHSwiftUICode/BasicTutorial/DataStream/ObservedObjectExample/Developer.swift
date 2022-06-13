//
//  Developer.swift
//  SHSwiftUICode
//
//  Created by Seok Ho on 2022/01/29.
//

import Combine

/**
    一个 Developer 类满足 ObservableObject 协议表示这个类在监听某些属性
    @Publish name，@Publish age 表示这些属性在被监听
    @ObservedObject var developer 表示 developer 对象是被监听的对象
    点击按钮调用self.developer.test()，改变了 developer 的名字和年龄
    UI收到了 Publisher 的广播，自动更新了界面
 */
class Developer: ObservableObject {
   
    @Published
    var name: String = ""
    
    @Published
    var age: Int = 0
    
    init() { }
    
    func test() {
        self.name = "Coding with cat"
        self.age = 35
    }
}
