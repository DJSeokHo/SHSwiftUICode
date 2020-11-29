//
//  AnimationAsymmetricTransition.swift
//  SHSwiftUICode
//
//  Created by Seok Ho on 2020/11/29.
//

import SwiftUI

struct AnimationAsymmetricTransition: View {
    
    @State var showPicture = false
    
    var body: some View {
        VStack {
            Button(action: {
                withAnimation {
                    self.showPicture.toggle()
                }
            }) {
                Text("Show picture")
            }

            if showPicture {
//                Image("logo")
                
//                Image("logo")
//                    .transition(.move(edge: .top))
                
//                Image("logo")
//                    .transition(.scale(scale: 0))
                
//                Image("logo")
//                    .transition(.slide)
                
//                Image("logo")
//                    .transition(.asymmetric(insertion: .scale(scale: 0), removal: .slide))
                
                Image("test")
                    .transition(AnyTransition.scale(scale: 0).combined(with:.slide))
            }
        }
    }
}

struct AnimationAsymmetricTransition_Previews: PreviewProvider {
    static var previews: some View {
        AnimationAsymmetricTransition()
    }
}
