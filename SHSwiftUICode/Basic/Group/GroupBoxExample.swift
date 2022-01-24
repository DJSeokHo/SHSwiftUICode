//
//  GroupBoxExample.swift
//  SHSwiftUICode
//
//  Created by 浩 SHI on 2022/01/21.
//

import SwiftUI

struct GroupBoxExample: View {
    var body: some View {
        
        VStack {
            // GroupBox 由两部分组成：可选的标签部分和主题的内容部分
            GroupBox(label: Label("Coding with cat", systemImage: "checkmark.circle.fill")) {
                Text("Youtube")
                Text("Github")
            }
            // 也可以不传入标签
            GroupBox {
                Text("Coding")
                Text("With")
                Text("Cat")
            }
        }
        
    }
}

struct GroupBoxExample_Previews: PreviewProvider {
    static var previews: some View {
        GroupBoxExample()
    }
}
