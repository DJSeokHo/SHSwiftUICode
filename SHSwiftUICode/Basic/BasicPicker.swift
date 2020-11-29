//
//  BasicPicker.swift
//  SHSwiftUICode
//
//  Created by Seok Ho on 2020/11/28.
//

import SwiftUI

struct BasicPicker: View {
    
    private var fruits = ["Apple", "Banner", "Pear", "Watermelon"]
    private var colors = [Color.blue, Color.orange, Color.red, Color.purple]
    
    @State
    private var selectedItem = 0
    
    
    private var dateFormatter: DateFormatter {
        let formatter = DateFormatter()
        formatter.dateStyle = .long
        return formatter
    }
    @State
    private var selectedDate = Date()
    
    var body: some View {
        
        VStack {
            
            Picker(selection: $selectedItem, label: Text("Fruits"), content: {
                
                // SwiftUI 提供 ForEach 型別幫我們將集合裡的東西生成一個個 view，然後再合併成一個 view
                ForEach(0..<fruits.count) {
                    index in
                    Text(self.fruits[index]).tag(index).foregroundColor(self.colors[index])
                }
            })
            
            // 靠Text的组合可以实现一行文字出现不同的文字效果
            Text("Your choice: ") + Text("\(fruits[selectedItem])").foregroundColor(self.colors[selectedItem])
        }
        .onAppear(perform: {
            print("onAppear")
        })
        .onDisappear(perform: {
            print("onDisappear")
        })
        
        
        VStack {
            DatePicker(selection: $selectedDate, displayedComponents: DatePickerComponents.hourAndMinute, label: {
                Text("Date")
            })
            
            DatePicker(selection: $selectedDate, displayedComponents: DatePickerComponents.date, label: {
                Text("Date")
            })
            
            DatePicker(selection: $selectedDate,in: Date()...Date().advanced(by: 7 * 24 * 3600), displayedComponents: [.date, .hourAndMinute]) {
                Text("Date")
            }
            
            Text("Your Choice: \(selectedDate, formatter: dateFormatter)")
        }
        .onAppear(perform: {
            print("onAppear")
        })
        .onDisappear(perform: {
            print("onDisappear")
        })
    }
}

struct BasicPicker_Previews: PreviewProvider {
    static var previews: some View {
        BasicPicker()
    }
}
