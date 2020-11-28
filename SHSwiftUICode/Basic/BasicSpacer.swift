//
//  BasicSpacer.swift
//  SHSwiftUICode
//
//  Created by Seok Ho on 2020/11/28.
//

import SwiftUI

struct BasicSpacer: View {
    var body: some View {
        
        VStack {
            
            HStack {
                Image(systemName: "clock")
                Spacer()
            }
            .padding()
            
            HStack {
                Image(systemName: "clock")
                Spacer()
                Text("\(Date())")
            }
            .padding()
            
            HStack {
                Image(systemName: "clock")
                Spacer(minLength: 50)
                Text("\(Date())")
            }
            .padding()
        }
    }
}

struct BasicSpacer_Previews: PreviewProvider {
    static var previews: some View {
        BasicSpacer()
    }
}
