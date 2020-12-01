//
//  ObjectBinding.swift
//  SHSwiftUICode
//
//  Created by Seok Ho on 2020/11/30.
//

import SwiftUI

/*
 @ObservedObject 的用处和 @State 非常相似
 从名字看来它是来修饰一个对象的，这个对象可以给多个独立的 View 使用
 如果你用 @ObservedObject 来修饰一个对象，那么那个对象必须要实现 ObservableObject 协议，然后用 @Published 修饰对象里属性，表示这个属性是需要被 SwiftUI 监听的
 */

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
