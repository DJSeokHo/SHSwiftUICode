//
//  RestaurantDetailView.swift
//  SHSwiftUICode
//
//  Created by Seok Ho on 2022/05/02.
//

import SwiftUI

@available(iOS 15.0, *)
struct RestaurantDetailView: View {
    
    @Environment(\.dismiss)
    private var dismiss
    
    var restaurant: Restaurant
    
    var body: some View {
        
        ZStack(alignment: .top) {
                
            backgroundImage
            
            info
            
        }
       
    }
    
    var backgroundImage: some View {
        
        Image(restaurant.image)
            .resizable()
            .scaledToFill()
            .frame(minWidth: 0, maxWidth: .infinity)
            .ignoresSafeArea()
        
    }
    
    var info: some View {
        
        Color.black
            .frame(height: 100)
            .opacity(0.8)
            .clipShape(RoundedRectangle(cornerRadius: 20))
            .padding()
            .overlay(content: {
                
                VStack(spacing: 5) {
                    
                    Text(restaurant.name)
                    
                    Text(restaurant.type)
                    
                    Text(restaurant.location)
                    
                }
                .padding(.horizontal, 40)
                .font(.system(size: 13, weight: .medium, design: .rounded))
                .foregroundColor(.white)
                // MARK: navigationBarBackButtonHidden  修飾器是作為隱藏原始返回按鈕用。然後我們可以使用 toolbar  修飾器來建立自己版本的返回按鈕。
//                .navigationBarBackButtonHidden(true)
//                .toolbar {
//
//                    ToolbarItem(placement: .navigationBarLeading) {
//
//                        Button(action: {
//                            dismiss()
//                        }, label: {
//                            Text("\(Image(systemName: "chevron.left")) \(restaurant.name)")
//                                .foregroundColor(.white)
//                                .font(.system(size: 16, weight: .medium, design: .rounded))
//                        })
//
//                    }
//                }
                
            })
        
    }
    
}

@available(iOS 15.0, *)
struct RestaurantDetailView_Previews: PreviewProvider {
    static var previews: some View {
        RestaurantDetailView(restaurant: Restaurant(name: "Cafe Deadend", type: "Cafe", location: "Hong Kong", phone: "", description: "", image: "cafedeadend", isFavorite: true))
            .previewDevice("iPhone 12")
    }
}
