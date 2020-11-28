//
//  BasicButton.swift
//  SHSwiftUICode
//
//  Created by Seok Ho on 2020/11/28.
//

import SwiftUI

struct BasicButton: View {
    
    @State var isPresented = false
    
    var body: some View {
        
        VStack {
            Button("First button") {
                print("first button click")
            }
            
            Button(action: {
                print("second button click")
            }, label: {
                Text("Second button")
            })
            
            // button with system image and background and padding
            Button(action: {
                print("Third button click")
            }) {
                Image(systemName: "clock")
                Text("Third button")
            }.foregroundColor(Color.white)
            .padding()
            .background(Color.orange)
            
            // button with background and padding
            Button(action: {
                print("Fourth button click")
            }) {
                Text("padding button")
            }
            .padding()
            .background(Color.yellow)
            
            //padding for label : the tap area is correct!
            Button(action: {
                print("---padding for label.")
            }) {
                Text("Default padding")
                .padding()
                .background(Color.yellow)
            }
            
            // button with h image and text
            Button(action: {
                print("button with h image and text")
            }) {
                HStack {
                    Image(systemName: "star")
                    Text("Button with image")
                }
                .padding()
                .background(Color.yellow)
            }
            
            
            Button("show modal") {
                self.isPresented = true
                print("open modal window \(self.isPresented)")
            }
            .sheet(isPresented: $isPresented, onDismiss: {
                print("dismiss modal window \(self.isPresented)")
            }, content: {
                MyDetailView(message: "Modal window")
            })
            
            
        }
    }
}

struct MyDetailView: View {
    
    let message: String
    
    var body: some View {
        VStack {
            Text(message).font(.largeTitle)
        }
    }
}

struct BasicButton_Previews: PreviewProvider {
    static var previews: some View {
        BasicButton()
    }
}
