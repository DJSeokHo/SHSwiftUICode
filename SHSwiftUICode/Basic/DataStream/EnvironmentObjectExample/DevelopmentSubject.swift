//
//  DevelopmentSubject.swift
//  SHSwiftUICode
//
//  Created by Seok Ho on 2022/01/29.
//

import Combine

class DevelopmentSubject: ObservableObject {
    
    @Published
    var name: String = ""
    
    init() {}
    
    func test() {
        self.name = "Android"
    }
    
}
