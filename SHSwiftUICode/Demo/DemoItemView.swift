//
//  DemoItemView.swift
//  SHSwiftUICode
//
//  Created by Seok Ho on 2022/01/15.
//

import SwiftUI

struct DemoItemView: View {
    
    var body: some View {
        
        VStack {
            ItemImagePartView()
            ItemContentPartView()
        }
        
    }
}


struct ItemImagePartView: View {
    
    var body: some View {
        if #available(iOS 15.0, *) {
            Image("coding_with_cat")
                .resizable()
                .scaledToFit()
                .frame(width: 150, height: 150, alignment: Alignment.center)
                .clipShape(Circle())
                .overlay {
                    Circle().stroke(.gray, lineWidth: 4)
                }
                .shadow(radius: 7)
        }
        else {
            Image("coding_with_cat")
                .resizable()
                .scaledToFit()
                .frame(width: 150, height: 150, alignment: Alignment.center)
                .clipShape(Circle())
                .shadow(radius: 7)
        }
    }
}

struct ItemContentPartView: View {
        
    var body: some View {
        
        VStack(
            alignment: HorizontalAlignment.leading
        ) {
            
            Text("Hello, world!")
                .font(.title)
                .foregroundColor(.orange)
            
            HStack {
                
                Text("Coding").font(.subheadline)
                Spacer()
                Text("With")
                Text("Cat")
            }
          
        }
        .padding()
        
    }
}


struct CircleImage_Previews: PreviewProvider {
    static var previews: some View {
       
        VStack {
            ItemImagePartView()
            ItemContentPartView()
        }
      
    }
}
