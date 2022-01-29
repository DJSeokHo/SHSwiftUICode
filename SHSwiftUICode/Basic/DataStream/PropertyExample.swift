//
//  PropertyExample.swift
//  SHSwiftUICode
//
//  Created by Seok Ho on 2022/01/29.
//

import SwiftUI

struct Model {
    var title: String
    var info: String
}

struct PropertyExample: View {
    
    // 这种形式最简单，就是在 View中定义常量或者变量，然后在内部使用
    let model = Model(title: "this is title", info: "this is info")
    
    var body: some View {
        
        VStack {
            
            Text(model.title).font(.title)
            Text(model.info)
            
        }
        
    }
}

struct PropertyExample_Previews: PreviewProvider {
    static var previews: some View {
        PropertyExample()
    }
}
