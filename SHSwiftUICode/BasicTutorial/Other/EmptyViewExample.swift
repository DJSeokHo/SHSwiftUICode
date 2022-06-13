//
//  EmptyViewExample.swift
//  SHSwiftUICode
//
//  Created by 浩 SHI on 2022/01/28.
//

import SwiftUI

struct EmptyViewExample: View {
    var body: some View {
       
        // EmptyView 表示空视图。
        // 很少会直接创建 EmptyView，在泛型中如果一个视图类型没有初始化，
        // 就会被当成 EmptyView
        VStack {
            EmptyView()
        }
        
    }
}

struct EmptyViewExample_Previews: PreviewProvider {
    static var previews: some View {
        EmptyViewExample()
    }
}
