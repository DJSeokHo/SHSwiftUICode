//
//  IIStackHomework.swift
//  SHSwiftUICode
//
//  Created by 浩 SHI on 2022/04/06.
//

import SwiftUI

private struct TopLabelView: View {
    
    var body: some View {
        
        VStack {
            
            Text("Instant Developer")
                .fontWeight(.medium)
                .font(.system(size: 40, design: .rounded))
                .foregroundColor(.white)
            
            Text("Get help from experts in 15 minutes")
                .foregroundColor(.white)
            
        }
        
    }
}

@available(iOS 15.0, *)
private struct VBottomButtonView: View {
    var body: some View {
        
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
}

@available(iOS 15.0, *)
private struct HBottomButtonView: View {
    var body: some View {
        
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

@available(iOS 15.0, *)
struct IIStackHomework: View {
    
    @Environment(\.verticalSizeClass)
    var verticalSizeClass
    
    var body: some View {
       
        ZStack {
            
            VStack {
                
                TopLabelView()
                
                HStack {
                    
                    Image("student")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                    
                    Image("tutor")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                    
                }
                .padding(.horizontal, 20)
                
                Spacer()
                
                if verticalSizeClass == .compact {
                    HBottomButtonView()
                } else {
                    VBottomButtonView()
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
}

@available(iOS 15.0, *)
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
