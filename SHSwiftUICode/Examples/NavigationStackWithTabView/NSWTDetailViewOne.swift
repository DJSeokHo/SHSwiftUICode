//
//  NSWTDetailView.swift
//  SHSwiftUICode
//
//  Created by mac on 2023/08/03.
//

import SwiftUI

struct NSWTDetailView: View {
    
    let fromWhere: String
    
    var body: some View {
        
        ZStack {
            
            Color
                .orange
            
            Button(action: {
                
                
                
            }, label: {
                Text("\(fromWhere) Detail")
                    .foregroundColor(.black)
            })
            
        }
        
    }
    
}

struct NSWTDetailView_Previews: PreviewProvider {
    static var previews: some View {
        NSWTDetailView(fromWhere: "")
    }
}
