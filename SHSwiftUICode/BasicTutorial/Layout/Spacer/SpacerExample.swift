//
//  SpacerExample.swift
//  SHSwiftUICode
//
//  Created by 浩 SHI on 2022/01/28.
//

import SwiftUI

struct SpacerExample: View {
    
    var body: some View {
        VStack {
            // Spacer 用于占据 HStack (VStack) 在横（纵）向上
            // 布局完原有信息后剩余的空间
            HStack {
                Spacer()
                Text("右").font(.largeTitle)
            }
            HStack {
                Text("左").font(.largeTitle)
                Spacer()
            }
            HStack {
                Text("左").font(.largeTitle)
                Spacer()
                Text("右").font(.largeTitle)
            }
            // Spacer 对 Stack 来说和其他子视图一样
            HStack {
                Spacer()
                Text("左").font(.largeTitle)
                Spacer()
                Text("右").font(.largeTitle)
                Spacer()
            }
            // Spacer 上也可以设置 layoutPriority
            // 但是这会导致其他视图都消失....
            HStack {
                Text("左").font(.largeTitle)
                Spacer().layoutPriority(2)
                Text("右").font(.largeTitle)
            }
        }
    }
}

struct SpacerExample_Previews: PreviewProvider {
    static var previews: some View {
        SpacerExample()
    }
}
