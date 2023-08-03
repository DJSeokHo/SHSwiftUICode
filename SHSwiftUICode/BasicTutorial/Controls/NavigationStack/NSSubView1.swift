//
//  NSSubView1.swift
//  SHSwiftUICode
//
//  Created by mac on 2023/07/08.
//

import SwiftUI

struct NSSubView1: View {
  
    static let tag = "NSSubView1"
    
    @EnvironmentObject
    var pathManager: PathManager
    
    var body: some View {
        
        ZStack {
            
            Color
                .black
            
            VStack {
                
                Text("Sub View 1")
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

struct NSSubView_Previews: PreviewProvider {
    static var previews: some View {
        NSSubView1()
    }
}
