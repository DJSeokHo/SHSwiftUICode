//
//  RadialGradientExample.swift
//  SHSwiftUICode
//
//  Created by 浩 SHI on 2022/01/28.
//

import SwiftUI

struct RadialGradientExample: View {
    var body: some View {
        // RadialGradient 表示环装沿半径方向的渐变
        // center 表示环的中心
        // startRadius 和 endRadius 分别表示渐变起始和结束的半径
        RadialGradient(
            gradient: Gradient(colors: [.white, .orange, .white]),
            center: .center,
            startRadius: 100,
            endRadius: 200
        )
    }
}

struct RadialGradientExample_Previews: PreviewProvider {
    static var previews: some View {
        RadialGradientExample()
    }
}
