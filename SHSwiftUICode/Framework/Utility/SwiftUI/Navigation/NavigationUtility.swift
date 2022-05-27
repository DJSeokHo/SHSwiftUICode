//
//  NavigationUtility.swift
//  SHSwiftUICode
//
//  Created by Seok Ho on 2022/04/28.
//

import SwiftUI


struct NavigationWrapper<Content: View>: View {
    
    let navigationTitle: String
    
    let tintColor: Color?
    
    @ViewBuilder
    let contentView: Content
    
    var body: some View {
        
        NavigationView {
            
            contentView
                .navigationTitle(navigationTitle)
                .navigationBarTitleDisplayMode(.automatic)
            // MARK: 你可以使用 .navigationBarTitleDisplayMode 來設置導覽列（ navigation bar）的顯示模式。將它設定為  .automatic 則可以讓 iOS 選擇合適的導覽列大小。如果你想要固定導覽列的大小，則可以設定為  .large  或 .inline
        }
        // MARK: 返回按鈕的預設顏色為藍色。如果想要變更為其他顏色，你可以在  NavigationView 使用.accentColor 修飾器並指定你的偏好顏色
        .accentColor(tintColor)
        
    }
}

struct NavigationLinkWrapper<Content: View, Destination: View>: View {
 
    let withIndicator: Bool
    
    @ViewBuilder
    let destination: Destination
    
    @ViewBuilder
    let contentView: Content
    
    var body: some View {
        
        if withIndicator {
            NavigationLink(destination: destination) {
                contentView
            }
        }
        else {
            
            ZStack(alignment: .leading) {
                
                NavigationLink(destination: destination) {
                    EmptyView()
                }
                .opacity(0)
                
                contentView
            }
            
          
        }
     
    }
}

