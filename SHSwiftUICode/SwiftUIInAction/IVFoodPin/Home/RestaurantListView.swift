//
//  RestaurantListView.swift
//  SHSwiftUICode
//
//  Created by 浩 SHI on 2022/04/15.
//

import SwiftUI

struct RestaurantListView: View {
    
    @State var restaurants = dummyData()
    
    var body: some View {
        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
    }
}

struct RestaurantListView_Previews: PreviewProvider {
    static var previews: some View {
        RestaurantListView()
    }
}
