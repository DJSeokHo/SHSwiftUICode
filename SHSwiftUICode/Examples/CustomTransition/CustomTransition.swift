//
//  CustomTransition.swift
//  SHSwiftUICode
//
//  Created by SeokHo on 2/26/24.
//

import SwiftUI

struct CustomTransition: View {
    
    @State
    private var showView: Bool = false
    
    @State
    private var value: CGFloat = 0
    
    var body: some View {
        
        VStack{
          
            if showView {
                Rectangle()
                    .fill(.red.gradient)
                    .frame(width: 150, height: 150)
                    .clipShape(.rect(topLeadingRadius: 20))
                    .transition(MyTransition())
            }
            
            Button(action: {
                
                withAnimation(.bouncy, completionCriteria: .logicallyComplete) {
                    
                    showView.toggle()
                    
                    value = 10
                    
                } completion: {
                    ILog.debug(tag: #file, content: "animation completed")
                }
            }, label: {
                Text("Show View")
            })
        }
        // 监听值的变化
        .onChange(of: value, initial: true, { oldValue, newValue in
            ILog.debug(tag: #file, content: "\(oldValue) \(newValue)")
        })
    }
}

struct MyTransition: Transition {
    
    func body(content: Content, phase: TransitionPhase) -> some View {
        content
            // add animation: 沿x轴进行3D旋转
            .rotation3DEffect(
                .init(degrees: phase.value * (phase == .willAppear ? 90 : -90)), axis: (x: 1.0, y: 0.0, z: 0.0)
            )
    }
}

#Preview {
    CustomTransition()
}
