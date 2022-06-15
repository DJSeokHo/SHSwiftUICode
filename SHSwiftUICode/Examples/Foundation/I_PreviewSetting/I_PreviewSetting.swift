//
//  I_PreviewSetting.swift
//  SHSwiftUICode
//
//  Created by mac on 2022/06/13.
//

import SwiftUI

struct I_PreviewSetting: View {
    var body: some View {
        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
    }
}

struct I_PreviewSetting_Previews: PreviewProvider {
    static var previews: some View {
       
        I_PreviewSetting()
        
        Group {
         
            I_PreviewSetting()
                .previewDevice(PreviewDevice(rawValue: "iPhone 12 Pro"))
                .preferredColorScheme(.dark)
                .previewDisplayName("iPhone 12 Pro")

            I_PreviewSetting()
                .previewDevice(PreviewDevice(rawValue: "iPhone 12 Pro"))
                .previewDisplayName("iPhone 12 Pro")
                .previewInterfaceOrientation(.landscapeLeft)
            
            I_PreviewSetting()
                .previewDevice(PreviewDevice(rawValue: "iPhone 12 Pro Max"))
                .previewDisplayName("iPhone 12 Pro Max")

            I_PreviewSetting()
                .previewDevice(PreviewDevice(rawValue: "iPad Air (5th generation)"))
                .previewDisplayName("iPad Air")
                .previewInterfaceOrientation(.portraitUpsideDown)
             
        }
        
    }
}
