//
//  IIStack.swift
//  SHSwiftUICode
//
//  Created by 浩 SHI on 2022/04/06.
//

import SwiftUI

@available(iOS 15.0, *)
private struct TopLabelView: View {
    var body: some View {
        VStack {
            
            Text("Instant Developer")
                .fontWeight(.medium)
                .font(.system(size: 40))
                .foregroundColor(.indigo)
            
            Text("Get help from experts in 15 minutes")
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
struct IIStack: View {
    
    @Environment(\.verticalSizeClass)
    var verticalSizeClass
    
    var body: some View {
        
        VStack(spacing: 20) {
            
            TopLabelView()
            
            HStack(alignment: .bottom, spacing: 10) {
                Image("user1")
                    .resizable() // 如欲於 SwiftUI 調整圖片的話，我們可以加上 resizable 修飾器
                    .aspectRatio(contentMode: .fit)
                
                Image("user2")
                    .resizable() // 如欲於 SwiftUI 調整圖片的話，我們可以加上 resizable 修飾器
                    .aspectRatio(contentMode: .fit)
                
                Image("user3")
                    .resizable() // 如欲於 SwiftUI 調整圖片的話，我們可以加上 resizable 修飾器
                    .aspectRatio(contentMode: .fit)
            }
            .padding(.horizontal, 20)
            
            Text("Need help with coding problems? Register!")
            
            /*
             關鍵在於使用一種 SwiftUI 的特殊元件，元件名稱為留白（spacer），
             留白視圖是一種沒有內容的視圖，在堆疊視圖內充滿一定的空間。
             舉例，當你將留白視圖置於垂直佈局中時，它會在堆疊中的垂直方向盡可能的擴展。
             留白視圖加入完成後，它會盡可能在垂直堆疊視圖中擴展及佔滿空間，然後將標籤往螢幕上方推動
             */
            Spacer()
            
            if verticalSizeClass == .compact {
                HBottomButtonView()
            } else {
                VBottomButtonView()
            }

        }
        .padding(.top, 30)
        
    }
}

@available(iOS 15.0, *)
struct IIStack_Previews: PreviewProvider {
    static var previews: some View {
        
        Group {
         
            IIStack()
                .previewDevice(PreviewDevice(rawValue: "iPhone 12 Pro"))
                .previewDisplayName("iPhone 12 Pro")

            IIStack()
                .previewDevice(PreviewDevice(rawValue: "iPhone 12 Pro"))
                .previewDisplayName("iPhone 12 Pro")
                .previewInterfaceOrientation(.landscapeLeft)
            
            IIStack()
                .previewDevice(PreviewDevice(rawValue: "iPhone 12 Pro Max"))
                .previewDisplayName("iPhone 12 Pro Max")

            IIStack()
                .previewDevice(PreviewDevice(rawValue: "iPad Air (5th generation)"))
                .previewDisplayName("iPad Air")
                .previewInterfaceOrientation(.portraitUpsideDown)
             
        }
    }
}
