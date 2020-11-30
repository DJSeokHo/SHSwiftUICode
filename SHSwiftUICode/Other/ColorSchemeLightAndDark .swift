//
//  ColorSchemeLightAndDark .swift
//  SHSwiftUICode
//
//  Created by Seok Ho on 2020/11/30.
//

import SwiftUI

struct ColorSchemeLightAndDark_: View {
    var body: some View {
        VStack(alignment: .center, spacing: 20){
            Text("Dynamic Type sizes")
                .font(.system(size: 48))
                .foregroundColor(Color.secondary)
            Text("Dynamic Type sizes")
                .foregroundColor(Color.accentColor)
            Image(systemName: "star.fill")
                .foregroundColor(Color.secondary)
                .font(.system(size: 64))
        }
        .frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: .infinity)
        .background(Color.primary)
        .edgesIgnoringSafeArea(.all)
    }
}

struct ColorSchemeLightAndDark__Previews: PreviewProvider {
    static var previews: some View {
        
        ColorSchemeLightAndDark_().environment(\.colorScheme, .light)

        ColorSchemeLightAndDark_().environment(\.colorScheme, .dark)
    }
}
