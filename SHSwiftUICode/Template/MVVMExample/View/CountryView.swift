//
//  CountryView.swift
//  SHSwiftUICode
//
//  Created by Seok Ho on 2020/12/02.
//

import SwiftUI

struct CountryView: View {
    
    @ObservedObject
    var viewModel: CountryVM = CountryVM()
    
    var body: some View {
        List{
            ForEach(viewModel.countries) { country in
                Text(country.name)
            }
            .onDelete{ index in
                self.viewModel.removeCountry(index.first!)
            }
        }.onAppear {
            self.viewModel.loadCountries()
        }
    }
}

struct CountryView_Previews: PreviewProvider {
    static var previews: some View {
        CountryView()
    }
}
