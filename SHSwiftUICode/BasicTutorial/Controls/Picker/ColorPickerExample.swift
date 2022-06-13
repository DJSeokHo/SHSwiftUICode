//
//  ColorPickerExample.swift
//  SHSwiftUICode
//
//  Created by 浩 SHI on 2022/01/21.
//

import SwiftUI

struct ColorPickerExample: View {
    var body: some View {
       
        VStack {
            // 初始化颜色选择器只需要传入一个描述性的 String 和需要绑定的颜色即可
            // 点击右侧的圆圈就会弹出丰富的颜色选择框
            ColorPicker("Choose color", selection: $selectedColor)
                .padding(EdgeInsets(top: 0, leading: 100, bottom: 0, trailing: 100))
            // 可以设置关闭透明度的控制
            ColorPicker("Choose color", selection: $selectedColor, supportsOpacity: false)
                .frame(width: 200)
            // 和 Button 类似，ColorPicker 可以在末尾传入一个视图作为标签视图
            ColorPicker(selection: $selectedColor) {
                Text("Choose color")
            }
        }
        
    }
    
    @State
    var selectedColor = Color(.sRGB, red: 0.98, green: 0.9, blue: 0.2)
}

struct ColorPickerExample_Previews: PreviewProvider {
    static var previews: some View {
        ColorPickerExample()
    }
}
