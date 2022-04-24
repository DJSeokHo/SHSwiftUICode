//
//  RestaurantListView.swift
//  SHSwiftUICode
//
//  Created by 浩 SHI on 2022/04/15.
//

import SwiftUI

@available(iOS 15.0, *)
struct RestaurantListView: View {
    
    var body: some View {
        ListView()
    }
}

@available(iOS 15.0, *)
private struct ListView: View {
    
    @State
    var restaurants = dummyData()
    
    var body: some View {
        
        List {
            ForEach(restaurants.indices, id: \.self) { index in
            
                ListItemView(restaurant: $restaurants[index])
                .listRowSeparator(.hidden) // 去掉分割线需要用在列表项上
                
//                ListBigItemView(restaurant: restaurants[index])
//                    .listRowSeparator(.hidden) // 去掉分割线需要用在列表项上
            }
        }
        .listStyle(.plain) // 扁平
        
    }
}


private struct ListItemView: View {
    
    @Binding
    var restaurant: Restaurant
    
    @State
    private var showActions = false
    
    @State
    private var showAlert = false
    
    
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

private struct ListBigItemView: View {
    
    var restaurant: Restaurant
    
    var body: some View {
     
        VStack(alignment: .leading, spacing: 10) {
            
            Image(restaurant.image)
                .resizable()
                .scaledToFill()
                .frame(width: .infinity, height: 200)
                .cornerRadius(20)
            
            VStack(alignment: .leading) {
                
                Text(restaurant.name)
                    .font(.system(.title2, design: .rounded))
                
                Text(restaurant.name)
                    .font(.system(.body, design: .rounded))
                
                Text(restaurant.name)
                    .font(.system(.subheadline, design: .rounded))
                    .foregroundColor(.gray)
            }
            .padding(.horizontal)
            .padding(.bottom)
        }
        
    }
}

@available(iOS 15.0, *)
struct RestaurantListView_Previews: PreviewProvider {
    static var previews: some View {
        RestaurantListView()
            .previewDevice("iPhone 12 Pro")
        RestaurantListView().preferredColorScheme(.dark)
    }
}
