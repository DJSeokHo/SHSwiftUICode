//
//  ScrollViewWithTransition.swift
//  SHSwiftUICode
//
//  Created by SeokHo on 2/26/24.
//

import SwiftUI

struct ScrollViewWithTransition: View {
    
    var body: some View {
        
        ScrollView(.vertical) {
            
            LazyVStack {
                
                ForEach(1...30, id: \.self) { _ in
                    
                    Rectangle()
                        .fill(.red.gradient)
                        .frame(height: 185)
                        // 上面的项快滑出屏幕时保持特性，没有动画，下面的项快画出屏幕或者快出现时采用动画，动画的采用淡入淡出，phase 用于值的控制
                        .scrollTransition(topLeading: .identity, bottomTrailing: .animated) { view, phase in
                            
                            view
                                .opacity(1 - (phase.value < 0 ? -phase.value : phase.value))
                        }
                }
                .padding(.horizontal, 30)
            }
        }
    }
}

#Preview {
    ScrollViewWithTransition()
}
