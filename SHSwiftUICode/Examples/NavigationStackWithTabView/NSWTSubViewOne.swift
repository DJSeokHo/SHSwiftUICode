//
//  NSWTSubViewOne.swift
//  SHSwiftUICode
//
//  Created by mac on 2023/08/03.
//

import SwiftUI

struct NSWTSubViewOne: View {
    
    @State
    private var navigationPath = NavigationPath()
    
    var body: some View {
        
        NavigationStack(path: $navigationPath, root: {
            
            ZStack {
                
                Color
                    .cyan
                
                Button(action: {
                    
                    navigationPath.append("One")
                    
                }, label: {
                    Text("One")
                        .foregroundColor(.black)
                })
                
            }
            .navigationTitle("One")
            .navigationBarTitleDisplayMode(.inline)
            .navigationDestination(for: String.self) { path in
                NSWTDetailView(fromWhere: path)
            }
            
        })
    }
}

struct NSWTSubViewOne_Previews: PreviewProvider {
    static var previews: some View {
        NSWTSubViewOne()
    }
}
