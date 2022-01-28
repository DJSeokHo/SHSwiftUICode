//
//  LinearGradientExample.swift
//  SHSwiftUICode
//
//  Created by 浩 SHI on 2022/01/28.
//

import SwiftUI

struct LinearGradientExample: View {
    var body: some View {
        // LinearGradient 表示线性的颜色渐变
        // 用 startPoint 和 endPoint 表示渐变的起点和中间
        LinearGradient(
            gradient: Gradient(colors: [.red, .white]),
            startPoint: .top,
            endPoint: .bottom
        )
    }
}

struct LinearGradientExample_Previews: PreviewProvider {
    static var previews: some View {
        LinearGradientExample()
    }
}
