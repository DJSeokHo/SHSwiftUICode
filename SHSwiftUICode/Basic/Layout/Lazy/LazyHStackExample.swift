//
//  LazyHStackExample.swift
//  SHSwiftUICode
//
//  Created by 浩 SHI on 2022/01/28.
//

import SwiftUI

struct LazyHStackExample: View {
    var body: some View {
        ScrollView(.horizontal) {
            // LazyHStack 的用法和 HStack 相同，仅有的区别是它会“惰性初始化”
            // 也就是只有在子视图即将出现在屏幕上的时候，再初始化子视图
            LazyHStack(alignment: .top, spacing: 10) {
                ForEach(1...100, id: \.self) {
                    Text("列 \($0)").font(.title)
                }
            }
        }
    }
}

struct LazyHStackExample_Previews: PreviewProvider {
    static var previews: some View {
        LazyHStackExample()
    }
}
