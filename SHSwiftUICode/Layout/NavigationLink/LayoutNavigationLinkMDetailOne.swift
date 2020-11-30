//
//  LayoutNavigationLinkMDetailOne.swift
//  SHSwiftUICode
//
//  Created by Seok Ho on 2020/11/30.
//

import SwiftUI

struct LayoutNavigationLinkMDetailOne: View {
    
    @Environment(\.presentationMode)
    var mode: Binding<PresentationMode>
    
    var body: some View {
        
        VStack {
            
            Text("detail one")
            
            Button(action: {
                self.mode.wrappedValue.dismiss()
                
            }) {
                Text("Go Back")
            }
           
            
            NavigationLink(destination: LayoutNavigationLinkMDetailTwo()) {
                Text("Go Next")
                    .foregroundColor(Color.orange)
            }
           
        }
        .navigationBarTitle(Text(""))
        .navigationBarHidden(true)
        .navigationBarBackButtonHidden(true) // even no back button
        .onAppear(perform: {
            print("one onAppear")
        })
        .onDisappear(perform: {
            print("one onDisappear")
        })
        
    }
    
}

struct LayoutNavigationLinkMDetailOne_Previews: PreviewProvider {
    static var previews: some View {
        LayoutNavigationLinkMDetailOne()
    }
}
