//
//  BasicSlider.swift
//  SHSwiftUICode
//
//  Created by Seok Ho on 2020/11/29.
//

import SwiftUI

struct BasicSlider: View {
    
    @State
    private var temperature: Double = 0
    
    var body: some View {
        VStack {
            Slider(value: $temperature)
            Slider(value: $temperature, in: -20...40)
            Slider(value: $temperature, in: -20...40) {
                item in
                print(item)
            }
            
            HStack {
                Image(systemName: "sun.max")
                
                Slider(value: $temperature, in: -20...40, step: 2) {
                    (item) in
                    print("\(item) \(temperature)")
                }.accentColor(.pink).colorInvert()
                
                Image(systemName: "sun.max.fill")
            }
            .padding()
            
            Text("The temperature is \(Int(temperature)).")
        }
        .onAppear(perform: {
            
        })
        .onDisappear(perform: {
            
        })
    }
}

struct BasicSlider_Previews: PreviewProvider {
    static var previews: some View {
        BasicSlider()
    }
}
