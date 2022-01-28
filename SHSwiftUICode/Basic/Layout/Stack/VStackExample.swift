//
//  VStackExample.swift
//  SHSwiftUICode
//
//  Created by 浩 SHI on 2022/01/28.
//

import SwiftUI

struct VStackExample: View {
    
    // VStack 用于水平摆放视图。和 LazyVStack 不同的是 VStack 会直接
    // 渲染内部的所有视图。请在内容较少的时候才使用 VStack
    //
    // alignment 用于进行对齐，这里因为所有都是 Text 所以效果不明显
    // spacing 用于指定元素间隔
    var body: some View {
       
//        BasicVStackExample()
        LayerPriorityBasicVStack()
    }
}

struct BasicVStackExample: View {
    
    var body: some View {
        
        VStack(alignment: .leading, spacing: 20) {
            
            ForEach(1...10, id: \.self) {
                
                Text("index is \($0)")
                
            }
            
        }
    }
}

struct LayerPriorityBasicVStack: View {
    var body: some View {
        // 我们可以使用 .layoutPriority 来控制 VStack 中元素的布局优先级。
        // 优先级越高的视图会在空间不足的情况下尽量被满足。
        // 数字越高代表优先级越高，默认优先级为 0。
        VStack {
            Text("这个字符串为默认优先级。")
                .font(.largeTitle)
                .border(Color.gray)

            Spacer()

            Text("这个字符串的优先级更高。")
                .font(.largeTitle)
                // 注释这行试试？
                .layoutPriority(1)
                .border(Color.gray)
        }
        .frame(maxWidth: 30)
    }
}

struct VStackExample_Previews: PreviewProvider {
    static var previews: some View {
        VStackExample()
    }
}
