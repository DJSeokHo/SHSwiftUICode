//
//  RestaurantListView.swift
//  SHSwiftUICode
//
//  Created by 浩 SHI on 2022/04/15.
//

import SwiftUI

@available(iOS 15.0, *)
struct RestaurantListView: View {
    
    var restaurants = dummyData()
    
    var body: some View {
        
        ListView(restaurants: restaurants)
        
    }
}

@available(iOS 15.0, *)
private struct ListView: View {
    
    var restaurants: [Restaurant]
    
    var body: some View {
        
        List {
            ForEach(restaurants.indices, id: \.self) { index in
                
                ListItemView(restaurant: restaurants[index])
                    .listRowSeparator(.hidden) // 去掉分割线需要用在列表项上
            }
        }
        .listStyle(.plain) // 扁平
        
    }
}

private struct ListItemView: View {
    
    var restaurant: Restaurant
    
    var body: some View {
        
        HStack(alignment: .top, spacing: 20) {
            
            Image(restaurant.image)
                .resizable()
                .frame(width: 120, height: 120)
//                .cornerRadius(20) // 两种方式设置形状
                .clipShape(RoundedRectangle(cornerRadius: 20))
            
            VStack(alignment: .leading) {
                
                Text(restaurant.name)
                    .font(.system(.title2, design: .rounded))
                
                Text(restaurant.type)
                    .font(.system(.body, design: .rounded))
                
                Text(restaurant.location)
                    .font(.system(.subheadline, design: .rounded))
                    .foregroundColor(.gray)
            }
            .padding(.top, 6)
           
        }
    }
}

@available(iOS 15.0, *)
struct RestaurantListView_Previews: PreviewProvider {
    static var previews: some View {
        RestaurantListView()
        RestaurantListView().preferredColorScheme(.dark)
    }
}
