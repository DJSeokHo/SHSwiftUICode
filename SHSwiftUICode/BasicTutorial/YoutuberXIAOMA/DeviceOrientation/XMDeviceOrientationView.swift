//
//  XMDeviceOrientationView.swift
//  SHSwiftUICode
//
//  Created by mac on 2023/03/20.
//

import SwiftUI

struct XMDeviceOrientationView: View {
    
    @State
    private var orientation: UIDeviceOrientation = UIDevice.current.orientation
    
    var body: some View {
        
        VStack {
            
            Text(orientation.isLandscape ? "landscape" : "vertical")
                .onReceive(NotificationCenter.Publisher(center: .default, name: UIDevice.orientationDidChangeNotification), perform: { _ in
                    
                    self.orientation = UIDevice.current.orientation
                })
            
        }
    }
}

struct XMDeviceOrientationView_Previews: PreviewProvider {
    static var previews: some View {
        XMDeviceOrientationView()
    }
}
