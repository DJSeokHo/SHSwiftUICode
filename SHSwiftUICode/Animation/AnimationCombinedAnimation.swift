//
//  AnimationCombinedAnimation.swift
//  SHSwiftUICode
//
//  Created by Seok Ho on 2020/11/29.
//

import SwiftUI

struct AnimationCombinedAnimation: View {
    
    @State
    private var radius: Double = 0
    
    @State
    private var brightness: Double = 0
    
    var body: some View {
        
        VStack{
            Image("test")
                .shadow(radius: CGFloat(radius))
                .brightness(brightness)
                .animation(.linear(duration: 2))
            
            Divider().fixedSize()
            
//            Button(action: {
//                self.radius += 10
//                self.brightness = 1
//
//                test()
//            }) {
//                Text("Move Effect")
//            }
            
            Button("Move Effect") {
                self.radius += 10
                self.brightness = 1
                test()
            }
            
        }
    }
    
    private func test() {
        print("test test test")
    }
}

struct AnimationCombinedAnimation_Previews: PreviewProvider {
    static var previews: some View {
        AnimationCombinedAnimation()
    }
}
