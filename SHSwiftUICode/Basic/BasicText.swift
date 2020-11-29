//
//  BasicText.swift
//  SHSwiftUICode
//
//  Created by Seok Ho on 2020/11/28.
//

import SwiftUI

struct BasicText: View {
    
    let now = Date()
    let dateFormatter: DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateStyle = .long
        return formatter
    }()
    
    var body: some View {
        
        VStack {
            
            Text("test")
            
            Text("test").bold()
            
            Text("test").italic()
            
            Text("test").underline()
            
            Text("test").underline(true, color: Color.orange)
            
            Text("test").strikethrough()
            
            Text("test").strikethrough(true, color: Color.orange)
            
            Text("test").foregroundColor(/*@START_MENU_TOKEN@*/.blue/*@END_MENU_TOKEN@*/)
            
            Text("test").background(Color.orange)
            
            Text("test").baselineOffset(CGFloat(5.0)).background(Color.orange)
            
        }
        
        VStack {
            
            Text("test").background(Image("test"), alignment: .bottom)
            
            Text("test").font(.footnote)
            
            Text("test").font(.system(size:36))
            
            Text("test").font(.system(.title, design: .monospaced))

            Text("test").font(.custom("BradleyHandITCTT-Bold", size: 36))

            Text("test").fontWeight(Font.Weight.heavy)

            Text("test").fontWeight(Font.Weight.ultraLight)
        }
        
        VStack{

            Text("www.swein.com").tracking(10)

            Text("www.swein.com").kerning(10)

            Text("www.swein.com").blur(radius: 1)

            Text("SwiftUI is an innovative, exceptionally simple way to build user interfaces across all Apple platforms with the power of Swift.").lineLimit(1)
           
            Text("SwiftUI is an innovative, exceptionally simple way to build user interfaces across all Apple platforms with the power of Swift.").lineSpacing(5).lineLimit(nil)

            Text("www.swein.com").offset(x: 40, y: 0)

            Text("www.swein.com").frame(width: 200, height: 80, alignment: .bottomTrailing).background(Color.orange)

            VStack{
                Text("www.swein.com")
                    .position(x: 50, y: 50)
                    .frame(width: 300, height: 100, alignment: .bottomTrailing)
                    .background(Color.orange)

                Text("Interactive\ntutorials\nfor\nXcode!")
                    .multilineTextAlignment(.center)
                    .lineLimit(4)

                Text("Hello\nInteractive Tutorials!").multilineTextAlignment(.leading)
            }

        }
        
        VStack{
            // 先背景色 再padding
            Text("www.swein.com")
            .background(Color.black)
            .foregroundColor(.white)
            .padding(20)

            // 先padding 再背景色
            Text("www.swein.com")
            .padding()
            .background(Color.black)
            .foregroundColor(.white)

            Text("Swift User Interface")
            .font(.largeTitle)
            .foregroundColor(.black)
            .padding(15)
            .background(Color.yellow)
            .padding(15)
            .background(Color.orange)
            .padding(10)
            .background(Color.red)
        }
        
        // 通过edgesIgnoringSafeArea，忽略安全区域，使文本框撑满屏幕
        Text("Hello World")
            .frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: .infinity)
            .background(Color.orange)
            .font(.largeTitle)
            .edgesIgnoringSafeArea(.all)
        
        Text("The time is: \(now, formatter: self.dateFormatter)")
            .font(.title)
            .padding()
        
        // 添加扩展方法+，对文本View进行拼接，实现富文本的艺术效果。
        Text("Interactive ").foregroundColor(.yellow).fontWeight(.heavy)
        + Text("tutorials ").foregroundColor(.orange).strikethrough()
        + Text("for ").foregroundColor(.red).italic()
        + Text("SwiftUI").foregroundColor(.purple).underline()
        
        
        VStack{
            Text("SwifUI Gradient")
            .font(.system(size: 36))
            .padding()
            .foregroundColor(.white)
            .background(AngularGradient(gradient: Gradient(colors: [.orange, .red, .purple]), center: UnitPoint(x: 0.5, y: 0.5), angle: Angle.init(degrees: -45)))

            Text("SwifUI Gradient")
            .font(.system(size: 36))
            .padding()
            .foregroundColor(.white)
            .background(AngularGradient(gradient: Gradient(colors: [.orange, .red, .purple]), center: UnitPoint(x: 0.5, y: 0.5), startAngle: Angle.init(degrees: 0), endAngle: Angle.init(degrees: 0)))

            Text("SwifUI Gradient")
                .font(.system(size: 36))
                .padding()
                .foregroundColor(.white)
                .background(LinearGradient(gradient: Gradient(colors: [.orange, .red, .purple]), startPoint: .topLeading, endPoint: .bottomTrailing))
            
            Text("SwifUI Gradient")
                .font(.system(size: 36))
                .padding()
                .foregroundColor(.white)
                .background(RadialGradient(gradient: Gradient(colors: [.orange, .red, .purple]), center: .init(x: 0.5, y: 0.5), startRadius: CGFloat(10), endRadius: CGFloat(120)))

        }
        
        
    }
}

struct BasicText_Previews: PreviewProvider {
    static var previews: some View {
        BasicText()
    }
}
