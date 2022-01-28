//
//  DisclosureGroupExample.swift
//  SHSwiftUICode
//
//  Created by 浩 SHI on 2022/01/21.
//

import SwiftUI

struct DisclosureGroupExample: View {
    
    var body: some View {
        
        // DisclosureGroup 用来分组显示内容，并可以通过 isExpanded 参数
        // 来控制内容默认是展开的还是折叠起来的，默认是折叠起来的。
        DisclosureGroup("setting", isExpanded: $topExpanded) {
            Toggle("option 1", isOn: $toggleStates.oneIsOn)
            Toggle("option 2", isOn: $toggleStates.twoIsOn)
            // 可以嵌套 DisclosureGroup 来实现更复杂的树状结构
            DisclosureGroup("detail", isExpanded: $subExpanded) {
                Text("detail 1")
                Text("detail 2")
            }
        }
    }
    
    struct ToggleStates {
        var oneIsOn: Bool = false
        var twoIsOn: Bool = true
    }
    @State
    private var toggleStates = ToggleStates()
    @State
    private var topExpanded: Bool = false
    @State
    private var subExpanded: Bool = true
}

struct DisclosureGroupExample_Previews: PreviewProvider {
    static var previews: some View {
        DisclosureGroupExample()
    }
}
