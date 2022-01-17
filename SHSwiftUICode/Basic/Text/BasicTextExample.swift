//
//  BasicTextExample.swift
//  SHSwiftUICode
//
//  Created by 浩 SHI on 2022/01/17.
//

import SwiftUI

struct BasicTextExample: View {
    
    var body: some View {
        
        VStack {
            
            
            
            Text("Coding with cat").bold().font(Font.system(size: 20, weight: Font.Weight.bold))
            
            Text("Coding with cat").foregroundColor(Color.orange)
            
            Text("Coding with cat").border(.red, width: 2).padding(6)
            Text("Coding with cat").padding(6).border(.red, width: 2)
            
            Text("Coding with cat").foregroundColor(Color.black).underline().padding(5)
            
        }
       
    }
    
}



struct BasicTextExample_Previews: PreviewProvider {
    static var previews: some View {
        BasicTextExample()
    }
}
