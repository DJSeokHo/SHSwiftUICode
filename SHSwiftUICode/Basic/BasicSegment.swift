//
//  BasicSegment.swift
//  SHSwiftUICode
//
//  Created by Seok Ho on 2020/11/29.
//

import SwiftUI

struct BasicSegment: View {
    
    private var animals = ["🐶 Dog", "🐯 Tiger", "🐷 Pig"]
    private var colors = [Color.yellow, Color.orange, Color.red, Color.purple]
    
    @State
    private var selectedAnimal = 0
    
    var body: some View {
        
        VStack {
            
            Picker(selection: $selectedAnimal, label: Text("animals"), content: {
                ForEach(0..<animals.count) {
                    index in
                    Text(self.animals[index]).tag(index)
                }
            }).pickerStyle(SegmentedPickerStyle())
            
            Text("Your choice: \(animals[selectedAnimal])")
            
        }
        .onAppear(perform: {
            
        })
        .onDisappear(perform: {
            
        })
        .padding()
    }
}

struct BasicSegment_Previews: PreviewProvider {
    static var previews: some View {
        BasicSegment()
    }
}
