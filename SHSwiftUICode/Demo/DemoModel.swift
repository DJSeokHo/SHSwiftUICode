//
//  DemoModel.swift
//  SHSwiftUICode
//
//  Created by 浩 SHI on 2022/01/17.
//

import Foundation

struct DemoModel {
    
    var id: Int = 0
    var name: String = ""
    var description: String = ""
    var state: String = ""
    var imageName: String = ""
    var coordinates: Coordinates = Coordinates(latitude: 0, longitude: 0)
    var isFavorite: Bool = false
  
    struct Coordinates {
        var latitude: Double
        var longitude: Double
    }
    
}
