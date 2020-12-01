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
    
    @State private var type = "1"
    
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
                
            }
            
            Button(
                action: {
                    if self.type == "1" {
                        self.type = "2"
                    }
                    else {
                        self.type = "1"
                    }
                },
                label: {
                    Text("Change filter")
                }
            )
            
            List {

                ForEach(0..<stringList.count) {
                    index in
                    if self.type == "1" {
                        Text(stringList[index])
                            .onAppear(perform: {
                                print("onAppear")
                            })
                            .onDisappear(perform: {
                                print("onDisappear")
                            })
                    }
                }
                
            }
            
        }
    }
}

struct PropertyStateDemo_Previews: PreviewProvider {
    static var previews: some View {
        PropertyStateDemo()
    }
}
