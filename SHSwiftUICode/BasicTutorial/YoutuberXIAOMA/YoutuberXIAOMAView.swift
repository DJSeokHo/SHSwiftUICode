//
//  YoutuberXIAOMAView.swift
//  SHSwiftUICode
//
//  Created by mac on 2023/03/13.
//

import SwiftUI

struct YoutuberXIAOMAView: View {
    
    var body: some View {
//        Text("YoutuberXIAOMAView")
//            .onAppear {
//
//                propertyWrapperTest()
//
//            }
        
//        XMCustomButton()
//        XMInputLimitedView()
        XMGeometryReaderView()
    }
    
    private func propertyWrapperTest() {
        
        let color: MyColor = MyColor(red: ColorValue(initValue: 50), green: ColorValue(initValue: 500), blue: ColorValue(initValue: -50))
        ILog.debug(tag: #file, content: "red is \(color.red)")
        ILog.debug(tag: #file, content: "green is \(color.green)")
        ILog.debug(tag: #file, content: "blue is \(color.blue)")
    }
}

struct YoutuberXIAOMAView_Previews: PreviewProvider {
    static var previews: some View {
        YoutuberXIAOMAView()
    }
}
