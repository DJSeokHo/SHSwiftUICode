//
//  CountryVM.swift
//  SHSwiftUICode
//
//  Created by Seok Ho on 2020/12/02.
//

import SwiftUI

class CountryVM: ObservableObject {
    @Published
    var countries: [Country] = []
    
    func loadCountries() {
        self.countries = [Country(name: "中国"), Country(name: "美国"), Country(name: "韩国"), Country(name: "德国"), Country(name: "法国"), Country(name: "英国")]
    }
    
    func removeCountry(_ index: Int) {
        self.countries.remove(at: index)
    }
}
