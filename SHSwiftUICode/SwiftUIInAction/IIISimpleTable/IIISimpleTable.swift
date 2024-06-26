//
//  IIISimpleTable.swift
//  SHSwiftUICode
//
//  Created by 浩 SHI on 2022/04/06.
//

import SwiftUI

struct IIISimpleTable: View {
    
    var restaurantNames = ["cafedeadend", "homei", "teakha", "cafeloisl", "petiteoyster", "forkee", "posatelier", "bourkestreetbakery", "haigh", "palomino", "upstate", "traif", "graham", "waffleandwolf", "fiveleaves", "cafelore", "confessional", "barrafina", "donostia", "royaloak", "cask"]
    
    var body: some View {
       
        ListView(restaurantNames: restaurantNames)
        
    }
}

private struct ListView: View {
    
    var restaurantNames: [String]
    
    var body: some View {
        
        List {
            
    //            ForEach(0...restaurantNames.count - 1, id: \.self) { index in
            ForEach(restaurantNames.indices, id: \.self) { index in
                ListItemView(restaurantName: restaurantNames[index])
            }
        }
        // MARK: 視圖在 iOS 15 內預設為使用嵌入式分組樣式（ inset grouped style ）。嵌入式分組清單樣式為顯示一個具有顏色的背景，然後於清單視圖的四周加上了間距。如果要改變清單視圖的樣式，你可以使用 listStyle 修飾器至 List
        .listStyle(.plain)
        
    }
}

private struct ListItemView: View {
    
    var restaurantName: String
    
    var body: some View {
        
        HStack(spacing: 15) {
            Image(restaurantName)
                .resizable()
                .frame(width: 40, height: 40)
            
            Text(restaurantName)
        }
    }
    
}

struct IIISimpleTable_Previews: PreviewProvider {
    static var previews: some View {
        Group {
         
            IIISimpleTable()
                .previewDevice("iPhone 13 Pro Max")
                .previewDevice(PreviewDevice(rawValue: "iPhone 13 Pro Max"))
                .previewDisplayName("iPhone 13 Pro Max")

            IIISimpleTable()
                .previewDevice("iPhone 13 mini")
                .previewDevice(PreviewDevice(rawValue: "iPhone 13 mini"))
                .previewDisplayName("iPhone 13 mini")

            IIISimpleTable()
                .previewDevice("iPad Air (5th generation)")
                .previewDevice(PreviewDevice(rawValue: "iPad Air (5th generation)"))
                .previewDisplayName("iPad Air (5th generation)")
             
        }
    }
}
