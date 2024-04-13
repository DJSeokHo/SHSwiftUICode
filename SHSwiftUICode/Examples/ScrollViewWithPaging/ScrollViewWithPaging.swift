//
//  ScrollViewWithPaging.swift
//  SHSwiftUICode
//
//  Created by SeokHo on 2/26/24.
//

import SwiftUI

struct ScrollViewWithPaging: View {
    
    @State
    private var scrollPosition: Color?
    
    var body: some View {
       
        GeometryReader { geometry in
            
            let size = geometry.size
            
            ScrollView(.horizontal) {
                
                let colors: [Color] = [.red, .blue, .green, .yellow, .purple]
                
                LazyHStack(spacing: 25) { // spacing between items
                    
                    ForEach(colors, id: \.self) { color in
                        
                        RoundedRectangle(cornerRadius: 15)
                            .fill(color.gradient)
                            .frame(width: 300, height: 200)
                    }
                    
                }
                .padding(.horizontal) // padding of the whole lazy h stack, not item
                // step 1 only for iOS 17
                .scrollTargetLayout()
                
            }
            // step 2 only for iOS 17
            .scrollTargetBehavior(.viewAligned)
            .scrollPosition(id: $scrollPosition)
            .scrollIndicators(.hidden)
        }
        .frame(height: 300)
        .overlay(alignment: .bottom) {
            
            VStack {
                
                if let scrollPosition {
                    Text(scrollPosition == .red ? "Red" : "Other")
                }
                
                Button(action: {
                    scrollPosition = .yellow
                }, label: {
                    Text("Scroll to yellow")
                })
            }
        }
    }
}

#Preview("Preview title") {
    ScrollViewWithPaging()
}

@available(iOS 17, *)
#Preview("landscape left", traits: .landscapeLeft) {
    ScrollViewWithPaging()
}

@available(iOS 17, *)
#Preview("300 x 300", traits: .fixedLayout(width: 300, height: 300)) {
    ScrollViewWithPaging()
}
