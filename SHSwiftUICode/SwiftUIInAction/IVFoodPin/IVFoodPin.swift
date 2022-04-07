//
//  IVFoodPin.swift
//  SHSwiftUICode
//
//  Created by 浩 SHI on 2022/04/06.
//

import SwiftUI

@available(iOS 15.0, *)
struct RestaurantListView: View {
    
    @State
    var restaurants = [
        Restaurant(name: "Cafe Deadend", type: "Coffee & Tea Shop", location: "Hong Kong", image: "Cafe Deadend", isFavorite: false),
        Restaurant(name: "Homei", type: "Cafe", location: "Hong Kong", image: "Homei", isFavorite: false),
        Restaurant(name: "Teakha", type: "Tea House", location: "Hong Kong", image: "Teakha", isFavorite: false),
        Restaurant(name: "Cafe loisl", type: "Austrian / Causual Drink", location: "Hong Kong", image: "Cafe Loisl", isFavorite: false),
        Restaurant(name: "Petite Oyster", type: "French", location: "Hong Kong", image: "Petite Oyster", isFavorite: false),
        Restaurant(name: "For Kee Restaurant", type: "Bakery", location: "Hong Kong", image: "For Kee Restaurant", isFavorite: false),
        Restaurant(name: "Po's Atelier", type: "Bakery", location: "Hong Kong", image: "Po's Atelier", isFavorite: false),
        Restaurant(name: "Bourke Street Bakery", type: "Chocolate", location: "Sydney", image: "Bourke Street Bakery", isFavorite: false),
        Restaurant(name: "Haigh's Chocolate", type: "Cafe", location: "Sydney", image: "Haigh's Chocolate", isFavorite: false),
        Restaurant(name: "Palomino Espresso", type: "American / Seafood", location: "Sydney", image: "Palomino Espresso", isFavorite: false),
        Restaurant(name: "Upstate", type: "American", location: "New York", image: "Upstate", isFavorite: false),
        Restaurant(name: "Traif", type: "American", location: "New York", image: "Traif", isFavorite: false),
        Restaurant(name: "Graham Avenue Meats", type: "Breakfast & Brunch", location: "New York", image: "Graham Avenue Meats And Deli", isFavorite: false),
        Restaurant(name: "Waffle & Wolf", type: "Coffee & Tea", location: "New York", image: "Waffle & Wolf", isFavorite: false),
        Restaurant(name: "Five Leaves", type: "Coffee & Tea", location: "New York", image: "Five Leaves", isFavorite: false),
        Restaurant(name: "Cafe Lore", type: "Latin American", location: "New York", image: "Cafe Lore", isFavorite: false),
        Restaurant(name: "Confessional", type: "Spanish", location: "New York", image: "Confessional", isFavorite: false),
        Restaurant(name: "Barrafina", type: "Spanish", location: "London", image: "Barrafina", isFavorite: false),
        Restaurant(name: "Donostia", type: "Spanish", location: "London", image: "Donostia", isFavorite: false),
        Restaurant(name: "Royal Oak", type: "British", location: "London", image: "Royal Oak", isFavorite: false),
        Restaurant(name: "CASK Pub and Kitchen", type: "Thai", location: "London", image: "CASK Pub and Kitchen", isFavorite: false)
    ]
  
    var body: some View {
       
        List {
            
            ForEach(restaurants.indices, id: \.self) { index in
              
//                RestaurantListItemFullImageView(restaurant: $restaurants[index])
                
                RestaurantListItemView(restaurant: $restaurants[index])
                    .swipeActions(edge: .trailing, allowsFullSwipe: false, content: {
                        // 这个 action 会导致 swipe to delete 的 onDelete 失效
                        // 所以不用这个也行，改用contextMenu (长按弹出菜单)
                        // 或者把删除加到这里，如果允许 full swipe 将自动执行这里的第一个按钮动作
                        
                        Button {
                            restaurants.remove(at: index)
                        } label: {
                            Image(systemName: "trash")
                        }
                        .tint(.red)
                        
                        Button {

                        } label: {
                            Image(systemName: "heart")
                        }
                        .tint(.green)

                        Button {
                          
                        } label: {
                            Image(systemName: "square.and.arrow.up")
                        }
                        .tint(.orange)

                    })
                
            }
            .onDelete(perform: { indexSet in
                // swipe to delete
                restaurants.remove(atOffsets: indexSet)
            })
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
    private var showActivityView = false
    
    @State
    private var showError = false
    
    @Binding
    var restaurant: Restaurant
    
    var body: some View {
        
        HStack(alignment: .top, spacing: 20) {
            
            Image(restaurant.image)
                .resizable()
                .frame(width: 120, height: 120)
//                .cornerRadius(20) // 这个也行
                .clipShape(RoundedRectangle(cornerRadius: 20)) // 这个也行
            
            VStack(alignment: .leading) {
                
                Text(restaurant.name)
                    .font(.system(.title2, design: .rounded))
                
                Text(restaurant.type)
                    .font(.system(.body, design: .rounded))
                
                Text(restaurant.location)
                    .font(.system(.subheadline, design: .rounded))
                    .foregroundColor(.gray)
            }
            
            if restaurant.isFavorite {
                Spacer()
                
                Image(systemName: "heart.fill")
                    .foregroundColor(.yellow)
                    .onTapGesture {
                        restaurant.isFavorite.toggle()
                    }
            }
           
        }
        .contextMenu {
            Button(action: {
                showError.toggle()
            }, label: {
                HStack {
                    Text("Reserve a table")
                    Image(systemName: "phone")
                }
            })
            
            Button(action: {
                restaurant.isFavorite.toggle()
            }, label: {
                HStack {
                    Text(restaurant.isFavorite ? "Remove from favorites" : "Mark as favorite")
                    Image(systemName: "heart")
                }
            })
            
            Button(action: {
                showActivityView.toggle()
            }, label: {
                HStack {
                    Text("Share")
                    Image(systemName: "square.and.arrow.up")
                }
            })
        }
        .onTapGesture {
            showOptions.toggle()
        }
        .actionSheet(isPresented: $showOptions) {
            ActionSheet(
                title: Text("What do you want to do?"), message: nil, buttons: [
                    .default(Text("Reserve a table")) {
                        
                    },
                    .default(Text(restaurant.isFavorite ? "Remove from favorites" : "Mark as favorite")) {
                        restaurant.isFavorite.toggle()
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
        .sheet(isPresented: $showActivityView) {
            let defaultText = "Just checking in at \(restaurant.name)"

            if let imageToShare = UIImage(named: restaurant.image) {
                ActivityView(activityItems: [defaultText, imageToShare])
            } else {
                ActivityView(activityItems: [defaultText])
            }
        }
    }

}

private struct RestaurantListItemFullImageView: View {
    
    @State
    private var showOptions = false
    @State
    private var showError = false
    
    @Binding
    var restaurant: Restaurant
    
    var body: some View {
        
        VStack(alignment: .leading, spacing: 10) {
            
            Image(restaurant.image)
                .resizable()
                .scaledToFill()
                .frame(height: 200)
//                .cornerRadius(20) // 这个也行
                .clipShape(RoundedRectangle(cornerRadius: 20)) // 这个也行
            
            HStack(alignment: .top) {
                
                VStack(alignment: .leading) {
                    
                    Text(restaurant.name)
                        .font(.system(.title2, design: .rounded))
                    
                    Text(restaurant.type)
                        .font(.system(.body, design: .rounded))
                    
                    Text(restaurant.location)
                        .font(.system(.subheadline, design: .rounded))
                        .foregroundColor(.gray)
                }
                
                if restaurant.isFavorite {
                    Spacer()
                    
                    Image(systemName: "heart.fill")
                        .foregroundColor(.yellow)
                        .onTapGesture {
                            restaurant.isFavorite.toggle()
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
                    .default(Text(restaurant.isFavorite ? "Remove from favorites" : "Mark as favorite")) {
                        restaurant.isFavorite.toggle()
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
                
            RestaurantListItemView(
                restaurant: .constant(
                    Restaurant(name: "Cafe Deadend", type: "Coffee & Tea Shop", location: "Hong Kong", image: "Cafe Deadend", isFavorite: true)
                )
            )
            .previewLayout(.sizeThatFits) // 我們不以全尺寸的模擬器預覽列佈局，我只想要將預覽畫面顯示在一個容器中

            RestaurantListItemFullImageView(
                restaurant: .constant(
                    Restaurant(name: "Cafe Deadend", type: "Coffee & Tea Shop", location: "Hong Kong", image: "Cafe Deadend", isFavorite: true)
                )
            )
            .previewLayout(.sizeThatFits) // 我們不以全尺寸的模擬器預覽列佈局，我只想要將預覽畫面顯示在一個容器中
            
        }
        .preferredColorScheme(.dark)
    }
}
