//
//  AnimationOffsetEaseOut .swift
//  SHSwiftUICode
//
//  Created by Seok Ho on 2020/11/29.
//

import SwiftUI

struct AnimationOffsetEaseOut: View {
    
    @State
    private var distance: Double = 0
    
    var body: some View {
        VStack{
            Image("test")
                .offset(x: 0, y: CGFloat(distance))
                .animation(.easeOut(duration: 2))
            
            Divider().fixedSize()
            
            Button(action: {
                self.distance -= 120
            }) {
                Text("Move Effect")
            }
            
        }
    }
}

struct AnimationOffsetEaseOut_Previews: PreviewProvider {
    static var previews: some View {
        AnimationOffsetEaseOut()
    }
}
