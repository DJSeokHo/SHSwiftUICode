//
//  BasicToggle.swift
//  SHSwiftUICode
//
//  Created by Seok Ho on 2020/11/29.
//

import SwiftUI

struct BasicToggle: View {
    
    @State
    private var showNotification = true
    
    var body: some View {
        VStack {
            Text("Show Notification: ") + Text("\(self.showNotification.description)")
                .foregroundColor(.green).bold()
            
            Toggle(isOn: $showNotification, label: {
                Text("Show notification:")
            }).padding()
        }
    }
}

struct BasicToggle_Previews: PreviewProvider {
    static var previews: some View {
        BasicToggle()
    }
}
