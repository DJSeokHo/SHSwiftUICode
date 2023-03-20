//
//  XMActionSheetView.swift
//  SHSwiftUICode
//
//  Created by mac on 2023/03/20.
//

import SwiftUI

struct XMActionSheetView: View {
    var body: some View {
        
        ContentView()
        
    }
}

private struct ContentView: View {
    
    @State
    private var showActionSheet: Bool = false
    
    @State
    private var message: String = ""
    
    var body: some View {
        
        VStack(alignment: .center, spacing: 20) {
            
            Text("Action Sheet")
                .font(.title)
            
            Text(self.message)
                .font(.body)
                .foregroundColor(Color.red)
                .frame(maxWidth: .infinity)
                .padding()
                .border(Color.gray, width: 1)
            
            Button(action: {
                
                self.showActionSheet = true
                
            }, label: {
                
                Text("show action sheet")
                    .font(.title)
                
            })
        }
        .actionSheet(isPresented: self.$showActionSheet, content: {
            
            ActionSheet(title: Text("Title"), message: Text("Message~~"), buttons: [
                
                .default(Text("Option 1"), action: {
                    self.message = "Option 1"
                }),
                
                .default(Text("Option 2"), action: {
                    self.message = "Option 2"
                }),
                
                .default(Text("Option 3"), action: {
                    self.message = "Option 3"
                }),
                    
                .cancel(Text("Cancel"), action: {
                    self.message = "Cancel"
                }),
            ])
            
        })
        
    }
}

struct XMActionSheetView_Previews: PreviewProvider {
    static var previews: some View {
        XMActionSheetView()
    }
}
