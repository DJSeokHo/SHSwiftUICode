//
//  EnviromentObjectCustomDemoDetail.swift
//  SHSwiftUICode
//
//  Created by Seok Ho on 2020/12/01.
//

import SwiftUI

struct EnviromentObjectCustomDemoDetail: View {
    
    @Environment(\.presentationMode) var mode: Binding<PresentationMode>
    
    
    @EnvironmentObject var eocdData: EOCDData
    
    var body: some View {
       
        VStack {
            Text(eocdData.nickname).padding()
            
            Button(action: {
                eocdData.nickname = "321"
            }, label: {
                Text("Update")
            }).padding()
            
            Button(action: {
                self.mode.wrappedValue.dismiss()
            }) {
                Text("Go Back")
            }.padding()
            
        }
        
    }
}

struct EnviromentObjectCustomDemoDetail_Previews: PreviewProvider {
    static var previews: some View {
        EnviromentObjectCustomDemoDetail()
    }
}
