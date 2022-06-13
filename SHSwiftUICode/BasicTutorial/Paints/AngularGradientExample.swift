//
//  AngularGradientExample.swift
//  SHSwiftUICode
//
//  Created by 浩 SHI on 2022/01/28.
//

import SwiftUI

struct AngularGradientExample: View {
    var body: some View {
        // AngularGradient 表示环装的颜色渐变
        // center 表示渐变的中心
        // startAngle 和 endAngle 表示渐变的起始角度和结束角度
        // 注意剩余的部分会被两端的颜色均分
        AngularGradient(
            gradient: Gradient(colors: [.red, .white]),
            center: .center,
            startAngle: Angle(degrees: 0),
            endAngle: Angle(degrees: 180)
        )
    }
}

struct AngularGradientExample_Previews: PreviewProvider {
    static var previews: some View {
        AngularGradientExample()
    }
}
