//
//  XMTabView.swift
//  SHSwiftUICode
//
//  Created by mac on 2023/03/17.
//

import SwiftUI

struct XMTabView: View {
    var body: some View {
        ContentView()
    }
}

private struct ContentView: View {
    
    var body: some View {
        
        TabView {
            
            Text("Tab1")
                .tabItem({
                    
                    Image(systemName: "house")
                    Text("Home")
                    
                })
                .font(.title)
            
            Text("Tab2")
                .tabItem({
                    
                    Image(systemName: "calendar")
                    Text("Date")
                    
                })
                .font(.title)
            
            Text("Tab3")
                .tabItem({
                    
                    Image(systemName: "car")
                    Text("Service")
                    
                })
                .font(.title)
            
            Text("Tab4")
                .tabItem({
                    
                    Image(systemName: "gear")
                    Text("Setting")
                    
                })
                .font(.title)
            
        }
        .tabViewStyle(PageTabViewStyle(indexDisplayMode: .always))
        .background(Color.gray.opacity(0.5))
    }
}

struct XMTabView_Previews: PreviewProvider {
    static var previews: some View {
        XMTabView()
    }
}
