//
//  KeyframesAnimation.swift
//  SHSwiftUICode
//
//  Created by SeokHo on 2/26/24.
//

import SwiftUI

struct KeyframesAnimation: View {
    
    @State
    private var startKeyframeAnimation: Bool = false
    
    var body: some View {
        
        VStack {
            
            Spacer()
            
            Image("coding_with_cat")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 200, height: 200)
                .keyframeAnimator(initialValue: Keyframe(), trigger: startKeyframeAnimation) { view, keyFrame in // keyframe 是我们新建的那个类
                    
                    view
                        .scaleEffect(keyFrame.scale)
                        .rotationEffect(keyFrame.rotation, anchor: .bottom)
                        .offset(y: keyFrame.offsetY)
                        // reflection
                        .background {
                            view
                                .blur(radius: 3)
                                .rotation3DEffect(
                                    .init(degrees: 180),
                                    axis: (x: 1.0, y: 0.0, z: 0.0)
                                )
                                .mask(
                                    {
                                        LinearGradient(
                                            colors: [
                                                .white.opacity(keyFrame.reflectionOpacity),
                                                .white.opacity(keyFrame.reflectionOpacity - 0.3),
                                                .white.opacity(keyFrame.reflectionOpacity - 0.45),
                                            ], startPoint: .top, endPoint: .bottom
                                        )
                                    }
                                )
                                .offset(y: 195)
                        }
                    
                } keyframes: { frame in
                    
                    // 3种动画混合，每种有6个关键帧
                    
                    KeyframeTrack(\.offsetY) {
                            
                        CubicKeyframe(10, duration: 0.15)
                        SpringKeyframe(-100, duration: 0.3, spring: .bouncy)
                        SpringKeyframe(-100, duration: 0.1, spring: .bouncy)
                        SpringKeyframe(-100, duration: 0.1, spring: .bouncy)
                        SpringKeyframe(-100, duration: 0.1, spring: .bouncy)
                        SpringKeyframe(0, duration: 0.3, spring: .bouncy)
                    }
                    
                    KeyframeTrack(\.scale) {
                        CubicKeyframe(0.9, duration: 0.15)
                        CubicKeyframe(1.2, duration: 0.3)
                        CubicKeyframe(1.2, duration: 0.1)
                        CubicKeyframe(1.2, duration: 0.1)
                        CubicKeyframe(1.2, duration: 0.1)
                        CubicKeyframe(1, duration: 0.3)
                    }
                
                    KeyframeTrack(\.rotation) {
                        CubicKeyframe(.zero, duration: 0.15)
                        CubicKeyframe(.zero, duration: 0.3)
                        CubicKeyframe(.init(degrees: -20), duration: 0.1)
                        CubicKeyframe(.init(degrees: 20), duration: 0.1)
                        CubicKeyframe(.init(degrees: -20), duration: 0.1)
                        CubicKeyframe(.init(degrees: 0), duration: 0.15)
                    }
                    
                    KeyframeTrack(\.reflectionOpacity) {
                        CubicKeyframe(0.5, duration: 0.15)
                        CubicKeyframe(0.3, duration: 0.75)
                        CubicKeyframe(0.5, duration: 0.3)
                    }
                }
                
            Spacer()
            
            Button(action: {
                startKeyframeAnimation.toggle()
            }, label: {
                Text("Keyframes Animation")
            })
            .fontWeight(.bold)
        }
        .padding()
    }
}

struct Keyframe {
    var scale: CGFloat = 1
    var offsetY: CGFloat = 0
    var rotation: Angle = .zero
    var reflectionOpacity: CGFloat = 0.5
}

#Preview {
    KeyframesAnimation()
}
