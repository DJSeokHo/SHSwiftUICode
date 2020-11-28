//
//  BasicDivider.swift
//  SHSwiftUICode
//
//  Created by Seok Ho on 2020/11/28.
//

import SwiftUI

struct BasicDivider: View {
    var body: some View {
        
        VStack {
            Image(systemName: "clock")
            Divider()
            Text("\(Date())")
        }
        .padding()
        
        VStack {
            Image(systemName: "clock")
            Divider().background(Color.purple).scaleEffect(CGSize(width: 1, height: 10))
            Text("\(Date())")
        }
        .padding()
        
        HStack {
            Image(systemName: "clock")
            Divider().background(Color.orange)
            Text("\(Date())")
        }
        .padding()
    }
}

struct BasicDivider_Previews: PreviewProvider {
    static var previews: some View {
        BasicDivider()
    }
}
