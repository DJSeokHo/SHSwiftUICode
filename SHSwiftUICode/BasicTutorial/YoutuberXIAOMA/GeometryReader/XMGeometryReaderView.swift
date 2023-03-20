//
//  XMGeometryReaderView.swift
//  SHSwiftUICode
//
//  Created by mac on 2023/03/20.
//

import SwiftUI

struct XMGeometryReaderView: View {
    
    var body: some View {
       
        VStack {
            
            Text("Top")
            
            GeometryReader { geometry in
                
                // 如果没有 GeometryReader，那么UI布局只会占用最小空间
                // GeometryReader 会尽量占用全部的布局空间，所以这个东西经常用来做UI布局容器
                
                HStack {
                    
                    Spacer()
                    
                    Text("parent container size: \(Int(geometry.size.width)) * \(Int(geometry.size.height))")
                        .font(.title)
                        .onTapGesture {
                            
                            // 这个容器 GeometryReader 相对于整个屏幕的信息
                            // 这里 minY 将显示 71.8427734375 在12上。说明这个布局的顶部相对于整个屏幕处于的Y坐标位置
                            ILog.debug(
                                tag: #file,
                                content: "Global: \(geometry.frame(in: .global).width) \(geometry.frame(in: .global).height) \(geometry.frame(in: .global).minX) \(geometry.frame(in: .global).minY)"
                            )
                            
                            // 这个容器 GeometryReader 自身的信息
                            ILog.debug(
                                tag: #file,
                                content: "Local: \(geometry.frame(in: .local).width) \(geometry.frame(in: .local).height) \(geometry.frame(in: .local).minX) \(geometry.frame(in: .local).minY)"
                            )
                            
                        }
                    
                    Spacer()
                }
            }
            .background(Color.black.opacity(0.1))
            
            Text("Bottom")
            
        }
    }
}

struct XMGeometryReaderView_Previews: PreviewProvider {
    static var previews: some View {
        XMGeometryReaderView()
    }
}
