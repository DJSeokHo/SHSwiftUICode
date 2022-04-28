//
//  NavigationUtility.swift
//  SHSwiftUICode
//
//  Created by Seok Ho on 2022/04/28.
//

import SwiftUI


struct NavigationUtility<Content: View>: View {
    
    let navigationTitle: String
    
    @ViewBuilder
    let contentView: Content
    
    var body: some View {
        
        NavigationView {
            
            contentView
                .navigationTitle(navigationTitle)
                .navigationBarTitleDisplayMode(.automatic)
            // MARK: 你可以使用 .navigationBarTitleDisplayMode 來設置導覽列（ navigation bar）的顯示模式。將它設定為  .automatic 則可以讓 iOS 選擇合適的導覽列大小。如果你想要固定導覽列的大小，則可以設定為  .large  或 .inline
        }
        
    }
}
