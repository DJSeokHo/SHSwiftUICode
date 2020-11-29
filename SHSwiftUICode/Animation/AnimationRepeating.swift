//
//  AnimationRepeating.swift
//  SHSwiftUICode
//
//  Created by Seok Ho on 2020/11/29.
//

import SwiftUI

struct AnimationRepeating: View {
    
    @State
    private var angle: Double = 0
    
    private var animation: Animation {
        Animation.spring()
             .repeatForever()
//            .repeatForever(autoreverses: false)
//            .repeatCount(3)
    }
    
    var body: some View {
        VStack{
            Image("test")
                .rotationEffect(Angle.init(degrees: angle))
                .animation(animation)
            
            Divider().fixedSize()
            
            Button(action: {
                self.angle += 45
            }) {
                Text("Repeat Forever Effect")
            }
        }
    }
}

struct AnimationRepeating_Previews: PreviewProvider {
    static var previews: some View {
        AnimationRepeating()
    }
}
