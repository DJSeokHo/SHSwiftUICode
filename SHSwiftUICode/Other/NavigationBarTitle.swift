//
//  NavigationBarTitle.swift
//  SHSwiftUICode
//
//  Created by Seok Ho on 2020/11/30.
//

import SwiftUI

struct NavigationBarTitle: View {
    var body: some View {
        NavigationView {
            
//            Text("SwiftUI's NavigationView")
            
//            Text("SwiftUI's NavigationView")
//                .navigationBarTitle(Text("SwiftUI"))
            
//            Text("SwiftUI's NavigationView")
//                .navigationBarTitle(Text("SwiftUI"), displayMode: .large)
            
            Text("SwiftUI's NavigationView")
                .navigationBarTitle(Text("SwiftUI"), displayMode: .inline)
        }
    }
}

struct NavigationBarTitle_Previews: PreviewProvider {
    static var previews: some View {
        NavigationBarTitle()
            .previewDevice(PreviewDevice(rawValue: "iPhone XS Max"))
            .previewDisplayName("Device-XS Max")
    }
}
