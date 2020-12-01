//
//  PropertyStateDemo.swift
//  SHSwiftUICode
//
//  Created by Seok Ho on 2020/11/30.
//

import SwiftUI

struct PropertyStateDemo: View {
    
    let stringList = ["1", "2", "3"]
    
    @State private var showFavorited: Bool = true
    
    @State private var content = "Hello"
    @State private var textFieldInput = ""
    
    var body: some View {
        
        VStack {
            
            Button(
                action: {
                    self.showFavorited.toggle()
                },
                label: {
                    Text("Change filter")
                }
            )
            
            List {

                ForEach(0..<stringList.count) {
                    index in
                    if (self.showFavorited) {
                        Text(stringList[index])
                            .onAppear(perform: {
                                print("onAppear")
                            })
                            .onDisappear(perform: {
                                print("onDisappear")
                            })
                    }
                }
            }.frame(width: .infinity, height: 200, alignment: .center)
            
            
            Text(self.content)
            TextField("input", text: self.$textFieldInput)
                .font(.title)
                .foregroundColor(.black)
                .frame(width: .infinity, height: .infinity, alignment: .center)
                .padding(10).background(Color.orange)
            
            Button(
                action: {
                    self.content = self.textFieldInput
                },
                label: {
                    Text("Change")
                }
            )
            
            Spacer()
        }
    }
}

struct PropertyStateDemo_Previews: PreviewProvider {
    static var previews: some View {
        PropertyStateDemo()
    }
}
