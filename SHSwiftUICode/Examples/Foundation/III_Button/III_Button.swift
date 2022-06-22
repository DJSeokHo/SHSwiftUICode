//
//  III_Button.swift
//  SHSwiftUICode
//
//  Created by mac on 2022/06/22.
//

import SwiftUI


struct III_Button: View {
    
    var body: some View {
        
        VStack {
            
            simpleButton
            
            Spacer()
                .frame(height: 10)
            
            colorButton
            
            Spacer()
                .frame(height: 10)
            
            styleButton
            
            Spacer()
                .frame(height: 10)
            
            cornerButton
            
        }
    }
    
    var cornerButton: some View {
        
        HStack {
            
            Button(action: {
                
            }, label: {
                
                Text("button")
            })
            .frame(height: 30)
            .padding()
            .background(.black)
            .foregroundColor(.white)
            .clipShape(RoundedRectangle(cornerRadius: 6))
            
            Spacer()
                .frame(width: 20)
            
            Button(action: {
                
            }, label: {
                
                Text("button")
                    .font(.system(size: 30, weight: .bold, design: .rounded))
                    .padding(.horizontal, 20)
            })
            .frame(height: 50)
            .padding()
            .background(.black)
            .foregroundColor(.white)
            .clipShape(RoundedRectangle(cornerRadius: 50))
        }
        
       
        
    }
    
    var styleButton: some View {
        
        Button(action: {
            
        }, label: {
            Text("Style button")
        })
        .buttonStyle(PlainButtonStyle())
        
    }
    
    var colorButton: some View {
        
        Button(action: {
            
        }, label: {
            Text("Color button")
        })
        .padding()
        .background(.orange)
        .foregroundColor(.white)
        .font(.system(size: 30, weight: .bold, design: .rounded))
    }
    
    var simpleButton: some View {
        
        Button(action: {
            onSimpleButtonClick()
        }, label: {
            Text("Simple Button")
        })
    }
    
    func onSimpleButtonClick() {
        
        ILog.debug(tag: #file, content: "click")
    }
}

struct III_Button_Previews: PreviewProvider {
    static var previews: some View {
        III_Button()
    }
}
