//
//  LayoutNavigationLink.swift
//  SHSwiftUICode
//
//  Created by Seok Ho on 2020/11/30.
//

import SwiftUI

struct LayoutNavigationLink: View {
    
    @State var isPresented = false
    
    var body: some View {
        
        NavigationView {
            HStack{
                NavigationLink(destination: LayoutNavigationLinkDetail(message: "Detail Page #2") ) {
                    Text("Go detail Page #2 >")
                }
                .navigationBarTitle("Index Page #1")
            }
        }
    }
}

struct LayoutNavigationLink_Previews: PreviewProvider {
    static var previews: some View {
        LayoutNavigationLink()
    }
}
