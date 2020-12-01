//
//  PropertyBindingDemo.swift
//  SHSwiftUICode
//
//  Created by Seok Ho on 2020/11/30.
//

import SwiftUI

struct PropertyBindingDemo: View {
    
    @State
    var showFavorited = true
    
    let stringList = ["1", "2", "3"]
    
    var body: some View {
        
        VStack {
            
            PropertyBindingSubView(showFavorited: $showFavorited)
            
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
        }
        .edgesIgnoringSafeArea(.all)
    }
}

/*
    Binding
    把属性的值类型改成引用类型
    这样在子view中就可以保持属性的一致
 */
struct PropertyBindingSubView: View {
    
    @Binding
    var showFavorited: Bool
    
    var body: some View {
        ZStack {
            Toggle(isOn: $showFavorited) {
                Text(showFavorited ? "show" : "hidden")
            }
            .toggleStyle(SwitchToggleStyle())
        }
        .padding()
        .background(Color.orange)
        .frame(width: .infinity, height: .infinity)

    }
}

struct PropertyBindingDemo_Previews: PreviewProvider {
    
    static var previews: some View {
        PropertyBindingDemo()
    }
}
