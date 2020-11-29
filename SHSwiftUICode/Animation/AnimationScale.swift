//
//  AnimationScale.swift
//  SHSwiftUICode
//
//  Created by Seok Ho on 2020/11/29.
//

import SwiftUI

struct AnimationScale: View {
    
    @State
    private var factor: CGFloat = 1
    
    var body: some View {
        
        VStack {
            Image("test")
                .scaleEffect(factor)
                .animation(.default)
            
            Divider().fixedSize()
            
            Button(action: {
                self.factor += 0.2
            }, label: {
                Text("Zoom in")
            })
        }
    }
}

struct AnimationScale_Previews: PreviewProvider {
    static var previews: some View {
        AnimationScale()
    }
}
