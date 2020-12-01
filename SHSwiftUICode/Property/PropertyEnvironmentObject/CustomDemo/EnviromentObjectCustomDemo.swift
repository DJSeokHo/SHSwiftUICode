//
//  EnviromentObjectCustomDemo.swift
//  SHSwiftUICode
//
//  Created by Seok Ho on 2020/12/01.
//

import SwiftUI

struct EnviromentObjectCustomDemo: View {
    
    @EnvironmentObject var eocdData: EOCDData
    
    var body: some View {
        
        NavigationView {
            
            VStack {
                Text(eocdData.nickname).padding()
                
                Button(action: {
                    eocdData.nickname = "123"
                }, label: {
                    Text("Update")
                })
                .padding()
                
                NavigationLink(destination: EnviromentObjectCustomDemoDetail()) {
                    Text("GO")
                }
                .padding()
                .background(Color.orange)
                
            }
        }
        
       
    }
}

struct EnviromentObjectCustomDemo_Previews: PreviewProvider {
    static var previews: some View {
        EnviromentObjectCustomDemo()
            .environmentObject(EOCDData())
    }
}
