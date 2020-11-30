//
//  PropertyObservedObjectDemo.swift
//  SHSwiftUICode
//
//  Created by Seok Ho on 2020/11/30.
//

import SwiftUI

/*
 @ObservedObject 的用处和 @State 非常相似
 从名字看来它是来修饰一个对象的，这个对象可以给多个独立的 View 使用
 如果你用 @ObservedObject 来修饰一个对象，那么那个对象必须要实现 ObservableObject 协议，然后用 @Published 修饰对象里属性，表示这个属性是需要被 SwiftUI 监听的
 */
struct PropertyObservedObjectDemo: View {
    
    @ObservedObject
    private var stopwatch = StopWatch()
    
    var body: some View {
        
        ZStack {
            Color.black
            VStack {
                
                HStack {
                    
                    Button(action: {
                        self.stopwatch.start()
                    }) {
                        Text("Start")
                    }
                    
                    Spacer().fixedSize()
                    
                    Button(action: {
                        self.stopwatch.stop()
                    }) {
                        Text("Stop")
                    }
                    
                    Spacer().fixedSize()
                    
                    Button(action: {
                        self.stopwatch.reset()
                    }) {
                        Text("Reset")
                    }
                }
                
                Text("\(self.stopwatch.counter)")
                    .foregroundColor(Color.white)
                
            }.font(.largeTitle)
        }
        .edgesIgnoringSafeArea(.all)
        
    }
}

struct PropertyObservedObjectDemo_Previews: PreviewProvider {
    static var previews: some View {
        PropertyObservedObjectDemo()
    }
}

