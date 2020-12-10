//
//  ActivityIndicator.swift
//  SHSwiftUICode
//
//  Created by Seok Ho on 2020/12/03.
//

import SwiftUI

private struct ActivityIndicator: UIViewRepresentable {

    let style: UIActivityIndicatorView.Style

    func makeUIView(context: UIViewRepresentableContext<ActivityIndicator>) -> UIActivityIndicatorView {
        return UIActivityIndicatorView(style: style)
    }

    func updateUIView(_ uiView: UIActivityIndicatorView, context: UIViewRepresentableContext<ActivityIndicator>) {
        uiView.startAnimating()
    }
}

struct CustomProgressView: View {

    let style: UIActivityIndicatorView.Style
    
    var body: some View {

        ZStack {

            Color.black
                .opacity(0.0)

            ActivityIndicator(style: style)
        }
        
        // .infinity is an allowed value for a frame's maxWidth NOT for its minWidth it seems.
        // or app will crash
        
//        .frame(width: .infinity, height: .infinity, alignment: .center)
        .frame(minWidth: .infinity, idealWidth: 100, maxWidth: .infinity, minHeight: 0, idealHeight: 100    , maxHeight: .infinity, alignment: .center)
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .edgesIgnoringSafeArea(.all)
    }
}

struct CustomProgressView_Previews: PreviewProvider {
    
    static var previews: some View {
        CustomProgressView(style: UIActivityIndicatorView.Style.medium)
    }
}



