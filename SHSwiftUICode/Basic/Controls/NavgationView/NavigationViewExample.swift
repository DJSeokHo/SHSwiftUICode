//
//  NavigationViewExample.swift
//  SHSwiftUICode
//
//  Created by 浩 SHI on 2022/01/28.
//

import SwiftUI

struct NavigationViewExample: View {
    var body: some View {
        Text("")
        // NavigationView 本身没有什么需要配置的，关键在于如何和其内部的视图
        // 相配合。这些配合模式分别在其他的文件中介绍了：
        //
        // 如何在 NavigationView 中使用 NavigationLink
        // 详见 NavigationLink.swift
//        BasicNavigationLink()
        // 如何在 NavigationView 中实现编辑模式的插入和移动顺序
        // 详见 EditButton.swift
//        BasicEditButton()
        // 如何在 NavigationView 中实现编辑模式的选择
        // 详见 NavigationView.swift
//        SelectionList()
        // 注意，嵌套 Navigation 的时候只需要一个 NavigationView，
        // 不然会导致在上方出现多个返回的视图。
    }
}

struct NavigationViewExample_Previews: PreviewProvider {
    static var previews: some View {
        NavigationViewExample()
    }
}
