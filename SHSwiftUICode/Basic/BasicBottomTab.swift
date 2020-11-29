//
//  BasicBottomTab.swift
//  SHSwiftUICode
//
//  Created by Seok Ho on 2020/11/29.
//

import SwiftUI

struct BasicBottomTab: View {
    var body: some View {
        
        TabView() {
            Text("The home page.")
                .font(.system(size: 36))
                .tabItem {
                    Image(systemName: "house")
                    Text("Home")
                }.tag(0)
            
            Text("The setting page.")
                .font(.system(size: 36))
                .tabItem {
                    Image(systemName: "gear")
                    Text("Settings")
                }.tag(1)
        }
        .onAppear(perform: {
            
        })
        .onDisappear(perform: {
            
        })
        
    }
}

struct BasicBottomTab_Previews: PreviewProvider {
    static var previews: some View {
        BasicBottomTab()
    }
}
