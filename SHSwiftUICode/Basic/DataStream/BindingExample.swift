//
//  BindingExample.swift
//  SHSwiftUICode
//
//  Created by Seok Ho on 2022/01/29.
//

import SwiftUI

struct BindingExample: View {
    
    /**
     有时候我们会把一个视图的属性传至子节点中，但是又不能直接的传递给子节点，因为在 Swift 中值的传递形式是值类型传递方式，也就是传递给子节点的是一个拷贝过的值。但是通过 @Binding 修饰器修饰后，属性变成了一个引用类型，传递变成了引用传递，这样父子视图的状态就能关联起来了。
     */
    
    //例子：BindingExample 和 AnotherExample 是两个不相关的View，他们共同使用一个数据，当该数据发生改变的时候除了要用 @State 告诉 BindingExample 更新UI，还要告诉 AnotherExample 更新UI
    @State
    var helloString = "Hello" // 可以让带 @Binding 注解的属性进行绑定
    
    
    var body: some View {
        
        VStack{
            
            Text(helloString)
            
            Spacer().frame(height: 16)
            
            Button(action: {
                
                self.helloString = "Hello, coding with cat"
                
            }) {
                Text("Button")
            }
            
            Spacer().frame(height: 16)
            
            AnotherExample(helloString: $helloString)
        }

    }
}

struct AnotherExample: View {
    
    // 对包装的值采用传址而不是传值（这里有C语言基础的同学应该可以理解：也就是说传递了变量本身而不是拷贝了数据过去）
    // 所以可以跨view改变UI
    @Binding
    var helloString: String // 可以绑定带 @State 的属性
    
    var body: some View {
        Text(helloString)
    }
}

struct BindingExample_Previews: PreviewProvider {
    static var previews: some View {
        BindingExample()
    }
}
