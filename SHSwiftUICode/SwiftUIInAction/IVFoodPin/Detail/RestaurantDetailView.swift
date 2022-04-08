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
    
    /*
     MARK: SwiftUI 框架提供一個名為 @Environment 的包裹器來供開發者從視圖的環境中讀取值。舉例來說，你可以讀取使用於視圖中配色方案的值（深色/亮色模式）。\.dismiss 是一個關閉（dismiss）目前視圖的環境值。
     */
    @Environment(\.dismiss)
    var dismiss
    
    /*
     MARK: 此關閉環境值是 iOS 15 才開始導入。如果你的 App 支援較早的 iOS 版本，你可以使用 presentationMode 來代替
     */
    // @Environment(\.presentationMode) var presentationMode
    
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
        .navigationBarBackButtonHidden(true)
        .toolbar {
            
            ToolbarItem(placement: .navigationBarLeading) {
                
                Button(action: {
                    dismiss()
//                    presentationMode.wrappedValue.dismiss()
                }, label: {
                    Text("\(Image(systemName: "chevron.left")) \(restaurant.name)")
                })
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
