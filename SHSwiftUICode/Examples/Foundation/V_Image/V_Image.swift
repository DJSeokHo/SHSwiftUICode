//
//  V_Image.swift
//  SHSwiftUICode
//
//  Created by mac on 2022/06/23.
//

import SwiftUI

struct V_Image: View {
    
    var body: some View {
      
        ZStack {
            
            Color
                .pink
            
            
            VStack {
                
                Text("this is a text")
                    .foregroundColor(.black)
                    .font(.system(size: 32, weight: .bold))
                    .padding()
                    .background(.yellow)
                
                Spacer()
                    .frame(height: 50)
                
                simpleImage
                
                Spacer()
                    .frame(height: 30)
            
                roundedImage
                
                Spacer()
                    .frame(height: 10)
                
                circleImage
            }
            
        }
        .ignoresSafeArea()
        
    }
    
    var simpleImage: some View {
        
        Image("user1")
            .resizable() // 如欲於 SwiftUI 調整圖片的話，我們可以加上 resizable 修飾器
            .aspectRatio(contentMode: .fit)
            .frame(width: 200, height: 200)
        
    }
    
    var roundedImage: some View {
        
        Image("user1")
            .resizable() // 如欲於 SwiftUI 調整圖片的話，我們可以加上 resizable 修飾器
            .aspectRatio(contentMode: .fit)
            .frame(width: 200, height: 200)
            .background(.cyan)
            .clipShape(RoundedRectangle(cornerRadius: 30))
        
    }
    
    var circleImage: some View {
        
        Image("user2")
            .resizable()
            .aspectRatio(contentMode: .fit)
            .frame(width: 150, height: 150)
            .background(.white)
            .clipShape(Circle())
            .shadow(color: .black, radius: 10, x: 0, y: 0)
        
    }
}

struct V_Image_Previews: PreviewProvider {
    static var previews: some View {
        V_Image()
    }
}
