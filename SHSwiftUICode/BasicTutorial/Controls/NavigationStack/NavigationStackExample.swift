//
//  NavigationStackExample.swift
//  SHSwiftUICode
//
//  Created by mac on 2023/07/08.
//

import SwiftUI


struct NavigationStackExample: View {
    
    @StateObject
    var pathManager = PathManager()
    
    var body: some View {
        
        NavigationStack(path: $pathManager.path) {
            
            ZStack {
                
                Color
                    .black
                
                VStack {
                    
                    Text("Main View")
                        .foregroundColor(.white)
                    
                    Button(action: {
                    
                        pathManager.path.append(NSSubView1.tag)
                        
                    }, label: {
                        Text("go to 1")
                            .foregroundColor(.white)
                    })
                    
                    Button(action: {
                       
                        pathManager.path.append(NSSubView2.tag)
                        
                    }, label: {
                        Text("go to 2")
                            .foregroundColor(.white)
                    })
                    
                }
            }
            .frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: .infinity)
            .ignoresSafeArea(.all)
            .navigationDestination(for: String.self, destination: { path in
                
                switch path {
                    
                case NSSubView1.tag:
                    NSSubView1()

                case NSSubView2.tag:
                    NSSubView2()
                    
                default:
                    NSSubView1()
                    
                }
                
            })
        }
        .environmentObject(pathManager)
    }
}


struct NavigationStackExample_Previews: PreviewProvider {
    static var previews: some View {
        NavigationStackExample()
    }
}
