//
//  SwipleGalleryView.swift
//  SHSwiftUICode
//
//  Created by mac on 2023/09/12.
//

import SwiftUI

struct SwipleGalleryView: View {
    
    @State
    var selectedTab: Int = 0
    let spacing: CGFloat = 20
    
//    let list = ["1", "2", "3", "4", "5"]
    let list = [
        "https://static.seekingalpha.com/cdn/s3/uploads/getty_images/1307372676/image_1307372676.jpg?io=getty-c-w750",
        "https://static.seekingalpha.com/cdn/s3/uploads/getty_images/1307372676/image_1307372676.jpg?io=getty-c-w750",
        "https://static.seekingalpha.com/cdn/s3/uploads/getty_images/1307372676/image_1307372676.jpg?io=getty-c-w750",
        "https://static.seekingalpha.com/cdn/s3/uploads/getty_images/1307372676/image_1307372676.jpg?io=getty-c-w750",
        "https://static.seekingalpha.com/cdn/s3/uploads/getty_images/1307372676/image_1307372676.jpg?io=getty-c-w750"
    ]
    
    @State
    private var offset = CGFloat.zero
    
    var body: some View {
        
        VStack(spacing: spacing) {
            
            GeometryReader { geometry in
                
                let width = geometry.size.width * 0.8
                                
                LazyHStack(spacing: spacing) {
                    
                    Color.clear
                        .frame(width: geometry.size.width * 0.1 - spacing)
                    
                    ForEach(list.indices, id: \.self) { index in
                        
                        GalleryItemView(title: list[index])
                            .frame(width: width)
                            .padding(.vertical)
                        
                   }
                }
                .offset(x: CGFloat(-selectedTab) * (width + spacing) + offset)
                .animation(.easeOut, value: selectedTab)
                .gesture(
                    DragGesture()
                        .onChanged { value in
                            offset = value.translation.width
                        }
                        .onEnded { value in
                            withAnimation(.easeOut) {
                                offset = value.predictedEndTranslation.width
                                selectedTab -= Int((offset / width).rounded())
                                selectedTab = max(0, min(selectedTab, list.count - 1))
                                offset = 0
                            }
                        }
                )
            }
            .frame(height: 500)
            
            HStack {
                ForEach(list.indices, id: \.self) { index in
                    Circle().frame(width: 8)
                        .foregroundColor(index == selectedTab ? .primary : .secondary.opacity(0.5))
                        .onTapGesture {
                            selectedTab = index
                        }
                }
            }
        }
    }
}


struct GalleryItemView: View {
    
    let title: String
    
    var body: some View {
        
//        Text(title)
//            .foregroundColor(.white)
//            .font(.system(size: 50))
//            .frame(maxWidth: .infinity, maxHeight: .infinity)
//            .background(.orange, ignoresSafeAreaEdges: .all)
//            .clipShape(RoundedRectangle(cornerRadius: 20))
        
        AsyncImage(url: URL(string: title)) { image in
            image
                .resizable()
                .scaledToFill()
                
        } placeholder: {
            
        }
        .frame(maxWidth: .infinity)
        .frame(height: 140)
        .clipShape(RoundedRectangle(cornerRadius: 20))
        
    }
}

struct SwipleGalleryView_Previews: PreviewProvider {
    static var previews: some View {
        SwipleGalleryView()
    }
}
