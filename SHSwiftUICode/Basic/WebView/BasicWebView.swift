//
//  BasicWebView.swift
//  SHSwiftUICode
//
//  Created by Seok Ho on 2020/11/29.
//

import SwiftUI

struct BasicWebView: View {
    var body: some View {
        CustomWebView().edgesIgnoringSafeArea(/*@START_MENU_TOKEN@*/.all/*@END_MENU_TOKEN@*/)
    }
}

struct BasicWebView_Previews: PreviewProvider {
    static var previews: some View {
        BasicWebView()
    }
}
