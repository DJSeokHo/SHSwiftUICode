//
//  LayoutShowModal.swift
//  SHSwiftUICode
//
//  Created by Seok Ho on 2020/11/30.
//

import SwiftUI

struct LayoutShowModal: View {
    
    @State var isPresented = false
    
    var body: some View {
        
        Button("Show Modal View") {
            self.isPresented = true
        }.sheet(isPresented: $isPresented, content: {
            ModalView()
        })
    }
}

struct ModalView: View {
    
    var body: some View {
        Text("The Modal View")
            .font(.system(size: 48))
            .bold()
    }
}


struct LayoutShowModal_Previews: PreviewProvider {
    static var previews: some View {
        LayoutShowModal()
    }
}
