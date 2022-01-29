//
//  ObservedObjectExample.swift
//  SHSwiftUICode
//
//  Created by Seok Ho on 2022/01/29.
//

import SwiftUI

struct ObservedObjectExample: View {
    
    /**
     注意⚠️：ObservableObject不是属性包装器，而是一个协议，满足协议的类(Class) 中使用 @Publish 标记可能发生改变的属性。
     
     用 @Publish 标记类(Class)中希望监听的属性

     用 @ObservedObject 包装该类(Class)的实例，
     当这个实例的某些被 @Publish 标记的属性发生改变，
     （Publisher发布者）会在该实例被改变之前广播给UI(数据的订阅者)
     
     相比@State解决了哪些问题呢：这里借用喵神(onevcat.com)的一句话：
     如果你需要在多个 View 中共享数据，@State可能不是很好的选择;如果还需要在 View 外部操作数据，那么 @State 甚至就不是可选项了。含有少数几个成员变量的值类型，也许使用 @State 也还不错。但是对于更复杂的情况，例如含有很多属性和方法的类型，可能其 中只有很少几个属性需要触发 UI 更新，也可能各个属性之间彼此有关联，那 么我们应该选择引用类型和更灵活的可自定义方式。
     */
    @ObservedObject
    var developer = Developer()
    
    var body: some View {
        VStack {
            Text(developer.name)
            Text("\(developer.age)")
            
            Button(action: {
                self.developer.test()
            }, label: {
                Text("Button")
            })
        }
    }
}

struct ObservedObjectExample_Previews: PreviewProvider {
    static var previews: some View {
        ObservedObjectExample()
    }
}
