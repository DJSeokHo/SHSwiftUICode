//
//  ExtensionCustomView.swift
//  SHSwiftUICode
//
//  Created by Seok Ho on 2020/12/02.
//

import SwiftUI

struct MyComponen: View {
    
    @Binding var type: String
    var action: (() -> Void)?
    
    var body: some View {
        VStack {
            Text("type is: \(type)")
            if nil != action {
                Button(action: action!) {
                    Text("Type")
                }
            }
        }
    }
}

extension MyComponen {

    func foo(perform action: @escaping () -> Void ) -> Self {
         var copy = self
         copy.action = action
         return copy
     }
}

struct ExtensionCustomView: View {
    
    @State var message = "type 2"
    
    var body: some View {
        VStack {
            MyComponen(type: .constant("type 1"))
            MyComponen(type: $message).foo(perform: {
                print(">> got action")
            })
        }
    }
}

struct ExtensionCustomView_Previews: PreviewProvider {
    static var previews: some View {
        ExtensionCustomView()
    }
}
