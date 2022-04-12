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
    var restaurants = fetchData()
  
    var body: some View {
       
        NavigationView {
            
            List {
                
                ForEach(restaurants.indices, id: \.self) { index in
                  
    //                RestaurantListItemFullImageView(restaurant: $restaurants[index])
                    
                    ZStack(alignment: .leading) {
                        
                        NavigationLink(destination: {
                            RestaurantDetailView(restaurant: restaurants[index])
                        }) {
                            /*
                             MARK: 移除向右的箭头指示器
                             ZStack(alignment: .leading) {
                                 NavigationLink(destination: RestaurantDetailView(restaurant: restaurants[index])) {
                                     EmptyView()
                                 }
                                 .opacity(0)

                                 BasicTextImageRow(restaurant: $restaurants[index])
                             }
                             */
                            EmptyView()
                        }
                        .opacity(0)
                        
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
                  
                }
                .onDelete(perform: { indexSet in
                    // swipe to delete
                    restaurants.remove(atOffsets: indexSet)
                })
                .listRowSeparator(.hidden)
            }
            // 視圖在 iOS 15 內預設為使用嵌入式分組樣式（ inset grouped style ）。嵌入式分組清單樣式為顯示一個具有顏色的背景，然後於清單視圖的四周加上了間距。如果要改變清單視圖的樣式，你可以使用 listStyle 修飾器至 List
            .listStyle(.plain)
            .navigationTitle("FoodPin")
            .navigationBarTitleDisplayMode(
                .automatic
//                .large
//                .inline
            )
        }
        // 返回按鈕的預設顏色為藍色。如果想要變更為其他顏色，你可以在 NavigationView 使用.accentColor 修飾器並指定你的偏好顏色
        .accentColor(.white)
        
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
                    Restaurant(name: "Cafe Deadend", type: "Coffee & Tea Shop", location: "G/F, 72 Po Hing Fong, Sheung Wan, Hong Kong", phone: "232-923423", description: "Searching for great breakfast eateries and coffee? This place is for you. We open at 6:30 every morning, and close at 9 PM. We offer espresso and espresso based drink, such as capuccino, cafe latte, piccolo and many more. Come over and enjoy a great meal.", image: "cafedeadend", isFavorite: false)
                )
            )
            .previewLayout(.sizeThatFits) // 我們不以全尺寸的模擬器預覽列佈局，我只想要將預覽畫面顯示在一個容器中

            RestaurantListItemFullImageView(
                restaurant: .constant(
                    Restaurant(name: "Cafe Deadend", type: "Coffee & Tea Shop", location: "G/F, 72 Po Hing Fong, Sheung Wan, Hong Kong", phone: "232-923423", description: "Searching for great breakfast eateries and coffee? This place is for you. We open at 6:30 every morning, and close at 9 PM. We offer espresso and espresso based drink, such as capuccino, cafe latte, piccolo and many more. Come over and enjoy a great meal.", image: "cafedeadend", isFavorite: false)
                )
            )
            .previewLayout(.sizeThatFits) // 我們不以全尺寸的模擬器預覽列佈局，我只想要將預覽畫面顯示在一個容器中
            
        }
        .preferredColorScheme(.dark)
    }
}
