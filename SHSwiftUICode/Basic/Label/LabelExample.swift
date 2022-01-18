//
//  LabelExample.swift
//  SHSwiftUICode
//
//  Created by 浩 SHI on 2022/01/18.
//

import SwiftUI

struct LabelExample: View {
    var body: some View {
        
        VStack {
            
            Label("What a warm day", systemImage: "sun.max")
            
            Spacer().frame(height: 20)
            
            Label(title: {
                Text("Coding")
                    .foregroundColor(Color.red).frame(height: 60, alignment: Alignment.center)
                Text("with").foregroundColor(Color.green).frame(height: 60, alignment: Alignment.center)
                Text("cat").foregroundColor(Color.blue).font(Font.system(size: 30)).bold().frame(height: 60, alignment: Alignment.center)
            }, icon: {
                
                Image("coding_with_cat")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 60, height: 60, alignment: Alignment.center)
                    .clipShape(Circle())
                    .shadow(radius: 7)
            }).padding().border(Color.orange)
            
            Spacer().frame(height: 20)
            
            Label(title: {
                Text("Coding with cat")
                    .foregroundColor(Color.white).font(Font.system(size: 15)).bold().italic().frame(height: 60, alignment: Alignment.center)
            }, icon: {
                
                Image("coding_with_cat")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 60, height: 60, alignment: Alignment.center)
                    .clipShape(Circle())
                    .shadow(radius: 7)
            })
                .padding()
                .background(LinearGradient(gradient: Gradient(colors: [Color.red, Color.blue]), startPoint: .leading, endPoint: .trailing))
                .cornerRadius(60)
                .padding(8).overlay(
                    RoundedRectangle(cornerRadius: 54)
                        .stroke(LinearGradient(gradient: Gradient(colors: [Color.blue, Color.red]), startPoint: .leading, endPoint: .trailing), lineWidth: 6)
                )
        }
    }
}

struct LabelExample_Previews: PreviewProvider {
    static var previews: some View {
        LabelExample()
    }
}
