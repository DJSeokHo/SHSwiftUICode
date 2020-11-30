//
//  LayoutNavigationLinkMDetail.swift
//  SHSwiftUICode
//
//  Created by Seok Ho on 2020/11/30.
//

import SwiftUI

struct LayoutNavigationLinkMDetail: View {
    
    @Environment(\.presentationMode)
    var mode: Binding<PresentationMode>
    
    var body: some View {
        
        VStack {
            
            Text("detail")
            
            Button(action: {
                self.mode.wrappedValue.dismiss()
            }) {
                Text("Go Back")
            }
           
            
            NavigationLink(destination: LayoutNavigationLinkMDetailOne()) {
                Text("Go Next").foregroundColor(Color.orange)
            }
            
        }
        .navigationBarTitle(Text(""))
        .navigationBarHidden(true)
        .navigationBarBackButtonHidden(true) // even no back button
        .onAppear(perform: {
            print("detail onAppear")
        })
        .onDisappear(perform: {
            print("detail onDisappear")
        })
        
    }
}

struct LayoutNavigationLinkMDetail_Previews: PreviewProvider {
    static var previews: some View {
        LayoutNavigationLinkMDetail()
    }
}
