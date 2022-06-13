//
//  NavigationLinkExample.swift
//  SHSwiftUICode
//
//  Created by 浩 SHI on 2022/01/28.
//

import SwiftUI

struct NavigationLinkExample: View {
    
    // NavigationLink 负责控制导航页的点击跳转
    // 其主要有两个参数：destination 是跳转的目的地；
    // label 导航栏中对应格子的标签
    
    var body: some View {
        
        NavigationView {
            List(0..<3) { i in
                // NavigationLink 负责控制导航页的点击跳转
                // 其主要有两个参数：destination 是跳转的目的地；
                // label 导航栏中对应格子的标签
                NavigationLink(
                    destination: {
                        Text("View \(i)")
                    },
                    label: {
                        Text("Item \(i)")
                    }
                )
            }
            .navigationBarTitle("Navigation")
        }
        
    }
}

struct NavigationLinkExample_Previews: PreviewProvider {
    static var previews: some View {
        NavigationLinkExample()
    }
}
