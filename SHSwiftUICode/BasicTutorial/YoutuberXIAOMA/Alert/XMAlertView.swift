//
//  XMAlertView.swift
//  SHSwiftUICode
//
//  Created by mac on 2023/03/20.
//

import SwiftUI

struct XMAlertView: View {
    var body: some View {
        ContentView()
    }
}

private struct ContentView: View {
    
    @State
    private var showAlert: Bool = false
    
    var body: some View {
        
        Button(action: {
            
            self.showAlert = true
            
        }, label: {
            
            Text("show alert")
                .font(.title)
            
        })
        .alert(isPresented: self.$showAlert, content: {
           
            Alert(title: Text("Alert"), message: Text("No......."), dismissButton: .cancel(Text("Close")))
        })
        
    }
}

struct XMAlertView_Previews: PreviewProvider {
    static var previews: some View {
        XMAlertView()
    }
}
