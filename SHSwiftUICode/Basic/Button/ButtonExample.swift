//
//  BasicButtonExample.swift
//  SHSwiftUICode
//
//  Created by 浩 SHI on 2022/01/18.
//

import SwiftUI

struct ButtonExample: View {
    var body: some View {
        
        VStack {
            
            Button(action: {
                print(#file, "coding with cat")
            }, label: {
                Text("Coding with cat")
            })
            
            Spacer().frame(height: 10)
            
            Button(action: greating, label: {
                Text("Greating")
            }).buttonStyle(PlainButtonStyle())
            
            Button(action: {
                print(#file, "Color button")
            }, label: {
                Text("Color button").foregroundColor(Color.white)
            }).frame(width: 150, height: 100, alignment: .center).background(Color.orange)
            
            Button(action: {
                print(#file, "Rounded button")
            }, label: {
                Text("Rounded button")
                    .foregroundColor(Color.white)
                    .font(Font.system(size: 15)).bold()
            }).frame(width: 150, height: 40, alignment: .center).background(Color.black).cornerRadius(50)
            
            Button(action: {
                print(#file, "Circle button")
            }, label: {
                Text("Circle button")
                    .foregroundColor(Color.white)
                    .font(Font.system(size: 20)).bold()
            }).frame(width: 150, height: 150, alignment: .center).background(Color.red).clipShape(Circle())
            
            Button(action: {
                print(#file, "Rounded button")
            }, label: {
                Text("Rounded button")
                    .foregroundColor(Color.white)
                    .font(Font.system(size: 15)).bold()
            }).frame(width: 150, height: 40, alignment: .center)
                .background(LinearGradient(gradient: Gradient(colors: [Color.red, Color.blue]), startPoint: .leading, endPoint: .trailing))
                .cornerRadius(50)
        }
        .frame(
            minWidth: 0,
            maxWidth: .infinity,
            minHeight: 0,
            maxHeight: .infinity,
            alignment: Alignment.center
        )
        .background(Color.white)
    }
    
    func greating() {
        print(#file, "hello")
    }
}

struct ButtonExample_Previews: PreviewProvider {
    static var previews: some View {
        ButtonExample()
    }
}
