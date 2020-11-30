//
//  LayoutShowAlert.swift
//  SHSwiftUICode
//
//  Created by Seok Ho on 2020/11/30.
//

import SwiftUI

struct LayoutShowAlert: View {
    
    @State var isAlert = false
    
    let primaryButton = Alert.Button.default(Text("Yes"), action: {
        print("Yes, I'm a student.")
    })

    let secondaryButton = Alert.Button.destructive(Text("No"), action: {
        print("No, I'm not a student.")
    })
    
    var alert: Alert {
        Alert(title: Text("Question"),
              message: Text("Are you a student?"),
              primaryButton: primaryButton,
              secondaryButton: secondaryButton)
    }
    
    var body: some View {
        
        Button("Alert Sheet") {
            self.isAlert = true
        }.alert(isPresented: $isAlert, content: {
            alert
        })
    }
}

struct LayoutShowAlert_Previews: PreviewProvider {
    static var previews: some View {
        LayoutShowAlert()
    }
}
