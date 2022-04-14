//
//  ReviewView.swift
//  SHSwiftUICode
//
//  Created by Seok Ho on 2022/04/14.
//

import SwiftUI

@available(iOS 15.0, *)
struct ReviewView: View {
    
    var restaurant: Restaurant
    
    var body: some View {
        
        ZStack {
            
            Image(restaurant.image)
                .resizable()
                .scaledToFill()
                .frame(minWidth: 0, maxWidth: .infinity)
                .ignoresSafeArea()
            
            /*
             MARK: Color 視圖是設定為黑色，並且加上了  ignoresSafeArea 修飾器來將視圖展開為全螢幕
             */
            Color
                .black
                .opacity(0.6)
                .background(.ultraThinMaterial) // .ultraThinMaterial 的背景材質
                .ignoresSafeArea()
            
            HStack {
                
                Spacer()
                
                VStack {
                    
                    Button(action: {
                        
                    }, label: {
                        
                        Image(systemName: "xmark")
                            .font(.system(size: 30.0))
                            .foregroundColor(.white)
                            .padding()
                        
                    })
                    
                    Spacer()
                    
                }
                
            }
            
            VStack(alignment: .leading) {
                
                ForEach(
                    Restaurant.Rating.allCases, id: \.self
                ) { rating in
                    
                    HStack {
                        
                        Image(rating.image)
                        
                        Text(rating.rawValue.capitalized)
                            .font(.system(.title, design: .rounded))
                            .fontWeight(.bold)
                            .foregroundColor(.white)
                        
                    }
                }
            }
        }
    }
}

@available(iOS 15.0, *)
struct ReviewView_Previews: PreviewProvider {
  
    static var previews: some View {
        ReviewView(restaurant: Restaurant(name: "Cafe Deadend", type: "Coffee & Tea Shop", location: "G/F, 72 Po Hing Fong, Sheung Wan, Hong Kong", phone: "232-923423", description: "Searching for great breakfast eateries and coffee? This place is for you. We open at 6:30 every morning, and close at 9 PM. We offer espresso and espresso based drink, such as capuccino, cafe latte, piccolo and many more. Come over and enjoy a great meal.", image: "cafedeadend", isFavorite: true))
    }
}
