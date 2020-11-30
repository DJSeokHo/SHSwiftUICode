//
//  NavigationItem.swift
//  SHSwiftUICode
//
//  Created by Seok Ho on 2020/11/30.
//

import SwiftUI

struct NavigationItem: View {
    var body: some View {
        NavigationView {
            
            ZStack {
                Color.orange
                Text("SwiftUI's NavigationView")
            }
            .navigationBarTitle(Text("SwiftUI"), displayMode: .large)
            .navigationBarItems(leading:  Button(action: {
                   print("Go to index page")
               }) {
                   Text("Index")
               }, trailing: HStack{
                Button(action: {
                    print("Download the data")
                }) {
                    Image(systemName: "icloud.and.arrow.down.fill")
                }
                Button(action: {
                    print("Edit the data")
                }) {
                    Image(systemName: "pencil.tip.crop.circle")
                }
            })
            .edgesIgnoringSafeArea(.all)
        }
        
        
    }
}

struct NavigationItem_Previews: PreviewProvider {
    static var previews: some View {
        NavigationItem()
            .previewDevice(PreviewDevice(rawValue: "iPhone XS Max"))
            .previewDisplayName("Device-XS Max")
    }
}
