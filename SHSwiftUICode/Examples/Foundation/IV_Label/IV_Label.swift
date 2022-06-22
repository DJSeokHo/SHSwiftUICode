//
//  IV_Label.swift
//  SHSwiftUICode
//
//  Created by mac on 2022/06/22.
//

import SwiftUI

struct IV_Label: View {
    
    // Label 就是图标 + 标题。我们可以用官方提供的 SFSymbol 显示图标
    
    var body: some View {
        
        simpleLabel
    }
    
    var simpleLabel: some View {
        
        Label("label", systemImage: "bolt.fill")
            .foregroundColor(.red)
    
    }
}

struct IV_Label_Previews: PreviewProvider {
    static var previews: some View {
        IV_Label()
    }
}
