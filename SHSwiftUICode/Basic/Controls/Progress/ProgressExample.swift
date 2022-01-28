//
//  ProgressExample.swift
//  SHSwiftUICode
//
//  Created by 浩 SHI on 2022/01/21.
//

import SwiftUI

struct ProgressExample: View {
    var body: some View {
       
        VStack {
            
            // 显示当前的进度，在这个例子中，每点击一下下面的按钮
            // 进度条就会随着 progress 的增加而增加了。
            // value 需要的是一个 0 到 1 之间的数
            //
            // 注意 ProgressView 不会改变传入的值，所以这里传入的不是绑定值
            
            ProgressView(value: progress)
            
            Spacer().frame(height: 20)
            
            Button("plus", action: {
                progress += 0.05
                
            })
            
            Spacer().frame(height: 20)
            
            // 如果不确定进度的话，可以不传入 value，这样就会显示一个
            // 空转的进度环了。
            ProgressView()
            
            Spacer().frame(height: 20)
            
            ProgressView(value: 0.75).progressViewStyle(DarkBlueShadowProgressViewStyle())
            
            Spacer().frame(height: 20)
            
            ProgressView().progressViewStyle(DarkBlueShadowProgressViewStyle())
        }
    }
    
    struct DarkBlueShadowProgressViewStyle: ProgressViewStyle {
        func makeBody(configuration: Configuration) -> some View {
            ProgressView(configuration)
                .shadow(color: Color(red: 1, green: 0, blue: 0),
                        radius: 5.0, x: 1.0, y: 2.0)
        }
    }
    
    @State
    private var progress = 0.1
}

struct ProgressExample_Previews: PreviewProvider {
    static var previews: some View {
        ProgressExample()
    }
}
