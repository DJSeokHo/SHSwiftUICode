//
//  FormExample.swift
//  SHSwiftUICode
//
//  Created by 浩 SHI on 2022/01/28.
//

import SwiftUI

struct FormExample: View {
    
    @State
    var id = ""
    
    @State
    var password = ""
    
    func register() {
        print("register \(id) \(password)")
    }
    
    func login() {
        print("login \(id) \(password)")
    }
    
    var body: some View {
       
        // Form 用于分组显示控件，适合用在设置栏这样的场景。
        // SwiftUI 会自动显示适合平台习惯的 UI，例如在 iOS 中，就是分组的 List
        Form {
            
            Section {
                
                TextField("id", text: $id)
                SecureField("password", text: $password)
                
            }
            
            Section {
                Text("login").onTapGesture {
                    login()
                }
                Text("register").onTapGesture {
                    register()
                }
            }
            
        }
        
    }
}

struct FormExample_Previews: PreviewProvider {
    static var previews: some View {
        FormExample()
    }
}
