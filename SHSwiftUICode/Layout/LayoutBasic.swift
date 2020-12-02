//
//  LayoutBasic.swift
//  SHSwiftUICode
//
//  Created by Seok Ho on 2020/11/29.
//

import SwiftUI

struct LayoutBasic: View {
    var body: some View {
        Group {
           
            Text("Apple")
            Text("Banana")
            Text("Orange")
            Text("Watermelon")
            Text("Grape")
            Text("Papaya")
            Text("Pear")
        }
        .font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
        .foregroundColor(.orange)
        .padding()
        
        HStack(alignment: .bottom, spacing: 40){
            Image(systemName: "book.fill")
            Text("Interactive Tutorials")
            Spacer()
            Image(systemName: "icloud.and.arrow.down")
        }
        .padding()
        
        VStack{
            Text("The fruit and the tree")
                .font(.largeTitle)
            Image("test")
            Text("An apple is a sweet, edible fruit produced by an apple tree Apple trees are cultivated worldwide and are the most widely grown species in the genus Malus.")
                .font(.body)
                .lineLimit(nil)
                .frame(height: 200)
        }.padding()
        
        ZStack(alignment: .center){
            Image("test").clipShape(Circle())
            Text("Sea beach")
                .font(.system(size: 48))
                .foregroundColor(.white)
            Text("Hawaii - USA")
                .font(.system(size: 14))
                .foregroundColor(.white)
                .offset(x: 0, y: 36)
        }.padding(10)
    }
}

struct LayoutBasic_Previews: PreviewProvider {
    static var previews: some View {
        LayoutBasic()
    }
}
