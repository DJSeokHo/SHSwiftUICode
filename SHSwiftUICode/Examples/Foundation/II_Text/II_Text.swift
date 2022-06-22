//
//  II_Text.swift
//  SHSwiftUICode
//
//  Created by mac on 2022/06/13.
//

import SwiftUI
    
struct II_Text: View {
    
    var body: some View {
       
        VStack(alignment: .center, spacing: 20) {
            
            simpleText
            
            textWithColor
            
            textWithFont
            
            textWithFrame
            
            customText
        }
    }
    
    private var customText: some View {
        
        Text("custom text")
            .foregroundColor(.orange)
            .fontWeight(.bold)
            .font(.system(size: 40))
            .padding()
            .background(.blue)
        
    }
    
    private var textWithFrame: some View {
        
        VStack {
            
            Text("Coding with who?? cat")
                .frame(width: 120)
                .lineLimit(1)
            
            
            Spacer()
                .frame(height: 10)
            
            
            Text("Coding with who?? cat")
                .frame(width: 150)
            
            
            Spacer()
                .frame(height: 15)
            
            
            Text("Coding with who?? cat")
                .frame(width: 300)
            
        }
        
    }
    
    private var textWithFont: some View {
     
        VStack {
          
            Text("This is text with font 1")
                .font(.title)
            
            Text("This is text with font 2")
                .font(.system(size: 22, weight: .bold, design: .rounded))
                .italic()
            
        }
        
    }
    
    
    private var textWithColor: some View {
        
        Text("color text")
            .foregroundColor(.orange)
    }
    
    
    private var simpleText: some View {
        
        Text("Hello, Coding with cat!")
        
    }
    
}

struct II_Text_Previews: PreviewProvider {
    static var previews: some View {
        II_Text()
    }
}
