//
//  XMCustomTabView.swift
//  SHSwiftUICode
//
//  Created by mac on 2023/03/17.
//

import SwiftUI

struct XMCustomTabView: View {
    var body: some View {
        ContentView()
    }
}


private struct ContentView: View {
    
    @State
    private var selected: Int = 10
 
    var body: some View {
        
        TabView(selection: self.$selected, content: {
            
            View1(selected: self.$selected)
                .tabItem({
                    Image(systemName: "house")
                    Text("Home")
                })
                .tag(10)
            
            View2(selected: self.$selected)
                .tabItem({
                    Image(systemName: "gear")
                    Text("Setting")
                })
                .tag(20)
        })
        .font(.title)
        
    }
}

private struct View1: View {
    
    @Binding
    var selected: Int
    
    var body: some View {
        
        VStack {
            
            Text("Home")
                .font(.title)
            
            Button(action: {
                self.selected = 20
            }, label: {
                Text("Go To Setting")
            })
            
        }
        
    }
}

private struct View2: View {
    
    @Binding
    var selected: Int
    
    var body: some View {
        
        VStack {
            
            Text("Setting")
                .font(.title)
            
            Button(action: {
                self.selected = 10
            }, label: {
                Text("Go To Home")
            })
            
        }
        
    }
}


struct XMCustomTabView_Previews: PreviewProvider {
    static var previews: some View {
        XMCustomTabView()
    }
}
