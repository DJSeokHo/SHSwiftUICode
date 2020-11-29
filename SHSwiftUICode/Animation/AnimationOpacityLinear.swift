//
//  AnimationOpacityLinear.swift
//  SHSwiftUICode
//
//  Created by Seok Ho on 2020/11/29.
//

import SwiftUI

struct AnimationOpacityLinear: View {
    
    @State
    private var factor: Double = 1
    
    @State
    private var alpha: Double = 1
    
    var body: some View {
        
        // 通过scaleEffect、opacity和withAnimation方法，实现linear类型的缩放动画，并设置动画的时长为1秒
        Image("test")
            .scaleEffect(CGFloat(factor))
            .opacity(alpha)
            .onTapGesture(perform: {
                
                withAnimation(.linear(duration: 1.0)) {
                    self.factor += 0.1
                    self.alpha -= 0.2
                }
            })
        
    }
}

struct AnimationOpacityLinear_Previews: PreviewProvider {
    static var previews: some View {
        AnimationOpacityLinear()
    }
}
