//
//  TextEditorExample.swift
//  SHSwiftUICode
//
//  Created by 浩 SHI on 2022/01/19.
//

import SwiftUI

struct TextEditorExample: View {
    
    @State
    var stringForTextEdit: String = ""
    
    var body: some View {
       
        VStack {
            
            // 注意，TextEditor 默认会使用流海部分，在排版的时候需要注意
            // （可以去掉上面的 Spacer 尝试一下）
            Spacer()
            
            TextEditor(text: $stringForTextEdit)
                .frame(height: 100)
        
            TextEditor(text: $stringForTextEdit)
               .foregroundColor(Color.orange)
               .font(.system(size: 15))
               .padding(.all, 10).border(Color.orange, width: 2).padding(.all, 10)
            
            // 可以用 .lineLimit, .lineSpacing, .minimumScaleFactor 等
            // modifier 修改行间距或字间距
            
            TextEditor(text: $stringForTextEdit)
               .foregroundColor(Color.gray)
               .font(.system(size: 15))
               .lineSpacing(10)
               .padding(.all, 10).border(Color.black, width: 1)
               .frame(height: 280)
            
        }
      
    }
}

struct TextEditorExample_Previews: PreviewProvider {
    static var previews: some View {
        TextEditorExample()
    }
}
