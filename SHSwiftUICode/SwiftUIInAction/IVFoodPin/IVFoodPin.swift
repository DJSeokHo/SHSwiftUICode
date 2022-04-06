//
//  IVFoodPin.swift
//  SHSwiftUICode
//
//  Created by 浩 SHI on 2022/04/06.
//

import SwiftUI

@available(iOS 15.0, *)
struct RestaurantListView: View {
    
    var restaurantNames = ["Cafe Deadend", "Homei", "Teakha", "Cafe Loisl", "Petite Oyster", "For Kee Restaurant", "Po's Atelier", "Bourke Street Bakery", "Haigh's Chocolate", "Palomino Espresso", "Upstate", "Traif", "Graham Avenue Meats And Deli", "Waffle & Wolf", "Five Leaves", "Cafe Lore", "Confessional", "Barrafina", "Donostia", "Royal Oak", "CASK Pub and Kitchen"]
    
    var restaurantLocations = ["Hong Kong", "Hong Kong", "Hong Kong", "Hong Kong", "Hong Kong", "Hong Kong", "Hong Kong", "Sydney", "Sydney", "Sydney", "New York", "New York", "New York", "New York", "New York", "New York", "New York", "London", "London", "London", "London"]

    var restaurantTypes = ["Coffee & Tea Shop", "Cafe", "Tea House", "Austrian / Causual Drink", "French", "Bakery", "Bakery", "Chocolate", "Cafe", "American / Seafood", "American", "American", "Breakfast & Brunch", "Coffee & Tea", "Coffee & Tea", "Latin American", "Spanish", "Spanish", "Spanish", "British", "Thai"]
    
    
    @State
    var restaurantIsFavorites = Array(repeating: false, count: 21)
    
    var body: some View {
       
        List {
            
            ForEach(restaurantNames.indices, id: \.self) { index in
                
//                RestaurantListItemView(
//                    imageName: restaurantNames[index],
//                    name: restaurantNames[index],
//                    type: restaurantTypes[index],
//                    location: restaurantLocations[index],
//                    isFavorite: $restaurantIsFavorites[index]
//                )
                
                RestaurantListItemFullImageView(
                    imageName: restaurantNames[index],
                    name: restaurantNames[index],
                    type: restaurantTypes[index],
                    location: restaurantLocations[index],
                    isFavorite: $restaurantIsFavorites[index]
                )
                
            }
            .listRowSeparator(.hidden)
        }
        // 視圖在 iOS 15 內預設為使用嵌入式分組樣式（ inset grouped style ）。嵌入式分組清單樣式為顯示一個具有顏色的背景，然後於清單視圖的四周加上了間距。如果要改變清單視圖的樣式，你可以使用 listStyle 修飾器至 List
        .listStyle(.plain)
        
        
    }
}

private struct RestaurantListItemView: View {
    
    @State
    private var showOptions = false
    @State
    private var showError = false
    
    var imageName: String
    var name: String
    var type: String
    var location: String
    @Binding
    var isFavorite: Bool
    
    var body: some View {
        
        HStack(alignment: .top, spacing: 20) {
            
            Image(imageName)
                .resizable()
                .frame(width: 120, height: 120)
//                .cornerRadius(20) // 这个也行
                .clipShape(RoundedRectangle(cornerRadius: 20)) // 这个也行
            
            VStack(alignment: .leading) {
                
                Text(name)
                    .font(.system(.title2, design: .rounded))
                
                Text(type)
                    .font(.system(.body, design: .rounded))
                
                Text(location)
                    .font(.system(.subheadline, design: .rounded))
                    .foregroundColor(.gray)
            }
            
            if isFavorite {
                Spacer()
                
                Image(systemName: "heart.fill")
                    .foregroundColor(.yellow)
                    .onTapGesture {
                        isFavorite.toggle()
                    }
            }
           
        }
        .onTapGesture {
            showOptions.toggle()
        }
        .actionSheet(isPresented: $showOptions) {
            ActionSheet(
                title: Text("What do you want to do?"), message: nil, buttons: [
                    .default(Text("Reserve a table")) {
                        showError.toggle()
                    },
                    .default(Text(isFavorite ? "Remove from favorites" : "Mark as favorite")) {
                        isFavorite.toggle()
                    },
                    .cancel()
                ]
            )
        }
        .alert(isPresented: $showError) {
            Alert(title: Text("Not yet available"),
                  message: Text("Sorry, this feature is not available yet. Please retry later."),
                  primaryButton: .default(Text("OK")),
                  secondaryButton: .cancel()
            )
        }
    }
    
}

private struct RestaurantListItemFullImageView: View {
    
    @State
    private var showOptions = false
    @State
    private var showError = false
    
    var imageName: String
    var name: String
    var type: String
    var location: String
    @Binding
    var isFavorite: Bool
    
    var body: some View {
        
        VStack(alignment: .leading, spacing: 10) {
            
            Image(imageName)
                .resizable()
                .scaledToFill()
                .frame(height: 200)
//                .cornerRadius(20) // 这个也行
                .clipShape(RoundedRectangle(cornerRadius: 20)) // 这个也行
            
            HStack(alignment: .top) {
                
                VStack(alignment: .leading) {
                    
                    Text(name)
                        .font(.system(.title2, design: .rounded))
                    
                    Text(type)
                        .font(.system(.body, design: .rounded))
                    
                    Text(location)
                        .font(.system(.subheadline, design: .rounded))
                        .foregroundColor(.gray)
                }
                
                if isFavorite {
                    Spacer()
                    
                    Image(systemName: "heart.fill")
                        .foregroundColor(.yellow)
                        .onTapGesture {
                            isFavorite.toggle()
                        }
                }
            }
           
        }
        .onTapGesture {
            showOptions.toggle()
        }
        .actionSheet(isPresented: $showOptions) {
            ActionSheet(
                title: Text("What do you want to do?"), message: nil, buttons: [
                    .default(Text("Reserve a table")) {
                        showError.toggle()
                    },
                    .default(Text(isFavorite ? "Remove from favorites" : "Mark as favorite")) {
                        isFavorite.toggle()
                    },
                    .cancel()
                ]
            )
        }
        .alert(isPresented: $showError) {
            Alert(title: Text("Not yet available"),
                  message: Text("Sorry, this feature is not available yet. Please retry later."),
                  primaryButton: .default(Text("OK")),
                  secondaryButton: .cancel()
            )
        }
    }
    
}

@available(iOS 15.0, *)
struct RestaurantListView_Previews: PreviewProvider {
    static var previews: some View {
        
        Group {
            RestaurantListView()
            
            RestaurantListView()
                
            RestaurantListItemView(imageName: "Cafe Deadend", name: "Cafe Deadend", type: "Cafe", location: "Hong Kong", isFavorite: .constant(true))
                .previewLayout(.sizeThatFits) // 我們不以全尺寸的模擬器預覽列佈局，我只想要將預覽畫面顯示在一個容器中

            RestaurantListItemFullImageView(imageName: "Cafe Deadend", name: "Cafe Deadend", type: "Cafe", location: "Hong Kong", isFavorite: .constant(true))
                .previewLayout(.sizeThatFits) // 我們不以全尺寸的模擬器預覽列佈局，我只想要將預覽畫面顯示在一個容器中
        }
        .preferredColorScheme(.dark)
    }
}
