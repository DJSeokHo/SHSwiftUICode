//
//  RestaurantDetailView.swift
//  SHSwiftUICode
//
//  Created by 浩 SHI on 2022/04/07.
//

import SwiftUI

@available(iOS 15.0, *)
struct RestaurantDetailView: View {
    
    var restaurant: Restaurant
    
    var body: some View {
        
        ZStack(alignment: .top) {
            
            Image(restaurant.image)
                .resizable()
                .scaledToFill()
                .frame(minWidth: 0, maxWidth: .infinity)
                .ignoresSafeArea()
            
            Color.black
                .frame(height: 100)
                .opacity(0.8)
                .cornerRadius(20)
                .padding()
                .overlay {
                    VStack(spacing: 5) {
                        Text(restaurant.name)
                        Text(restaurant.type)
                        Text(restaurant.location)
                    }
                    .font(.system(.headline, design: .rounded))
                    .foregroundColor(.white)
                }
            
        }
        
     
    }
}

@available(iOS 15.0, *)
struct RestaurantDetailView_Previews: PreviewProvider {
    static var previews: some View {
        
        Group {
            RestaurantDetailView(restaurant: Restaurant(name: "Cafe Deadend", type: "Cafe", location: "Hong Kong", image: "Cafe Deadend", isFavorite: true))
                .previewDevice("iPhone 13 Pro")
        }
        .preferredColorScheme(.dark)
        
    }
}
