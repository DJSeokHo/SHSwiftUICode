//
//  DemoViewModel.swift
//  SHSwiftUICode
//
//  Created by 浩 SHI on 2022/01/17.
//

import Foundation
import Combine

final class DemoViewModel: ObservableObject {
    
    @Published
    var demoModelList: [DemoModel] = []
    
    @Published
    var showFavoritesOnly = false
    
    func load(offset: Int, limit: Int) {
        
        demoModelList.removeAll()
    
        for i in offset..<offset + limit {
            
            demoModelList.append(DemoModel(
                id: i,
                name: "coding with cat \(i)",
                description: "subscribe coding with cat is useful",
                state: "",
                imageName: "coding_with_cat",
                coordinates: DemoModel.Coordinates(latitude: 34.011_286, longitude: -116.166_868),
                isFavorite: false
            ))
        }
        
    }
}
