//
//  StateExample.swift
//  SHSwiftUICode
//
//  Created by Seok Ho on 2022/01/29.
//

import SwiftUI

struct StateExample: View {
    
    /**
     被 @State 包装的值发生改变时，UI将被同时改变
     通过使用 @State 修饰器我们可以关联出 View 的状态. SwiftUI 将会把使用过 @State 修饰器的属性存储到一个特殊的内存区域，并且这个区域和 View struct 是隔离的. 当 @State 装饰过的属性发生了变化，SwiftUI 会根据新的属性值重新创建视图
     */
    @State
    var helloString: String = "Hello"
    
    var body: some View {
        VStack {
            
            Text(helloString)
            
            Button(action: {
                self.helloString.append(" coding with cat")
            }, label: {
                Text("Button")
            })
            
        }
    }
   
}

struct StateExample_Previews: PreviewProvider {
    static var previews: some View {
        StateExample()
    }
}
