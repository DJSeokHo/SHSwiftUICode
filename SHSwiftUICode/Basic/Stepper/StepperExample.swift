//
//  StepperExample.swift
//  SHSwiftUICode
//
//  Created by 浩 SHI on 2022/01/20.
//

import SwiftUI

struct StepperExample: View {
    var body: some View {
        VStack {
            // Stepper 让用户可以对数量进行加减
            // 构造 Stepper 的时候需要绑定 onIncrement 和 onDecrement
            // Stepper 和 Slider 一样，恶友 onEditingChanged 参数，就不在此展示了
            
            Group {
                Stepper(onIncrement: {
                    stepperOneValue += 1
                }, onDecrement: {
                    stepperOneValue -= 1
                }, label: {
                    
                }).labelsHidden()
                Text("\(stepperOneValue)")
            }
           
            Spacer().frame(height: 50)
            
            Group {
                Stepper("Number", onIncrement: {
                    stepperTwoValue += 1
                }, onDecrement: {
                    stepperTwoValue -= 1
                }).padding(EdgeInsets(top: 0, leading: 60, bottom: 0, trailing: 60))
                Text("\(stepperTwoValue)")
            }
            
            Spacer().frame(height: 50)
            
            Group {
                Stepper("", value: $stepperThreeValue, in: 0...100, step: 5, onEditingChanged: { isEditing in
                    
                }).labelsHidden()
                Text("\(stepperThreeValue)")
            }
        }
    }
    
    @State
    private var stepperOneValue = 5
    
    @State
    private var stepperTwoValue = 20
    
    @State
    private var stepperThreeValue = 10
}

struct StepperExample_Previews: PreviewProvider {
    static var previews: some View {
        StepperExample()
    }
}
