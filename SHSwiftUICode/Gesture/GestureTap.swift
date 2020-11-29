//
//  GestureTap.swift
//  SHSwiftUICode
//
//  Created by Seok Ho on 2020/11/29.
//

import SwiftUI

struct GestureTap: View {
    
    @State
    private var isPressed = false
    
    @State
    private var angle = 0.0
    
    @State
    private var offset: CGSize = .zero
    
    @GestureState var isLongPressed = false
    
    var body: some View {
        
        let tapGesture = TapGesture().onEnded({
            _ in
            self.isPressed.toggle()
        })
        
        let rotationGesture = RotationGesture(minimumAngleDelta: Angle.init(degrees: 20))
            .onChanged({
                (angle) in
                self.angle += angle.animatableData
            }).onEnded {
                (angle) in
                print(self.angle)
            }
        
        let dragGesture = DragGesture()
            .onChanged { (value) in
                print(value.startLocation, value.location, value.translation)
                self.offset = value.translation
            }
            .onEnded { (value) in
                if(abs(value.translation.width) >= 40 || abs(value.translation.height - (-260)) >= 40){
                    self.offset = .zero
                }
                else{
                    self.offset = CGSize(width: 0, height: -260)
                }
            }
        
        VStack {
            Circle()
                .fill(Color.orange)
                .frame(width: 100, height: 100)
                .gesture(tapGesture)
                .scaleEffect(isPressed ? 1.4 : 1)
                .animation(.default)
            
            Circle()
                .fill(Color.orange)
                .frame(width: 100, height: 100)
                .scaleEffect(isPressed ? 1.4 : 1)
                .animation(.default)
                .onTapGesture(count: 2) {
                    self.isPressed.toggle()
                    print("Double tap.")
                }
            
            Circle()
                .fill(Color.orange)
                .frame(width: 100, height: 100)
                .onLongPressGesture {
                    self.isPressed.toggle()
                    print("Long press.")
                }
                .scaleEffect(isPressed ? 1.4 : 1)
                .animation(.default)
                
            Image("test")
                .resizable().frame(width: 100, height: 100, alignment: .center)
                .gesture(rotationGesture)
                .rotationEffect(Angle.init(degrees: self.angle))
             
        }
        
        VStack{
            Circle()
                .fill(Color.black)
                .opacity(0.1)
                .frame(width: 200, height: 200)
                .offset(CGSize(width: 0, height: -50))
            
            Circle()
                .fill(Color.orange)
                .frame(width: 200, height: 200)
                .offset(offset)
                .gesture(dragGesture)
                .animation(.spring())
        }
    }
}

struct GestureTap_Previews: PreviewProvider {
    static var previews: some View {
        GestureTap()
    }
}
