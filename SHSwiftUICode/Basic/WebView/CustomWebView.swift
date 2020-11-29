//
//  CustomWebView.swift
//  SHSwiftUICode
//
//  Created by Seok Ho on 2020/11/29.
//

import SwiftUI
import WebKit

struct CustomWebView: UIViewRepresentable {
    
    func makeUIView(context: UIViewRepresentableContext<CustomWebView>) -> WKWebView {
        return WKWebView()
    }
    
    func updateUIView(_ uiView: WKWebView, context: UIViewRepresentableContext<CustomWebView>) {
        let request = URLRequest(url:URL(string: "https://apple.com")!)
        uiView.load(request)
    }

}
