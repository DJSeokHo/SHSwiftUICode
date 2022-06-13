//
//  SectionExample.swift
//  SHSwiftUICode
//
//  Created by 浩 SHI on 2022/01/28.
//

import SwiftUI

struct SectionExample: View {
    var body: some View {
       
        List {
            
            // Section 主要用来在 List、Form 这样的控件中把列表
            // 划分成小组，所以可以通过查看 List 和 Form 的对应例子
            // 查看 Section 的用法和效果
            // 这里主要补充一些 Section 的其他用法
            
            Section {
                
                Text("coding")
                Text("with")
                Text("cat")
                
                // 嵌套的 Section 不会有什么效果
                Section {
                    
                    Text("Android")
                    Text("iOS")
                    Text("Python")
                }
            }
            
            Section(
                header: Text("Header"), footer: Text("Footer")
            ) {
                Text("Content")
            }
        }
        .listStyle(GroupedListStyle())
    }
}

struct SectionExample_Previews: PreviewProvider {
    static var previews: some View {
        SectionExample()
    }
}
