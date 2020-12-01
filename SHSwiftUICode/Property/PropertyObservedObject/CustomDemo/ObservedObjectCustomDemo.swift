//
//  ObservedObjectCustomDemo.swift
//  SHSwiftUICode
//
//  Created by Seok Ho on 2020/12/01.
//

import SwiftUI

struct ObservedObjectCustomDemo: View {
    
    // 被观察的对象
    @ObservedObject var oocdData = OOCDData()
    
    var body: some View {
        
        VStack {
            Text(oocdData.nickname)
            
            Text(oocdData.realname)
            
            Button(action: {
                oocdData.nickname = "sk"
            }, label: {
                Text("Change")
            })
            
            TextField("Your nickname", text: $oocdData.nickname).padding()
            
            // oocdData.realname 不会触发自动更新，因为 oocdData.realname 没有被 @Published 修饰
            TextField("Your realname", text: $oocdData.realname).padding()
        }
        
    }
}

struct ObservedObjectCustomDemo_Previews: PreviewProvider {
    static var previews: some View {
        ObservedObjectCustomDemo()
    }
}
