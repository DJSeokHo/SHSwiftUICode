//
//  NSWTSubViewTwo.swift
//  SHSwiftUICode
//
//  Created by mac on 2023/08/03.
//

import SwiftUI

struct NSWTSubViewTwo: View {
    
    @State
    private var navigationPath = NavigationPath()
    
    var body: some View {
       
        NavigationStack(path: $navigationPath, root: {

            ZStack {

                Color
                    .black

                Button(action: {

                    navigationPath.append("Two")

                }, label: {
                    Text("Two")
                        .foregroundColor(.white)
                })

            }
            .navigationTitle("Two")
            .navigationBarTitleDisplayMode(.inline)
            .navigationDestination(for: String.self, destination: { path in
                NSWTDetailView(fromWhere: path)
            })

        })
        
    }
}


struct NSWTSubViewTwo_Previews: PreviewProvider {
    static var previews: some View {
        NSWTSubViewTwo()
    }
}
