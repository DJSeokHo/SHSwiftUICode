//
//  SideMenuView.swift
//  SHSwiftUICode
//
//  Created by Seok Ho on 2020/12/10.
//

import SwiftUI

struct SideMenuView: View {
    
    @Binding var isMenuOpen: Bool
    let width: CGFloat
    
//    @State var isMenuOpen: Bool = true
//    let width: CGFloat = 270
    
    var body: some View {
        
        ZStack(alignment: .topLeading) {
            GeometryReader { _ in
                EmptyView()
            }
            .background(Color.black.opacity(0.1))
            .opacity(self.isMenuOpen ? 1.0 : 0.0)
            .animation(Animation.easeIn.delay(0.25))
            .onTapGesture {
                isMenuOpen.toggle()
            }
            
            VStack {
                Spacer()
                Text("My Profile").onTapGesture {
                    print("My profile.")
                }
                Spacer()
                Text("Posts").onTapGesture {
                    print("Posts.")
                }
                Spacer()
                Text("Logout").onTapGesture {
                    print("Logout.")
                }
                Spacer()
            }
            .frame(width: 270)
            .background(Color.white)
            .offset(x: self.isMenuOpen ? 0 : -self.width)
            .animation(.default)
        }
        .frame(maxWidth: .infinity)
    }
}

//struct SideMenuView_Previews: PreviewProvider {
//
//    @State var isMenuOpen: Bool = false
//
//    static var previews: some View {
//
//        SideMenuView()
//    }
//}
