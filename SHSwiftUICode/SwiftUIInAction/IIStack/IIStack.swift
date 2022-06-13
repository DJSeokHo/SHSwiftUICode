//
//  IIStack.swift
//  SHSwiftUICode
//
//  Created by 浩 SHI on 2022/04/06.
//

import SwiftUI

@available(iOS 15.0, *)
struct IIStack: View {
    
    @Environment(\.verticalSizeClass)
    var verticalSizeClass
    
    var body: some View {
        
        VStack(spacing: 20) {
            
            topLabelView
            
            centerImagesView
            
            centerLabelView
            
            /*
             關鍵在於使用一種 SwiftUI 的特殊元件，元件名稱為留白（spacer），
             留白視圖是一種沒有內容的視圖，在堆疊視圖內充滿一定的空間。
             舉例，當你將留白視圖置於垂直佈局中時，它會在堆疊中的垂直方向盡可能的擴展。
             留白視圖加入完成後，它會盡可能在垂直堆疊視圖中擴展及佔滿空間，然後將標籤往螢幕上方推動
             */
            Spacer()
            
            /*
             如果垂直尺寸属于compact 那么就显示横向按钮
             否则就显示竖直按钮
             */
            if verticalSizeClass == .compact {
                bottomButtonViewInHorizontal
            }
            else {
                bottomButtonViewInVertical
            }

        }
        .padding(.top, 30)
        
    }
    
    private var topLabelView: some View {
        
        VStack {
            
            Text("Instant Developer")
                .fontWeight(.medium)
                .font(.system(size: 40))
                .foregroundColor(.indigo)
            
            Text("Get help from experts in 15 minutes")
        }
        
    }
    
    private var centerImagesView: some View {
        
        HStack(alignment: .bottom, spacing: 10) {
            // MARK: 此處告訴水平堆疊視圖將所有圖片視圖對齊視底部邊緣，並在視圖之間加入 10 點的間距
            
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
        
    }
    
    private var centerLabelView: some View {
        
        Text("Need help with coding problems? Register!")
        
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


@available(iOS 15.0, *)
struct IIStack_Previews: PreviewProvider {
    static var previews: some View {
        
        Group {
         
            IIStack()
                .previewDevice("iPhone 13 Pro Max")
                .previewDevice(PreviewDevice(rawValue: "iPhone 13 Pro Max"))
                .previewDisplayName("iPhone 13 Pro Max")

            IIStack()
                .previewDevice(PreviewDevice(rawValue: "iPhone 13 Pro Max"))
                .previewDisplayName("iPhone 13 Pro Max")
                .previewInterfaceOrientation(.landscapeLeft)
            
            IIStack()
                .previewDevice("iPhone 13 mini")
                .previewDevice(PreviewDevice(rawValue: "iPhone 13 mini"))
                .previewDisplayName("iPhone 13 mini")

            IIStack()
                .previewDevice("iPad Air (5th generation)")
                .previewDevice(PreviewDevice(rawValue: "iPad Air (5th generation)"))
                .previewDisplayName("iPad Air (5th generation)")
                .previewInterfaceOrientation(.portraitUpsideDown)
             
        }
    }
}
