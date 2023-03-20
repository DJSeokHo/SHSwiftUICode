//
//  XMNavigationWithIsActiveView.swift
//  SHSwiftUICode
//
//  Created by mac on 2023/03/16.
//

import SwiftUI

struct XMNavigationWithIsActiveView: View {
    var body: some View {
        ContentView()
    }
}

private struct ContentView: View {
    
    @State
    private var isActive: Bool = false
    
    var body: some View {
        
        NavigationView {
            
            VStack(alignment: .center, spacing: 10) {
                
                Text("Hello, World")
                
                NavigationLink(
                    destination: DetailView(isActive: self.$isActive),
                    isActive: self.$isActive,
                    label: {
                        
                        Button(action: {
                            self.isActive = true
                        }, label: {
                            Text("Go to detail")
                                .foregroundColor(Color.purple)
                        })
                        
                    })
                
                Spacer()
                
            }
            .padding()
            .navigationBarTitle("Home Screen", displayMode: .inline)
            
        }
    }
}

private struct DetailView: View {
    
    @Binding
    var isActive: Bool
    
    var body: some View {
        
        VStack {
            
            Image(systemName: "heart.fill")
                .font(.largeTitle)
                .foregroundColor(.red)
            
            Text("I love you")
                .font(.largeTitle)
            
            
        }
        .navigationBarTitle("Detail")
        .navigationBarBackButtonHidden(true) // 隐藏默认的返回键，用于自己编程实现返回，很常用
        .navigationBarItems(leading: Button(action: {
            
            self.isActive = false
           
            
        }, label: {
            Text("Back")
        }))
        
    }
}

struct XMNavigationWithIsActiveView_Previews: PreviewProvider {
    static var previews: some View {
        XMNavigationWithIsActiveView()
    }
}
