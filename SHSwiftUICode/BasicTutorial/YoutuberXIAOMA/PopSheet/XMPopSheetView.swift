//
//  XMPopSheetView.swift
//  SHSwiftUICode
//
//  Created by mac on 2023/03/20.
//

import SwiftUI

struct XMPopSheetView: View {
    var body: some View {
        ContentView()
    }
}

private struct ContentView: View {
    
    @State
    private var showSheet: Bool = false
    
    var body: some View {
        
        Button(action: {
            
            self.showSheet = true
            
        }, label: {
            
            Text("show pop")
                .font(.title)
            
        })
        .sheet(isPresented: self.$showSheet, content: {
            PopSheetView(showSheet: self.$showSheet)
        })
        
    }
}

private struct PopSheetView: View {
    
    @Binding
    var showSheet: Bool
    
    var body: some View {
        
        VStack(alignment: .center, spacing: 20) {
            
            Button(action: {
                
                self.showSheet = false
                
            }, label: {
                
                Image(systemName: "x.circle")
                    .font(.title)
            })
            .frame(minWidth: 0, maxWidth: .infinity, alignment: .topTrailing)
            .padding()
            
            Spacer()
            
            Text("Pop Sheet View")
                .font(.largeTitle)
            
            Button(action: {
                
                self.showSheet = false
                
            }, label: {
                
                Text("Close")
                    .font(.title)
                
            })
            
            Spacer()
            
        }
        
    }
}

struct XMPopSheetView_Previews: PreviewProvider {
    static var previews: some View {
        XMPopSheetView()
    }
}
