//
//  RestaurantListView.swift
//  SHSwiftUICode
//
//  Created by 浩 SHI on 2022/04/15.
//

import SwiftUI

@available(iOS 15.0, *)
struct RestaurantListView: View {
    
    init() {
        initNavigationBar()
    }
    
    var body: some View {
        ListView()
    }
    
    private func initNavigationBar() {
        
        // MARK: 我們簡短的介紹了如何自訂導覽列，不過有幾個自訂的功能我想要進一步討論，目前的 SwiftUI 版本並沒有支援所有原生的自訂類型，舉例來說，變更導覽列標題顏色的話需要恢復使用 UIKit。
        
        let navBarAppearance = UINavigationBarAppearance()
        navBarAppearance.largeTitleTextAttributes = [.foregroundColor: UIColor.systemRed, .font: UIFont(name: "ArialRoundedMTBold", size: 35)!]
        navBarAppearance.titleTextAttributes = [.foregroundColor: UIColor.systemRed, .font: UIFont(name: "ArialRoundedMTBold", size: 20)!]
        navBarAppearance.backgroundColor = .clear
        navBarAppearance.backgroundEffect = .none
        navBarAppearance.shadowColor = .clear

        UINavigationBar.appearance().standardAppearance = navBarAppearance
        UINavigationBar.appearance().scrollEdgeAppearance = navBarAppearance
        UINavigationBar.appearance().compactAppearance = navBarAppearance
        
    }
}


@available(iOS 15.0, *)
private struct ListView: View {
    
    @State
    var restaurants = dummyData()
    
    var body: some View {
        
        NavigationWrapper(navigationTitle: "FoodPin", tintColor: .white) {

            List {
                
                ForEach(restaurants.indices, id: \.self) { index in
                
                    NavigationLinkWrapper(withIndicator: false, destination: {
                        RestaurantDetailView(restaurant: restaurants[index])
                    }, contentView: {
                        ListItemView(restaurant: $restaurants[index])
                    })
                    
//                    ListItemView(restaurant: $restaurants[index])
    //                ListBigItemView(restaurant: $restaurants[index])
                }
                // MARK: SwiftUI 可以讓開發者很簡單的就實作出滑動刪除功能。SwiftUI內建一個 .onDelete 修飾器，你可以將這個修飾器附加到 ForEach  後
                .onDelete(perform: { indexSet in
                    
                    restaurants.remove(atOffsets: indexSet)
                    
                })
                // MARK: 向右滑动列表项时，出现2个滑出菜单，这个固然好，但是！！！！！会导致上面左滑删除的onDelete失效，这里不太推荐。
                // MARK: 或者你也可以把删除加入到这个滑出菜单里，把方向从 .leading 改成 .trailing
    //            .swipeActions(edge: .leading, allowsFullSwipe: false, content: {
    //
    //                Button {
    //
    //                } label: {
    //                    Image(systemName: "heart")
    //                }
    //                .tint(.green)
    //
    //                Button {
    //
    //                } label: {
    //                    Image(systemName: "square.and.arrow.up")
    //                }
    //                .tint(.orange)
    //            })
                // MARK: 去掉分割线
                .listRowSeparator(.hidden)
               
            }
            .listStyle(.plain) // 扁平

        }
        
    }
}


private struct ListItemView: View {
    
    @Binding
    var restaurant: Restaurant
    
    @State
    private var showActions = false
    
    @State
    private var showAlert = false
    
    @State
    private var showShare = false
    
    
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
            
            if restaurant.isFavorite {
               
                Image(systemName: "heart.fill")
                    .resizable()
                    .frame(width: 16, height: 16)
                    .foregroundColor(.yellow)
                    .padding(.top, 6)
            }
        }
        // MARK: 除了滑動動作之外，我們將實作如何顯示內容選單（ context menu ）的動作。iOS的使用者通常會在清單列上點擊並按著不放以帶出一個內容選單（參見圖 10.5）Page 261。與滑動動作相似，使用 SwiftUI 框架建立功能簡單非常的容易，你只要將  contextMenu 容器加至一個視圖中，然後設置它的選單項目即可。在 BasicTextImageView 中，移除 .onTapGesture 與 .actionSheet 修飾器。然後將 .contextMenu 修飾器加入  HStack 視圖中
        .contextMenu(menuItems: {
            
            Button(action: {
                self.showAlert.toggle()
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
                    Text("Mark as favorite")
                    Image(systemName: "heart")
                }
            })
            
            Button(action: {
                self.showShare.toggle()
            }, label: {
                Text("Share")
                Image(systemName: "square.and.arrow.up")
            })
        })
        .sheet(isPresented: $showShare, content: {
            
            let defaultText = "Just checking in at \(restaurant.name)"
            
            if let imageToShare = UIImage(named: restaurant.image) {
                
                ActivityViewWrapper.share(activityItems: [defaultText, imageToShare])
            }
            else {
                ActivityViewWrapper.share(activityItems: [defaultText])
            }
                             
        })
//        .onTapGesture {
//
//            ILog.debug(tag: #file, content: restaurant.name)
//            self.showActions.toggle()
//
//        }
//        .actionSheet(isPresented: $showActions) {
//
//            ActionSheet(
//                title: Text("What do you want to do?"),
//                message: nil,
//                buttons: [
//                    .default(Text("Reserve a table")) {
//                        self.showAlert.toggle()
//                    },
//                    .default(Text("Mark as favorite")) {
//                        self.restaurant.isFavorite.toggle()
//                    },
//                    .cancel()
//                ]
//            )
//
//        }
        .alert(isPresented: $showAlert) {
            
            Alert(
                title: Text("Not yet available"),
                message: Text("Sorry, this feature is not available yet. Please retry later."),
                primaryButton: .default(Text("OK")),
                secondaryButton: .cancel()
            )
        }
    }
}

private struct ListBigItemView: View {
    
    @Binding
    var restaurant: Restaurant
    
    @State
    private var showActions = false
    
    @State
    private var showAlert = false
    
    var body: some View {
     
        VStack(alignment: .leading, spacing: 10) {
            
            Image(restaurant.image)
                .resizable()
                .scaledToFill()
                .frame(width: .infinity, height: 200)
                .cornerRadius(20)
            
            VStack(alignment: .leading) {
                
                HStack(alignment: .top) {
                    
                    Text(restaurant.name)
                        .font(.system(.title2, design: .rounded))
                    
                    Spacer()
                    
                    if restaurant.isFavorite {
                       
                        Image(systemName: "heart.fill")
                            .foregroundColor(.yellow)
                    }
                }
                
                Text(restaurant.type)
                    .font(.system(.body, design: .rounded))
                
                Text(restaurant.location)
                    .font(.system(.subheadline, design: .rounded))
                    .foregroundColor(.gray)
            }
            .padding(.horizontal)
            .padding(.bottom)
        }
        .onTapGesture {
            
            ILog.debug(tag: #file, content: restaurant.name)
            self.showActions.toggle()
            
        }
        .actionSheet(isPresented: $showActions) {
            
            ActionSheet(
                title: Text("What do you want to do?"),
                message: nil,
                buttons: [
                    .default(Text("Reserve a table")) {
                        self.showAlert.toggle()
                    },
                    .default(Text("Mark as favorite")) {
                        self.restaurant.isFavorite.toggle()
                    },
                    .cancel()
                ]
            )
            
        }
        .alert(isPresented: $showAlert) {
            
            Alert(
                title: Text("Not yet available"),
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
        
        RestaurantListView()
            .previewDevice("iPhone 12 Pro")
        
        RestaurantListView()
            .preferredColorScheme(.dark)
            .previewDevice("iPhone 12 Pro")
        
        // MARK: 上述的程式碼中，我們加上了  environment 修飾器，然後設定動態型態大小為  .xxxLarge，預覽視圖接著會顯示加大字型後的 UI
        RestaurantListView()
            .preferredColorScheme(.dark)
            .environment(\.dynamicTypeSize, .xxxLarge)
            .previewDevice("iPhone 12 Pro")
    }
}
