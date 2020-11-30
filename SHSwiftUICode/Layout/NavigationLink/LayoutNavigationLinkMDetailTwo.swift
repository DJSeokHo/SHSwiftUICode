//
//  LayoutNavigationLinkMDetailTwo.swift
//  SHSwiftUICode
//
//  Created by Seok Ho on 2020/11/30.
//

import SwiftUI

struct LayoutNavigationLinkMDetailTwo: View {
    
    @Environment(\.presentationMode)
    var mode: Binding<PresentationMode>
    
    var body: some View {
        
        VStack {
            
            Text("detail two")
            
            Button(action: {
                self.mode.wrappedValue.dismiss()
                
            }) {
                Text("Go Back")
            }
            
        }
        .navigationBarTitle(Text(""))
        .navigationBarHidden(true)
        .navigationBarBackButtonHidden(true) // even no back button
        .onAppear(perform: {
            print("two onAppear")
        })
        .onDisappear(perform: {
            print("two onDisappear")
        })
        
    }
    
}

struct LayoutNavigationLinkMDetailTwo_Previews: PreviewProvider {
    static var previews: some View {
        LayoutNavigationLinkMDetailTwo()
    }
}
