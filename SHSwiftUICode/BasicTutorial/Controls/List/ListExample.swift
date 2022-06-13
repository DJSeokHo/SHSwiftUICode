//
//  ListExample.swift
//  SHSwiftUICode
//
//  Created by 浩 SHI on 2022/01/21.
//

import SwiftUI

private struct DevelopmentItem: Identifiable, Hashable {
    let id = UUID()
    let title: String
}

struct ListExample: View {
    var body: some View {
        
//        BasicList()
        SelectionList()
    }
}

struct SelectionList: View {
    
    private let developmentItemArray = [
        DevelopmentItem(title: "Android"),
        DevelopmentItem(title:  "iOS"),
        DevelopmentItem(title: "Python")
    ]
    
    @State
    var selection = Set<Development>()
    
    var body: some View {
        
        NavigationView {
            /*
             List 还支持传入 selection 参数，是用来配合 EditButton
             使用的。添加了 selection 参数后，点击 Edit 就会在左侧出现选择框了。
             
             这个不起作用。。。
             */
            List(developmentItemArray, id: \.self, selection: $selection) { developmentItem in
                Text(developmentItem.title)
            }
            .navigationBarItems(trailing: EditButton())
            .navigationBarTitle(Text("Select \(selection.count) items"))
        }
        
    }
    
    
}

struct BasicList: View {
    
    private let developmentItemArray = [
        DevelopmentItem(title: "Android"),
        DevelopmentItem(title:  "iOS"),
        DevelopmentItem(title: "Python")
    ]
    
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
