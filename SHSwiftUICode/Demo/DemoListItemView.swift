//
//  DemoListItemView.swift
//  SHSwiftUICode
//
//  Created by 浩 SHI on 2022/01/17.
//

import SwiftUI

struct DemoListItemView: View {
    
    var demoModel: DemoModel
    
    var body: some View {
       
        HStack {
            
            Image(demoModel.imageName)
                .resizable()
                .frame(width: 50, height: 50)
            
            Text(demoModel.name)
            
            Spacer()
            
            if demoModel.isFavorite {
                Image(systemName: "star.fill").foregroundColor(.yellow)
            }
        }
        
    }
}

struct DemoListItemView_Previews: PreviewProvider {
    
    static var previews: some View {
        
        Group {
            
            DemoListItemView(
                demoModel: DemoModel(
                    id: 0,
                    name: "coding with cat",
                    description: "subscribe coding with cat is useful",
                    state: "",
                    imageName: "coding_with_cat",
                    coordinates: DemoModel.Coordinates(latitude: 34.011_286, longitude: -116.166_868),
                    isFavorite: true
                )
            )
            
            DemoListItemView(
                demoModel: DemoModel(
                    id: 0,
                    name: "coding with cat",
                    description: "subscribe coding with cat is useful",
                    state: "",
                    imageName: "coding_with_cat",
                    coordinates: DemoModel.Coordinates(latitude: 34.011_286, longitude: -116.166_868)
                )
            )
            
        }.previewLayout(.fixed(width: 300, height: 70))
        
    }
}
