//
//  SpannedGridView.swift
//  SHSwiftUICode
//
//  Created by Seok Ho on 2020/12/10.
//

import SwiftUI
import ExyteGrid

struct SpannedGridView: View {
    var body: some View {
        Grid(tracks: [.pt(50), .fr(1), .fr(1.5), .fit]) {
            ForEach(0..<6) { _ in
                ColorView(.black)
            }

            ColorView(.brown)
                .gridSpan(column: 3)

            ColorView(.blue)
                .gridSpan(column: 2)

            ColorView(.orange)
                .gridSpan(row: 3)

            ColorView(.red)
                .gridStart(row: 1)
                .gridSpan(column: 2, row: 2)

            ColorView(.yellow)
                .gridStart(row: 2)

            ColorView(.purple)
                .frame(maxWidth: 50)
                .gridStart(column: 3, row: 0)
                .gridSpan(row: 9)

            ColorView(.green)
                .gridSpan(column: 2, row: 3)

            ColorView(.cyan)

            ColorView(.gray)
                .gridStart(column: 2)
        }
     
//        Grid(tracks: 4) {
//               ForEach(0..<40) { _ in
//                VCardView(text: "12321lknadlfkkfnelfnewlnfwe", color: .blue)
//                       .gridSpan(column: randomSpan)
//               }
//           }
//           .gridContentMode(.scroll)
//           .gridPacking(.dense)
//           .gridFlow(.rows)
        
    }
    
    var randomSpan: Int {
       Int(arc4random_uniform(3)) + 1
   }
}

struct VCardView: View {
   let text: String
   let color: UIColor
   
   var body: some View {
       VStack {
           Image("dog")
               .resizable()
               .aspectRatio(contentMode: .fit)
               .cornerRadius(5)
               .frame(minWidth: 100, minHeight: 50)
           
           Text(self.text)
               .layoutPriority(.greatestFiniteMagnitude)
       }
       .padding(5)
       .gridCellBackground { _ in
           ColorView(self.color)
       }
       .gridCellOverlay { _ in
           RoundedRectangle(cornerRadius: 5)
               .strokeBorder(Color(self.color),
                             lineWidth: 3)
       }
   }
}


struct ColorView: View {
    
    let color: UIColor
    
    init(_ color: UIColor) {
        self.color = color
    }
    
    var body: some View {
        RoundedRectangle(cornerRadius: 5)
            .fill(
                LinearGradient(gradient:
                    Gradient(colors:
                                [Color(self.color), Color(self.color)]),
                               startPoint: .topLeading,
                               endPoint: .bottomTrailing)
        )
        
    }
}


struct SpannedGridView_Previews: PreviewProvider {
    static var previews: some View {
        SpannedGridView()
    }
}
