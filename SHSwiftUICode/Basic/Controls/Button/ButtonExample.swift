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
            
            Group {
                Button(action: {
                    print(#file, "coding with cat")
                }, label: {
                    Text("Coding with cat")
                })
                
                Spacer().frame(height: 10)
                
                // 扁平文字样式按钮
                Button(action: greating, label: {
                    Text("Greating")
                }).buttonStyle(PlainButtonStyle())
            }
            
            Spacer().frame(height: 10)
            
            // 颜色背景按钮
            Button(action: {
                print(#file, "Color button")
            }, label: {
                Text("Color button").foregroundColor(Color.white)
            }).frame(width: 150, height: 100, alignment: .center).background(Color.orange)
            
            Spacer().frame(height: 10)
            
            Group {
                
                Button(action: {
                    print(#file, "Rounded button")
                }, label: {
                    Text("Rounded button")
                        .foregroundColor(Color.white)
                        .font(Font.system(size: 15)).bold()
                }).frame(width: 150, height: 40, alignment: .center).background(Color.black).cornerRadius(50)
                
                Spacer().frame(height: 10)
                
                Button(action: {
                    print(#file, "Rounded corner button")
                }, label: {
                    Text("Rounded corner button")
                        .foregroundColor(Color.white)
                        .font(Font.system(size: 15)).bold()
                        .padding(.vertical, 10)
                        // 在button内部的文字使用padding就像安卓的button用padding, 即：按钮的内边距
                }).frame(width: 150, alignment: .center).background(Color.black).cornerRadius(6)
                
            }
           
            Spacer().frame(height: 10)
            
            Button(action: {
                print(#file, "Circle button")
            }, label: {
                Text("Circle button")
                    .foregroundColor(Color.white)
                    .font(Font.system(size: 20)).bold()
            }).frame(width: 150, height: 150, alignment: .center).background(Color.red).clipShape(Circle())
            
            Spacer().frame(height: 10)
            
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
