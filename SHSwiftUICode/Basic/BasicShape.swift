//
//  BasicShape.swift
//  SHSwiftUICode
//
//  Created by Seok Ho on 2020/11/29.
//

import SwiftUI

struct BasicShape: View {
    var body: some View {
        
        VStack{
            Circle()
            Circle()
            .fill(Color.orange)
            .frame(width: 200, height: 200)
            ZStack {
               Circle().fill(Color.purple)
               Circle().fill(Color.yellow).scaleEffect(0.8)
               Circle().fill(Color.orange).scaleEffect(0.6)
            }
            Rectangle()
            Rectangle()
            .fill(Color.orange)
            .frame(width: 200, height: 200)
            ZStack {
               Rectangle().fill(Color.purple)
            .frame(width: 300, height: 200)

               Rectangle().fill(Color.yellow)
            .frame(width: 300, height: 200)
            .scaleEffect(0.8)

               Rectangle()
            .fill(Color.orange)
            .frame(width: 300, height: 200)
            .scaleEffect(0.6)
            }
        }
        
        VStack{
                    
            Rectangle()
            Rectangle()
            .fill(Color.orange)
            .frame(width: 200, height: 200)

            ZStack {
               Rectangle().fill(Color.purple)
            .frame(width: 300, height: 200)

               Rectangle().fill(Color.yellow)
            .frame(width: 300, height: 200)
            .scaleEffect(0.8)

               Rectangle()
            .fill(Color.orange)
            .frame(width: 300, height: 200)
            .scaleEffect(0.6)
            }

            RoundedRectangle(cornerRadius: 120)

            RoundedRectangle(cornerSize: CGSize(width: 100, height: 40)).frame(width: 300, height: 200)

            RoundedRectangle(cornerRadius: 100, style: RoundedCornerStyle.continuous)

        }
        
        Path { path in
           path.move(to: CGPoint(x: 30, y: 0))
           path.addLine(to: CGPoint(x: 30, y: 200))
           path.addLine(to: CGPoint(x: 230, y: 200))
            path.addLine(to: CGPoint(x: 230, y: 0))
        }

        Path { path in
            path.addEllipse(in: CGRect(x: 100, y: 30, width: 200, height: 200))

            path.addRoundedRect(in: CGRect(x: 100, y: 120, width: 200, height: 200), cornerSize: CGSize(width: 10, height: 10))

            path.addEllipse(in: CGRect(x: 100, y: 210, width: 200, height: 200))
        }
       
    }
}

struct BasicShape_Previews: PreviewProvider {
    static var previews: some View {
        BasicShape()
    }
}
