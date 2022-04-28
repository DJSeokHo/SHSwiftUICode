//
//  FullScreenModalView.swift
//  SHSwiftUICode
//
//  Created by Seok Ho on 2022/04/28.
//

import Foundation
import SwiftUI

private struct SecondView: View {
    @Environment(\.presentationMode)
    var presentationMode

    var body: some View {
        ZStack {
            Color.primary.edgesIgnoringSafeArea(.all)
            Button("Dismiss Modal") {
                presentationMode.wrappedValue.dismiss()
            }
        }
    }
}

private struct FirstView: View {
    @State
    private var isPresented = false

    var body: some View {
        Button("Present!") {
            isPresented.toggle()
        }
        .fullScreenCover(isPresented: $isPresented, content: SecondView.init)
    }
}

struct FullScreenModalView: View {
    
    var body: some View {
        
        FirstView()
    }
}
