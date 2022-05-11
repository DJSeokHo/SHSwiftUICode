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
        
        ScrollView {
            
            VStack(alignment: .leading) {
                
                image
                info
                addressAndPhone
                
            }
            
        }
        .navigationBarBackButtonHidden(true)
        .toolbar(content: {
            
            ToolbarItem(placement: .navigationBarLeading, content: {
                
                Button(action: {
                    dismiss()
                }, label: {
                    Text("\(Image(systemName: "chevron.left")) \(restaurant.name)")
                })
                
            })
            
        })
        .ignoresSafeArea()

    }
    
    var image: some View {
        
        Image(restaurant.image)
            .resizable()
            .scaledToFill()
            .frame(minWidth: 0, maxWidth: .infinity)
            .frame(height: 445)
            .overlay(content: {
                
                heart
                headerInfo
                
            })
        
    }
    
    var heart: some View {
        
        VStack {
            
            Image(systemName: "heart")
            
                .frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: .infinity, alignment: .topTrailing)
                .padding()
                .font(.system(size: 30))
                .foregroundColor(.white)
                .padding(.top, 40)

        }
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
        
    }
    
    var headerInfo: some View {
        
        VStack(alignment: .leading, spacing: 5, content: {
            
            Text(restaurant.name)
                .font(.custom("Nunito-Regular", size: 35, relativeTo: .largeTitle))
                .bold()
            
            Text(restaurant.type)
                .font(.system(.headline, design: .rounded))
                .padding(.all, 5)
                .background(Color.black)
            
        })
        .frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: .infinity, alignment: .bottomLeading)
        .foregroundColor(.white)
        .padding()
        
    }
    
    var info: some View {
        
        Text(restaurant.description)
            .padding()
        
    }
    
    var addressAndPhone: some View {
        
        HStack(alignment: .top, content: {
            
            VStack(alignment: .leading, content: {
                
                Text("ADDRESS")
                    .font(.system(.headline, design: .rounded))
                Spacer()
                    .frame(height: 10)
                Text(restaurant.location)
                
            })
            .frame(minWidth: 0, maxWidth: .infinity, alignment: .leading)
            
            // MARK: 如果要讓兩個視圖寬度一樣，則將HStack 視圖內的每一個 VStack 視圖的框的寬度設定為 .infinity
            
            VStack(alignment: .leading, content: {
                
                Text("PHONE")
                    .font(.system(.headline, design: .rounded))
                Spacer()
                    .frame(height: 10)
                Text(restaurant.phone)
                
            })
            .frame(minWidth: 0, maxWidth: .infinity, alignment: .leading)
            
        })
        .padding(.horizontal)
        
    }
}

@available(iOS 15.0, *)
struct RestaurantDetailView_Previews: PreviewProvider {
    static var previews: some View {
        
        NavigationView {
            RestaurantDetailView(restaurant: Restaurant(name: "Cafe Deadend", type: "Coffee & Tea Shop", location: "G/F, 72 Po Hing Fong, Sheung Wan, Hong Kong", phone: "232-923423", description: "Searching for great breakfast eateries and coffee? This place is for you. We open at 6:30 every morning, and close at 9 PM. We offer espresso and espresso based drink, such as capuccino, cafe latte, piccolo and many more. Come over and enjoy a great meal.", image: "cafedeadend", isFavorite: false))
                .previewDevice("iPhone 12")
        }
        .accentColor(.white)
        .previewDevice("iPhone 12")
      
//        RestaurantDetailView(restaurant: Restaurant(name: "Cafe Deadend", type: "Coffee & Tea Shop", location: "G/F, 72 Po Hing Fong, Sheung Wan, Hong Kong", phone: "232-923423", description: "Searching for great breakfast eateries and coffee? This place is for you. We open at 6:30 every morning, and close at 9 PM. We offer espresso and espresso based drink, such as capuccino, cafe latte, piccolo and many more. Come over and enjoy a great meal.", image: "cafedeadend", isFavorite: false))
//            .previewDevice("iPhone 12")
    }
}