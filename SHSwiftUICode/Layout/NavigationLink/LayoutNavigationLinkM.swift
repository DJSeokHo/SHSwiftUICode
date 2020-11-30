//
//  LayoutNavigationLinkM.swift
//  SHSwiftUICode
//
//  Created by Seok Ho on 2020/11/30.
//

import SwiftUI

struct LayoutNavigationLinkM: View {
   
    var body: some View {
        NavigationView{
            
            ZStack {
                Color.orange
            
                NavigationLink(destination: LayoutNavigationLinkMDetail()) {
                    
                    ZStack {
                        Image("test").renderingMode(.original)
                            .mask(Circle())
                            .blur(radius: 2)
                        Text("Next Page >")
                            .foregroundColor(.white)
                            .bold().font(.system(size: 36))
                    }
                    
                }
            }
            .edgesIgnoringSafeArea(.all)
            .navigationBarTitle(Text(""))
            .navigationBarHidden(true)
            .navigationBarBackButtonHidden(true)
        }
        .statusBar(hidden: true)
    
        .onAppear(perform: {
            print("onAppear")
        })
        .onDisappear(perform: {
            print("onDisappear")
        })
        
    }
}

struct LayoutNavigationLinkM_Previews: PreviewProvider {
    static var previews: some View {
        LayoutNavigationLinkM()
    }
}
