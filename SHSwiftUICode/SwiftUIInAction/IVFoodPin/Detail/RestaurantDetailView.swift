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
        
        ScrollView {
            
            VStack(alignment: .leading) {
                
                TopImageView(restaurant: restaurant)
                DescriptionView(restaurant: restaurant)
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
        // .ignoresSafeArea 修飾器指示 iOS 將細節視圖佈局至螢幕安全區域之外
        .ignoresSafeArea()
        
        
        
//        ZStack(alignment: .top) {
//
//            Image(restaurant.image)
//                .resizable()
//                .scaledToFill()
//                .frame(minWidth: 0, maxWidth: .infinity)
//                .ignoresSafeArea()
//
//            Color.black
//                .frame(height: 100)
//                .opacity(0.8)
//                .cornerRadius(20)
//                .padding()
//                .overlay {
//                    VStack(spacing: 5) {
//                        Text(restaurant.name)
//                        Text(restaurant.type)
//                        Text(restaurant.location)
//                    }
//                    .font(.system(.headline, design: .rounded))
//                    .foregroundColor(.white)
//                }
//
//        }
//        .navigationBarBackButtonHidden(true)
//        .toolbar {
//
//            ToolbarItem(placement: .navigationBarLeading) {
//
//                Button(action: {
//                    dismiss()
////                    presentationMode.wrappedValue.dismiss()
//                }, label: {
//                    Text("\(Image(systemName: "chevron.left")) \(restaurant.name)")
//                })
//            }
//
//        }
        
    }
}

private struct DescriptionView: View {
    
    var restaurant: Restaurant
    
    var body: some View {
        
        Text(restaurant.description)
            .padding()
        
    }
}

@available(iOS 15.0, *)
private struct TopImageView: View {
    
    var restaurant: Restaurant
    
    var body: some View {
        
        Image(restaurant.image)
            .resizable()
            .scaledToFill()
            .frame(minWidth: 0, maxWidth: .infinity)
            .frame(height: 455)
            .overlay {
                // 接下來我們需要疊加一些餐廳資訊至圖片上。你可能知道可以使用 overlay 修飾器來完成，加上 overlay 修飾器至 Image 視圖
                
                VStack {
                    
                    // image 和 下方文字 两个部分都用了无限高度，所以VStack会自动调节他们的比例为1:1并且抵满
                    
                    Image(systemName: "heart")
                        .frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: .infinity, alignment: .topTrailing)
                        .padding()
                        .font(.system(size: 30))
                        .foregroundColor(.white)
                        .padding(.top, 40)
                    
                    TopInfoView(restaurant: restaurant)
                    
                }
            }
        
    }
}

@available(iOS 15.0, *)
private struct TopInfoView: View {
    
    var restaurant: Restaurant
    
    var body: some View {
        
        VStack(alignment: .leading, spacing: 5) {
            
            Text(restaurant.name)
                .font(.custom("Nunito-Regular", size: 35, relativeTo: .largeTitle))
                .bold()
            
            Text(restaurant.type)
                .font(.system(.headline, design: .rounded))
                .padding(.all, 5)
                .background(Color.black)
            
        }
        .frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: .infinity, alignment: .bottomLeading)
        .foregroundColor(.white)
        .padding()
        
    }
}

@available(iOS 15.0, *)
struct RestaurantDetailView_Previews: PreviewProvider {
    static var previews: some View {
        
        Group {
            NavigationView {
                RestaurantDetailView(restaurant: Restaurant(name: "Cafe Deadend", type: "Coffee & Tea Shop", location: "G/F, 72 Po Hing Fong, Sheung Wan, Hong Kong", phone: "232-923423", description: "Searching for great breakfast eateries and coffee? This place is for you. We open at 6:30 every morning, and close at 9 PM. We offer espresso and espresso based drink, such as capuccino, cafe latte, piccolo and many more. Come over and enjoy a great meal.", image: "cafedeadend", isFavorite: false))
            }
            .accentColor(.white)
            .previewDevice("iPhone 13 Pro")
        }
        .preferredColorScheme(.dark)
        
    }
}
