//
//  NSSubView2.swift
//  SHSwiftUICode
//
//  Created by mac on 2023/07/08.
//

import SwiftUI

struct NSSubView2: View {
    
    static let tag = "NSSubView2"
    
    @EnvironmentObject
    var pathManager: PathManager
    
    var body: some View {
        
        ZStack {
            
            Color
                .black
            
            VStack {
                
                Text("Sub View 2")
                    .foregroundColor(.white)
                
                
                Button(action: {
                    
                    pathManager.path.removeLast()
                    
                }, label: {
                    Text("back")
                        .foregroundColor(.white)
                })
            }
            
            
        }
        .frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: .infinity)
        .ignoresSafeArea(.all)
        
    }
    
}

struct NSSubView2_Previews: PreviewProvider {
    static var previews: some View {
        NSSubView2()
    }
}
