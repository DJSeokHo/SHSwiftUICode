//
//  BasicMapView.swift
//  SHSwiftUICode
//
//  Created by Seok Ho on 2020/11/29.
//

import SwiftUI

struct BasicMapView: View {
    var body: some View {
        CustomMapView().edgesIgnoringSafeArea(.all)
    }
}

struct BasicMapView_Previews: PreviewProvider {
    static var previews: some View {
        BasicMapView()
    }
}
