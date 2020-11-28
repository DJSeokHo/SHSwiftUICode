//
//  BasicTextField.swift
//  SHSwiftUICode
//
//  Created by Seok Ho on 2020/11/28.
//

import SwiftUI

struct BasicTextField: View {
    
    @State var username: String
    @State var nickname: String
    @State var password: String
    
    var body: some View {
        
        VStack{
                            
            Text("Your username is \(username)!")
            Text("Your nickname is \(nickname)!")
            Text("Your password is \(password)")
            
            // user name
            TextField("user name", text: $username, onEditingChanged: { (value) in
                print("onEditingChanged:\(self.username)")
            }) {
                print("onCommit:\(self.username)")
            }.textFieldStyle(RoundedBorderTextFieldStyle())
            
            // nick name
            TextField("nickname", text: $nickname).textFieldStyle(RoundedBorderTextFieldStyle())
            
            // password
            SecureField("password", text: $password) {
                print("Your password is \(self.password)!")
            }
            .textFieldStyle(RoundedBorderTextFieldStyle())
            
        }
        .padding()
        
    }
}

struct BasicTextField_Previews: PreviewProvider {
    static var previews: some View {
        BasicTextField(username: "", nickname: "", password: "")
    }
}
