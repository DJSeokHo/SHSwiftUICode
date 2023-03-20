//
//  XMCustomButton.swift
//  SHSwiftUICode
//
//  Created by mac on 2023/03/14.
//

import SwiftUI

struct XMCustomButton: View {
    var body: some View {
        
        VStack(alignment: .center, spacing: 20) {
            
            Button(action: {
                
            }, label: {
                Text("DefaultButtonStyle")
            })
            .buttonStyle(DefaultButtonStyle())
            
            
            Button(action: {
                
            }, label: {
                Text("PlainButtonStyle")
            })
            .buttonStyle(PlainButtonStyle())
            
            Button(action: {
                
            }, label: {
                Text("BorderlessButtonStyle")
            })
            .buttonStyle(BorderlessButtonStyle())
            
            Button(action: {
                
            }, label: {
                Text("MyButtonStyle")
            })
            .buttonStyle(MyButtonStyle())
        }
    }
}

private struct MyButtonStyle: ButtonStyle {
    
    
    func makeBody(configuration: Configuration) -> some View {
        
        let isPressed = configuration.isPressed
        
        configuration.label
            .padding()
            .foregroundColor(.black)
            .clipShape(RoundedRectangle(cornerRadius: 10))
            .border(.blue, width: 1)
            .background(isPressed ? Color.blue.opacity(0.5) : Color.white)
            .scaleEffect(isPressed ? 1.2 : 1.0)
    }
    
}

struct XMCustomButton_Previews: PreviewProvider {
    static var previews: some View {
        XMCustomButton()
    }
}
