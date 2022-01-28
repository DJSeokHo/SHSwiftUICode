//
//  ScrollViewExample.swift
//  SHSwiftUICode
//
//  Created by 浩 SHI on 2022/01/28.
//

import SwiftUI

/**
    ScrollView 用来把视图变得可以按指定方向滚动
    初始化的参数中：
    第一个值是用来指定滚动方向的，默认为 .vertical，
    第二个 showIndicators 控制是否显示滚动时的光标，默认是开启的
    
    注意，普通的 VStack 是不能滚动的，可以把
    ScrollView 换成 VStack 试一下
 */
struct ScrollViewExample: View {
    var body: some View {
        
        ScrollView([.vertical, .horizontal], showsIndicators: true) {
//        VStack {
            
            Text("Top")
            HStack {
                Text("Left")
                Rectangle().fill(Color.orange).frame(width: 1000, height: 1500)
                Text("Right")
            }
            Text("Bottom")
        }
        
    }
}

struct ScrollViewExample_Previews: PreviewProvider {
    static var previews: some View {
        ScrollViewExample()
    }
}
