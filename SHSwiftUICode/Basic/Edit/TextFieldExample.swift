//
//  TextFieldExample.swift
//  SHSwiftUICode
//
//  Created by 浩 SHI on 2022/01/19.
//

import SwiftUI

struct TextFieldExample: View {
    /*
     TextField 负责单行的文本输入。除去传入描述信息和绑定的字符串
     text 之外，还可以传入 onEditingChanged 和 onCommit 这
     两个回调函数，前者会在用户开始编辑和结束编辑的时候被调用，后者
     则是会在用户点击回车的时候被调用。
     */
    @State
    private var stringOne: String = ""
    
    @State
    private var isEditing = false
    
    var body: some View {
        
        VStack {
            
            TextField(
                "Input 1",
                text: $stringOne,
                onEditingChanged: { isEditing in
                    self.isEditing = isEditing
                },
                onCommit: {
                    ILog.debug(tag: #file, content: stringOne)
                }
            ).keyboardType(.webSearch)
                .padding(10)
                .autocapitalization(.none)
                .border(isEditing ? .orange : .black, width: 1)
                .disableAutocorrection(true)
                .padding(10)
            
            Text(stringOne)
                .foregroundColor(isEditing ? .orange : .black)
                .fontWeight(isEditing ? .bold : .regular)
               
            Spacer().frame(height: 20)
            
        }
        .frame(
            minWidth: 0,
            maxWidth: .infinity,
            minHeight: 0,
            maxHeight: .infinity,
            alignment: Alignment.center
        )
    }
}

struct TextFieldExample_Previews: PreviewProvider {
    static var previews: some View {
        TextFieldExample()
    }
}
