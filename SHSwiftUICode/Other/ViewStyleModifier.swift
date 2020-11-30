//
//  ViewStyleModifier.swift
//  SHSwiftUICode
//
//  Created by Seok Ho on 2020/11/30.
//

import SwiftUI

struct ViewStyleModifier: View {
    var body: some View {
        VStack(alignment: .center, spacing: 20){
            Image("test").modifier(myImageStyle())
            Image("test").modifier(myImageStyle())
            Image("test").modifier(myImageStyle())
        }
        .padding()
        .edgesIgnoringSafeArea(.all)
    }
}

struct myImageStyle: ViewModifier {
    func body(content: Content) -> some View {
        content
            .frame(width: 150, height: 150, alignment: .leading)
            .cornerRadius(100)
            .clipped()
            .saturation(0.0)
    }
}

struct ViewStyleModifier_Previews: PreviewProvider {
    static var previews: some View {
        ViewStyleModifier()
    }
}
