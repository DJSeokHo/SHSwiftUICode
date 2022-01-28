//
//  LazyVStackExample.swift
//  SHSwiftUICode
//
//  Created by 浩 SHI on 2022/01/28.
//

import SwiftUI

struct LazyVStackExample: View {
    var body: some View {
        
        ScrollView {
            // LazyVStack 的用法和 VStack 相同，仅有的区别是它会“惰性初始化”
            // 也就是只有在子视图即将出现在屏幕上的时候，再初始化子视图
            LazyVStack(alignment: .leading, spacing: 5) {
                
                ForEach(1...100, id: \.self) {
                    Text("行 \($0)").font(.title)
                }
            }
        }
        
    }
}

struct LazyVStackExample_Previews: PreviewProvider {
    static var previews: some View {
        LazyVStackExample()
    }
}
