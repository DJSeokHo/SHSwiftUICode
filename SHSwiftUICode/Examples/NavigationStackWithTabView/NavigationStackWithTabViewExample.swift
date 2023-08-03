//
//  NavigationStackWithTabViewExample.swift
//  SHSwiftUICode
//
//  Created by mac on 2023/08/03.
//

import SwiftUI

struct NavigationStackWithTabViewExample: View {
    
    @State
    private var currentIndex = 0
    
    var body: some View {
        
        ZStack {
            
            Color
                .clear
            
            VStack(spacing: 30) {

                ZStack {

                    NSWTSubViewOne()
                        .opacity(getOneOpacity())

                    NSWTSubViewTwo()
                        .opacity(getTwoOpacity())

                }

                BottomNavigationView(currentIndex: $currentIndex)
            }
            
        }
        .ignoresSafeArea()
        
    }
    
    private func getOneOpacity() -> Double {
        return currentIndex == 0 ? 1 : 0
    }
    
    private func getTwoOpacity() -> Double {
        return currentIndex == 1 ? 1 : 0
    }
}

private struct BottomNavigationView: View {
    
    @Binding
    var currentIndex: Int
    
    var body: some View {
        
        HStack(alignment: .center, spacing: 0) {
            
            Spacer()
            
            Text("One")
                .foregroundColor(.black)
                .font(.system(size: 14))
                .onTapGesture {
                    currentIndex = 0
                }
            
            Spacer()
            
            Text("Two")
                .foregroundColor(.black)
                .font(.system(size: 14))
                .onTapGesture {
                    currentIndex = 1
                }
            
            Spacer()
        }
        .frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: 70)
        .background(.white)
        .shadow(color: Color.black.opacity(0.3), radius: 5, x: 0, y: 0)
    }
}

struct NavigationStackWithTabViewExample_Previews: PreviewProvider {
    static var previews: some View {
        NavigationStackWithTabViewExample()
    }
}
