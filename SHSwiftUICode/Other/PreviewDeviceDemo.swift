//
//  PreviewDeviceDemo.swift
//  SHSwiftUICode
//
//  Created by Seok Ho on 2020/11/30.
//

import SwiftUI

struct PreviewDeviceDemo: View {
    var body: some View {
        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
    }
}

struct PreviewDeviceDemo_Previews: PreviewProvider {
    static var previews: some View {
//        PreviewDeviceDemo()
//            .previewDevice(PreviewDevice(rawValue: "iPhone 8"))
//            .previewDisplayName("Device-8")

        PreviewDeviceDemo()
            .previewDevice(PreviewDevice(rawValue: "iPhone XS Max"))
            .previewDisplayName("Device-XS Max")
    }
}
