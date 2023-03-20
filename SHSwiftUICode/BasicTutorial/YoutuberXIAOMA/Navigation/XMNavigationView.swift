//
//  XMNavigationView.swift
//  SHSwiftUICode
//
//  Created by mac on 2023/03/16.
//

import SwiftUI

struct XMNavigationView: View {
    
    @State
    private var toggleColor: Bool = false
    
    @State
    private var toggleBold: Bool = false
    
    var body: some View {
        
        NavigationView {
            
            VStack {
                
                Text("Hello, world")
                    .foregroundColor(self.toggleColor ? Color.red : Color.blue)
                Spacer()
                
            }
            .padding(10)
            .font(self.toggleBold ? .largeTitle : .body)
            .border(Color.red, width: 6)
            .navigationBarTitle("Home Screen", displayMode: .inline)
            .navigationBarItems(
                leading: Button(action: {
                    self.toggleBold.toggle()
                }, label: {
                    Text("change font")
                }),
                trailing: Button(action: {
                    self.toggleColor.toggle()
                }, label: {
                    Text("change color")
                })
            )
        }
        .border(Color.green, width: 3)
    }
}

private struct ContentView: View {
    
    var body: some View {
        
        NavigationView {
            
            VStack(alignment: .center, spacing: 10) {
                
                Text("Hello, World")
                NavigationLink("Second", destination: Text("Text View"))
                NavigationLink("Detail", destination: DetailView())
                NavigationLink(destination: Text("Other Text View"), label: {
                    Text("Other Text View")
                })
                
                Spacer()
                
            }
            .padding()
            .navigationBarTitle("Home Screen", displayMode: .inline)
            
        }
    }
}

private struct DetailView: View {
    
    // 编程方式进行返回
    @Environment(\.presentationMode)
    var presentation
    
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
            
            // 隐藏默认的返回键，用于自己编程实现返回，很常用
            self.presentation.wrappedValue.dismiss()
            
        }, label: {
            Text("Back")
        }))
        
    }
}

struct XMNavigationView_Previews: PreviewProvider {
    static var previews: some View {
        XMNavigationView()
    }
}
