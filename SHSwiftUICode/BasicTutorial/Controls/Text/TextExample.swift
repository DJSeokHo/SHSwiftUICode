//
//  BasicTextExample.swift
//  SHSwiftUICode
//
//  Created by 浩 SHI on 2022/01/17.
//

import SwiftUI

struct TextExample: View {
    
    var body: some View {
        
        VStack {
            
            Text("Coding with cat")
                .font(Font.system(size: 20, weight: Font.Weight.bold))
                .italic()
                .bold()
            
            Text("Coding with cat")
                .foregroundColor(Color.orange)
                .font(Font.custom("Monaco", size: 30))
            
            // 可以看见，padding的作用类似于margin
            Text("Coding with cat").border(.red, width: 2).padding(.all, 6) // 先border 再padding
            Text("Coding with cat").padding(.all, 6).border(.red, width: 2) // 先padding 再border
            
            Text("Coding with cat").underline().padding(.all, 5).foregroundColor(Color.black)
            
            Text("Coding with cat").frame(width: 100)
            Text("Coding with cat").frame(width: 100).lineLimit(1)
        }
        .frame(
            minWidth: 0,
            maxWidth: .infinity,
            minHeight: 0,
            maxHeight: .infinity,
            alignment: Alignment.center
        )
        .background(Color.gray)
       
    }
    
}



struct TextExample_Previews: PreviewProvider {
    static var previews: some View {
        TextExample()
    }
}
