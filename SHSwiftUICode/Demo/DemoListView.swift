//
//  DemoListView.swift
//  SHSwiftUICode
//
//  Created by 浩 SHI on 2022/01/17.
//

import SwiftUI

struct DemoListView: View {
    
    var list: [DemoModel] = [
        DemoModel(
            id: 0,
            name: "coding with cat 1",
            description: "subscribe coding with cat is useful",
            state: "",
            imageName: "coding_with_cat",
            coordinates: DemoModel.Coordinates(latitude: 34.011_286, longitude: -116.166_868),
            isFavorite: false
        ),
        DemoModel(
            id: 1,
            name: "coding with cat 2",
            description: "subscribe coding with cat is useful",
            state: "",
            imageName: "coding_with_cat",
            coordinates: DemoModel.Coordinates(latitude: 34.011_286, longitude: -116.166_868),
            isFavorite: true
        ),
        DemoModel(
            id: 2,
            name: "coding with cat 3",
            description: "subscribe coding with cat is useful",
            state: "",
            imageName: "coding_with_cat",
            coordinates: DemoModel.Coordinates(latitude: 34.011_286, longitude: -116.166_868),
            isFavorite: false
        ),
        DemoModel(
            id: 3,
            name: "coding with cat 4",
            description: "subscribe coding with cat is useful",
            state: "",
            imageName: "coding_with_cat",
            coordinates: DemoModel.Coordinates(latitude: 34.011_286, longitude: -116.166_868),
            isFavorite: true
        ),
        DemoModel(
            id: 4,
            name: "coding with cat 5",
            description: "subscribe coding with cat is useful",
            state: "",
            imageName: "coding_with_cat",
            coordinates: DemoModel.Coordinates(latitude: 34.011_286, longitude: -116.166_868),
            isFavorite: true
        )
    ]
    
    @State
    var showFavoritesOnly = false
    
    var filteredList: [DemoModel] {
        list.filter { demoModel in
            // if is false, return it
            // 如果只显示收藏的项目为假，取反后为真，那么整个表达式肯定是真，所以就不过滤，直接返回
            // 如果只显示收藏的项目为真，取反后为假，那么如果model的收藏也为假，那么整个表达式为假。需要被过滤掉。
            (!showFavoritesOnly || demoModel.isFavorite)
        }
    }

    
    var body: some View {
        
        NavigationView {
            
            List(filteredList, id: \.id) { demoModel in
                
                NavigationLink(destination: {
                    // 目标页面
                    DemoDetailView(demoModel: demoModel)
                    
                }, label: {
                    
                    // 内容页面，在这里指的是列表的行view
                    DemoListItemView(demoModel: demoModel)
                    
                })
                
            }
            .navigationBarTitle(Text("Coding with cat"))
            
        }
        
        
    }
}

struct DemoListView_Previews: PreviewProvider {
    static var previews: some View {
       
        ForEach(["iPhone SE (2nd generation)", "iPhone XS Max"], id: \.self) { deviceName in
            DemoListView()
                .previewDevice(PreviewDevice(rawValue: deviceName))
                .previewDisplayName(deviceName)
        }
    }
}
