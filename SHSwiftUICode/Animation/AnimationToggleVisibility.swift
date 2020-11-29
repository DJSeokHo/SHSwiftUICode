//
//  AnimationToggleVisibility.swift
//  SHSwiftUICode
//
//  Created by Seok Ho on 2020/11/29.
//

import SwiftUI

struct AnimationToggleVisibility: View {
    
    @State
    private var showingPassword = false
    
    @State
    private var password = ""
    
    var body: some View {
        VStack {
            
            Toggle(isOn: $showingPassword) {
                Text("Toggle Password")
            }
            
            Toggle(isOn: $showingPassword.animation(.spring())) {
                Text("Toggle Password")
            }
            
            // 如果为真，那么就生成一个View, 如果为假，那么不生成任何view
            // 因为状态改变的话，就会刷新 body的状态，所以为假的话，不反悔任何view, 所以输入框就会从屏幕上消失
            if showingPassword {
                createTextField()
            }
          
        }
        .padding()
    }
    
    private func createTextField() -> some View {
        
        print("create")
        
        return TextField("Password", text: $password)
            .padding()
            .border(Color.green, width: 1)
    }
}


struct AnimationToggleVisibility_Previews: PreviewProvider {
    static var previews: some View {
        AnimationToggleVisibility()
    }
}
