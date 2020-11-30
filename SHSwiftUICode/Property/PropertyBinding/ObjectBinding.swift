//
//  ObjectBinding.swift
//  SHSwiftUICode
//
//  Created by Seok Ho on 2020/11/30.
//

import SwiftUI

class UserModel: ObservableObject {
    @Published var nickName: String = ""
}

struct ObjectBinding: View {
    
    @ObservedObject var model = UserModel()
    @State var isPresented = false
    

    var body: some View {
        
        VStack {
            TextField("Your nickname", text: $model.nickName)
            .padding()
            
            Button(action: {
                self.isPresented = true
            }) {
                Text("Show")
            }.alert(isPresented: $isPresented) { () -> Alert in
                
                Alert(title: Text("Your nickname"),
                     message: Text("\(self.model.nickName)"),
                     dismissButton: Alert.Button.default(Text("OK")) {
                        print("dismiss")
                        self.isPresented = false
                     })
            }
        }
        
    }
}

struct ObjectBinding_Previews: PreviewProvider {
    static var previews: some View {
        ObjectBinding()
    }
}
