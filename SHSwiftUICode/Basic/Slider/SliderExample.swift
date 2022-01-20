//
//  SliderExample.swift
//  SHSwiftUICode
//
//  Created by 浩 SHI on 2022/01/20.
//

import SwiftUI

struct SliderExample: View {
    
    var body: some View {
        
        VStack {
            
            // Slider 用于让用户在一个连续的范围中取值。
            // 构造 Slider 需要一个绑定的值和一个范围（需要是 CloseRange，
            // 也就是"..."）
            //
            // 注意，Slider 的构造函数其实还支持传入一个 label 参数
            // 这个 label 参数在很多的样式中不会显示，但是 VoiceOver
            // 之类的功能会用这个 Label 来识别该 Slider
            
            Group {
                Slider(value: $sliderOneValue, in: 0...100)
                Text("\(sliderOneValue)")
            }
          
            Spacer().frame(height: 20)
            
            Group {
                Slider(value: $sliderTwoValue, in: 0...100, onEditingChanged: { editing in
                    isSliding = editing
                })
                Text("\(sliderTwoValue)").foregroundColor(isSliding ? .green : .red)
            }
           
            Spacer().frame(height: 20)
            
            Group {
                Slider(value: $sliderThreeValue, in: 30...80,
                       minimumValueLabel: Text("30"),
                       maximumValueLabel: Text("80"), label: { Text("") }
                )
                Text("Range 30 ~ 80")
            }
           
            Spacer().frame(height: 20)
            
            Group {
                Slider(value: $sliderFourValue, in: 0...100, step: 10)
                Text("\(sliderFourValue)")
            }
         
        }
        
    }
    
    @State
    private var isSliding = false
    
    @State
    private var sliderOneValue = 50.0
    @State
    private var sliderTwoValue = 30.0
    @State
    private var sliderThreeValue = 60.0
    @State
    private var sliderFourValue = 20.0
   
}

struct SliderExample_Previews: PreviewProvider {
    static var previews: some View {
        SliderExample()
    }
}
