//
//  AnimationSpeadAndDelay.swift
//  SHSwiftUICode
//
//  Created by Seok Ho on 2020/11/29.
//

import SwiftUI

struct AnimationSpeadAndDelay: View {
    
    @State
    private var factor: Double = 1.0
    
    private var animation: Animation {
        Animation.linear(duration: 1)
//            .speed(1)
//            .speed(5)
            .delay(2)
    }
    
    var body: some View {
        VStack{
            Image("test").scaleEffect(CGFloat(factor)).animation(animation)
            
            Divider().fixedSize()
            
            Button(action: {
                self.factor += 0.2
            }) {
                Text("Zoom In Effect")
            }
        }
    }
}

struct AnimationSpeadAndDelay_Previews: PreviewProvider {
    static var previews: some View {
        AnimationSpeadAndDelay()
    }
}
