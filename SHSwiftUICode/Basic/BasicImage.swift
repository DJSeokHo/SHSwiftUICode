//
//  BasicImage.swift
//  SHSwiftUICode
//
//  Created by Seok Ho on 2020/11/28.
//

import SwiftUI

struct BasicImage: View {
    
    @State private var remoteImage : UIImage? = nil
    
    let placeholderOne = UIImage(named: "test")
    
    var body: some View {
        
        VStack {
            Image("test")
            
            Image(systemName: "arkit")
                .foregroundColor(.orange)
                .font(.system(size: 48))
            
            Image("test")
                .resizable()
                .aspectRatio(contentMode: .fit)
        }
        .padding()
        
        // 设置图像的边框、不透明度、阴影等属性。
        VStack {
            
            Image("test")
                .resizable()
                .border(Color.orange)
                .aspectRatio(contentMode: .fit)
            
            Image("test")
                .resizable()
                .border(Color.orange, width: 10)
                .aspectRatio(contentMode: .fit)
            
            Image("test")
                .resizable().aspectRatio(contentMode: .fit)
                .opacity(0.5)
            
            Image("test")
                .resizable().aspectRatio(contentMode: .fit)
                .shadow(radius: /*@START_MENU_TOKEN@*/10/*@END_MENU_TOKEN@*/)
            
            Image("test")
                .resizable().aspectRatio(contentMode: .fit)
                .shadow(color: .purple, radius: 20, x: 20, y: 20)
        }
        
        // 给图片进行图像颜色的设置：设置模糊效果、设置图片的亮度、反转图片的颜色、对比度等效果
        VStack {
            HStack {
                Image("test")
                    .resizable().aspectRatio(contentMode: .fit)
                    .blur(radius: 2)
                
                Image("test")
                    .resizable().aspectRatio(contentMode: .fit)
                    .blur(radius: 2, opaque: true)
            }
            
            HStack {
                Image("test")
                    .resizable().aspectRatio(contentMode: .fit)
                    .brightness(0.2)
                
                Image("test")
                    .resizable().aspectRatio(contentMode: .fit)
                    .colorInvert()
            }
            
            HStack {
                Image("test")
                    .resizable().aspectRatio(contentMode: .fit)
                    .hueRotation(Angle.degrees(180))
                
                Image("test")
                    .resizable().aspectRatio(contentMode: .fit)
                    .saturation(10)
            }
            
            HStack {
                Image("test")
                    .resizable().aspectRatio(contentMode: .fit)
                    .grayscale(5.5)
                
                Image("test")
                    .resizable().aspectRatio(contentMode: .fit)
                    .luminanceToAlpha()
            }
            
        }
        
        // 在图像之间进行颜色像素之间的运算。
        VStack {
            
            Image("test")
                .resizable().aspectRatio(contentMode: .fit)
                .blendMode(.difference)
            
            ZStack {
                
                Image("test")
                    .resizable().aspectRatio(contentMode: .fit)
                
                Image("test")
                    .resizable().aspectRatio(contentMode: .fit)
                    .blendMode(.multiply)
            }
        }
        .padding()
        
        // 给图片添加遮罩效果
        VStack {
            Image("test")
                .resizable().aspectRatio(contentMode: .fit)
                .clipShape(/*@START_MENU_TOKEN@*/Circle()/*@END_MENU_TOKEN@*/)
            
            Image("test")
                .resizable().aspectRatio(contentMode: .fit)
                .mask(/*@START_MENU_TOKEN@*/Circle()/*@END_MENU_TOKEN@*/)
            
            Image("test")
                .resizable()
                .frame(width: 300, height: 200)
                .mask(Text("SWIFT UI!").font(Font.system(size: 64).bold()))
        }
        
        // 给图像应用缩放、旋转等变形效果
        VStack {
            HStack {
                
                Image("test")
                    .resizable().aspectRatio(contentMode: .fit)
                    .scaleEffect(0.8)
                
                Image("test")
                    .resizable().aspectRatio(contentMode: .fit)
                    .scaleEffect(CGSize(width: 1.2, height: 1))
                
                Image("test")
                    .resizable().aspectRatio(contentMode: .fit)
                    .scaleEffect(x: 1.5, y: 1, anchor: UnitPoint.bottomLeading)
            }
            
            HStack {
                Image("test")
                    .resizable().aspectRatio(contentMode: .fit)
                    .rotationEffect(Angle.init(degrees: 90))
                
                Image("test")
                    .resizable().aspectRatio(contentMode: .fit)
                    .rotationEffect(Angle.init(degrees: 30), anchor: UnitPoint.init(x: 0, y: 0))
                
                Image("test")
                    .resizable().aspectRatio(contentMode: .fit)
                    .rotation3DEffect(Angle.init(degrees: 30), axis: (x: CGFloat(0.1), y: CGFloat(0.1), z: CGFloat(0)))
            }
        }
        
        // 异步加载网络图片
        Image(uiImage: self.remoteImage ?? placeholderOne!).onAppear(perform: fetchRemoteImage)
    }
    
    func fetchRemoteImage() {
        guard let url = URL(string: "http://hdjc8.com/images/logo.png") else {
            return
        }
        
        URLSession.shared.dataTask(with: url) {
            
            (data, response, error) in
            
            if let image = UIImage(data: data!) {
                self.remoteImage = image
            }
            else{
                print(error ?? "")
            }
            
        }.resume()
    }
}

#if DEBUG
struct BasicImage_Previews: PreviewProvider {
    static var previews: some View {
        BasicImage()
    }
}
#endif
