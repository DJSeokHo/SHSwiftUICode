//
//  ToggleExample.swift
//  SHSwiftUICode
//
//  Created by 浩 SHI on 2022/01/20.
//

import SwiftUI

struct ToggleExample: View {
    
    @State
    private var isToggleOn = false
    
    var body: some View {
        
        VStack {
            
            Toggle("", isOn: $isToggleOn).labelsHidden()
            
            Text("Toggle \(isToggleOn ? "On" : "Off")").foregroundColor(isToggleOn ? Color.green : Color.red)
        }
        
        
    }
}

struct ToggleExample_Previews: PreviewProvider {
    static var previews: some View {
        ToggleExample()
    }
}
