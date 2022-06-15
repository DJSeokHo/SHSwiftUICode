//
//  IIStackHomework.swift
//  SHSwiftUICode
//
//  Created by 浩 SHI on 2022/04/06.
//

import SwiftUI

struct IIStackHomework: View {
    
    @Environment(\.verticalSizeClass)
    var verticalSizeClass
    
    var body: some View {
       
        ZStack {
            
            VStack(spacing: 10) {
                
                topLabelView
                
                centerImageView
                
                Spacer()
                
                if verticalSizeClass == .compact {
                    bottomButtonViewInHorizontal
                } else {
                    bottomButtonViewInVertical
                }
            }
            .padding(.top, 30)
        }
        .background {
            Image("background")
                .resizable()
                .ignoresSafeArea()
        }
    }
    
    private var topLabelView: some View {
        
        VStack {
            
            Text("Instant Developer")
                .fontWeight(.medium)
                .font(.system(size: 40, design: .rounded))
                .foregroundColor(.white)
            
            Text("Get help from experts in 15 minutes")
                .foregroundColor(.white)
            
        }
        
    }
    
    private var centerImageView: some View {
        
        HStack {
            
            Image("student")
                .resizable()
                .aspectRatio(contentMode: .fit)
            
            Image("tutor")
                .resizable()
                .aspectRatio(contentMode: .fit)
            
        }
        .padding(.horizontal, 20)
        
    }
    
    private var bottomButtonViewInVertical: some View {
        
        VStack {
            
            Button(action: {
                
            }, label: {
                Text("Sign Up")
            })
            .frame(width: 200)
            .padding()
            .foregroundColor(.white)
            .background(Color.indigo)
            .cornerRadius(10)
            
            Button(action: {
                
            }, label: {
                Text("Sign In")
            })
            .frame(width: 200)
            .padding()
            .foregroundColor(.white)
            .background(Color.gray)
            .cornerRadius(10)
        }
        
    }
    
    private var bottomButtonViewInHorizontal: some View {
        
        HStack {
            
            Button(action: {
                
            }, label: {
                Text("Sign Up")
            })
            .frame(width: 200)
            .padding()
            .foregroundColor(.white)
            .background(Color.indigo)
            .cornerRadius(10)
            
            Button(action: {
                
            }, label: {
                Text("Sign In")
            })
            .frame(width: 200)
            .padding()
            .foregroundColor(.white)
            .background(Color.gray)
            .cornerRadius(10)
        }
    }
}

struct IIStackHomework_Previews: PreviewProvider {
    static var previews: some View {
     
        Group {
         
            IIStackHomework()
                .previewDevice(PreviewDevice(rawValue: "iPhone 12 Pro"))
                .previewDisplayName("iPhone 12 Pro")

            IIStackHomework()
                .previewDevice(PreviewDevice(rawValue: "iPhone 12 Pro"))
                .previewDisplayName("iPhone 12 Pro")
                .previewInterfaceOrientation(.landscapeLeft)
            
            IIStackHomework()
                .previewDevice(PreviewDevice(rawValue: "iPhone 12 Pro Max"))
                .previewDisplayName("iPhone 12 Pro Max")

            IIStackHomework()
                .previewDevice(PreviewDevice(rawValue: "iPad Air (5th generation)"))
                .previewDisplayName("iPad Air")
                .previewInterfaceOrientation(.portraitUpsideDown)
             
        }
    }
}
