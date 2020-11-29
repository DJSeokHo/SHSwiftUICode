//
//  BasicStepper.swift
//  SHSwiftUICode
//
//  Created by Seok Ho on 2020/11/29.
//

import SwiftUI

struct BasicStepper: View {
    
    @State
    private var temperature: Double = 0
    
    var body: some View {
        
        VStack {
            
            Stepper(onIncrement: {
                self.temperature += 1
            }, onDecrement: {
                self.temperature -= 1
            }, label: {
                Text("Temperature: \(Int(temperature))")
            })
            
            Stepper(onIncrement: {
                self.temperature += 1
            }, onDecrement: {
                self.temperature -= 1
            }, onEditingChanged: { (item) in
                print(item)
            }, label: {
                Text("Temperature: \(Int(temperature))")
            })
        }
        .onAppear(perform: {
            
        })
        .onDisappear(perform: {
            
        })
        .padding()
    }
}

struct BasicStepper_Previews: PreviewProvider {
    static var previews: some View {
        BasicStepper()
    }
}
