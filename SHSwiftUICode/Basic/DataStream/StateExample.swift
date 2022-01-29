//
//  StateExample.swift
//  SHSwiftUICode
//
//  Created by Seok Ho on 2022/01/29.
//

import SwiftUI

struct StateExample: View {
    
    // 被@State包装的值发生改变时，UI将被同时改变
    @State
    var helloString: String = "Hello"
    
    var body: some View {
        VStack {
            
            Text(helloString)
            
            Button(action: {
                self.helloString.append(" coding with cat")
            }, label: {
                Text("Button")
            })
            
        }
    }
   
}

struct StateExample_Previews: PreviewProvider {
    static var previews: some View {
        StateExample()
    }
}
