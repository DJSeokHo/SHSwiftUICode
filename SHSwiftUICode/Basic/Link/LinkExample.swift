//
//  LinkExample.swift
//  SHSwiftUICode
//
//  Created by 浩 SHI on 2022/01/19.
//

import SwiftUI

struct LinkExample: View {
    var body: some View {
        
        // 用链接的描述和地址来初始化 Link
        VStack {
            
            Link("google link", destination: URL(string: "https://www.google.com")!)
                .foregroundColor(Color.orange)
            
            Spacer().frame(height: 20)
            
            Link("coding with cat github", destination: URL(string: "https://github.com/DJSeokHo")!)
                .foregroundColor(Color.black)
        }
        
    }
}

struct LinkExample_Previews: PreviewProvider {
    static var previews: some View {
        LinkExample()
    }
}
