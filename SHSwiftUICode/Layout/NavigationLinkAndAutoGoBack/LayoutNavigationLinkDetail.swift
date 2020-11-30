//
//  LayoutNavigationLinkDetail.swift
//  SHSwiftUICode
//
//  Created by Seok Ho on 2020/11/30.
//

import SwiftUI

struct LayoutNavigationLinkDetail: View {
    
    let message: String
    
    var body: some View {
        VStack {
            Text(message)
                .font(.largeTitle)
        }
    }
}

struct LayoutNavigationLinkDetail_Previews: PreviewProvider {
    static var previews: some View {
        LayoutNavigationLinkDetail(message: "")
    }
}
