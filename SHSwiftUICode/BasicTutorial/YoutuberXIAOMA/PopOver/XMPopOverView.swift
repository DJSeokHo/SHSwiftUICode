//
//  XMPopOverView.swift
//  SHSwiftUICode
//
//  Created by mac on 2023/03/20.
//

import SwiftUI

struct XMPopOverView: View {
    var body: some View {
        ContentView()
    }
}

private struct ContentView: View {
    
    @State
    private var showPopOver: Bool = false
    
    var body: some View {
        
        Button(action: {
            
            self.showPopOver = true
            
        }, label: {
            
            Text("show pop")
                .font(.title)
            
        })
        .popover(isPresented: self.$showPopOver, content: {
            PopSheetView(showPopOver: self.$showPopOver)
        })
        
    }
}

private struct PopSheetView: View {
    
    @Binding
    var showPopOver: Bool
    
    var body: some View {
        
        VStack(alignment: .center, spacing: 20) {
            
            Button(action: {
                
                self.showPopOver = false
                
            }, label: {
                
                Image(systemName: "x.circle")
                    .font(.title)
            })
            .frame(minWidth: 0, maxWidth: .infinity, alignment: .topTrailing)
            .padding()
            
            Spacer()
            
            Text("Pop Over 多用于pad")
                .font(.largeTitle)
            
            Button(action: {
                
                self.showPopOver = false
                
            }, label: {
                
                Text("Close")
                    .font(.title)
                
            })
            
            Spacer()
            
        }
        
    }
}

struct XMPopOverView_Previews: PreviewProvider {
    static var previews: some View {
        XMPopOverView()
    }
}
