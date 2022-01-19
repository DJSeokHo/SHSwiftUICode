//
//  SecureFieldExample.swift
//  SHSwiftUICode
//
//  Created by 浩 SHI on 2022/01/19.
//

import SwiftUI

struct SecureFieldExample: View {
    
    var body: some View {
       
        TextField("id", text: $stringId)
            .autocapitalization(.none)
            .disableAutocorrection(true)
            .padding(10)
            .border(Color(UIColor.separator))
            .padding(10)
        
        // SecureField 类似 TextField，只是不明文显示输入内容，类似密码输入
        // 创建的方式是传入一个描述的 String，再绑定一个用户输入的 String
        // SecureField 也支持绑定一个 onCommit 的回调函数，可以在用户
        // 完成输入的时候（例如点击回车）就自动调用这个函数
        
        Spacer().frame(height: 20)
        
        SecureField(
            "password",
            text: $stringPassword,
            onCommit: {
                checkInput(stringId: stringId, stringPassword: stringPassword)
            }
        ).padding(10)
            .border(Color(UIColor.separator))
            .padding(10)
        
    }
    
    @State
    var stringId: String = ""
    
    @State
    var stringPassword: String = ""
    
    func checkInput(stringId: String, stringPassword: String) {
        ILog.debug(tag: #file, content: "\(stringId) \(stringPassword)")
    }
}

struct SecureFieldExample_Previews: PreviewProvider {
    static var previews: some View {
        SecureFieldExample()
    }
}
