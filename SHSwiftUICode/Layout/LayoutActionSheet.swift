//
//  LayoutActionSheet.swift
//  SHSwiftUICode
//
//  Created by Seok Ho on 2020/11/30.
//

import SwiftUI

struct LayoutActionSheet: View {
    
    @State var isPresented = false
    @State private var backgroundColor = Color.white
    
    var actionSheet: ActionSheet {
        ActionSheet(title: Text("Information"),
            message: Text("What's your favorite?"),
            buttons: [
                .default(Text("Fishing")) {
                    print("---I like fishing")
                },
                .destructive(Text("Hunting")) {
                    print("---I like hunting")
                },
                .cancel({
                    print("---Nothing")
                })
            ]
        )
    }
    
    var body: some View {
       
        ZStack {
            backgroundColor
            Button("Show action sheet") {
                self.isPresented = true
            }
            .actionSheet(isPresented: $isPresented) {
                ActionSheet(title: Text("Change background"), message: Text("Select a new color"), buttons: [
                    .default(Text("Red")) { self.backgroundColor = .red },
                    .default(Text("Green")) { self.backgroundColor = .green },
                    .default(Text("Orange")) { self.backgroundColor = .orange },
                    .cancel() {
                        print("---cancel")
                    }
                    
                ])
            }
            
//            Button("Show action sheet") {
//                self.isPresented = true
//            }
//            .actionSheet(isPresented: $isPresented) {
//                actionSheet
//            }
        }
        .edgesIgnoringSafeArea(.all)
        
    }
}

struct LayoutActionSheet_Previews: PreviewProvider {
    static var previews: some View {
        LayoutActionSheet()
    }
}
