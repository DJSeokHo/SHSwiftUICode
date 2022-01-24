//
//  ListExample.swift
//  SHSwiftUICode
//
//  Created by 浩 SHI on 2022/01/21.
//

import SwiftUI


struct ListExample: View {
    var body: some View {
        
        BasicList()
       
    }
}

struct BasicList: View {
    var body: some View {
        
        VStack {
            
            // List 就是随平台显示的列表控件，自动支持滑动。
            // 最简单的使用方法就是将需要传入的组件传给 List。
            List {
                Text("Coding")
                Text("With")
                Text("Cat")
            }
            
            Spacer().frame(height: 20)
            // 也常常会结合 ForEach 进行列表的显示
            List {
                ForEach(developmentItemArray) { developmentItem in
                    Text(developmentItem.title)
                }
            }
            
            Spacer().frame(height: 20)
            
            // 也可以直接把循环量直接传给 List
            List(developmentItemArray) { developmentItem in
                Text(developmentItem.title)
            }
        }
    }
    
}

struct ListExample_Previews: PreviewProvider {
    static var previews: some View {
        
        Group {
            BasicList()
        }
      
    }
}

private struct DevelopmentItem: Identifiable, Hashable {
    let id = UUID()
    let title: String
}

private let developmentItemArray = [
    DevelopmentItem(title: "Android"),
    DevelopmentItem(title:  "iOS"),
    DevelopmentItem(title: "Python")
]
