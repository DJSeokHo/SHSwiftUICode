//
//  SideMenuDemo.swift
//  SHSwiftUICode
//
//  Created by Seok Ho on 2020/12/10.
//

import SwiftUI


struct SideMenuDemo: View {
    
    @State var isMenuOpen: Bool = false

    var body: some View {
        ZStack {
            if self.isMenuOpen == false {
                Button(action: {
                    self.openMenu()
                }, label: { Text("Open") })
            }
            
            SideMenuView(isMenuOpen: self.$isMenuOpen, width: 270)
            
        }

    }
    
    func openMenu() {
        self.isMenuOpen.toggle()
    }
}


struct SideMenuDemo_Previews: PreviewProvider {
    static var previews: some View {
        SideMenuDemo()
    }
}
