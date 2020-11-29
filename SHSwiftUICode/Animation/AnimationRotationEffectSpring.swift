//
//  AnimationRotationEffectSpring.swift
//  SHSwiftUICode
//
//  Created by Seok Ho on 2020/11/29.
//

import SwiftUI

struct AnimationRotationEffectSpring: View {
    
    @State
    private var angle: Double = 0
    
    var body: some View {
        VStack{
            Image("test")
            .rotationEffect(Angle.init(degrees: angle))
            .animation(.spring())
            
            Divider().fixedSize()
            
            Button(action: {
                self.angle += 90
            }) {
                Text("Rotation Effect")
            }
        }
    }
}

struct AnimationRotationEffectSpring_Previews: PreviewProvider {
    static var previews: some View {
        AnimationRotationEffectSpring()
    }
}
