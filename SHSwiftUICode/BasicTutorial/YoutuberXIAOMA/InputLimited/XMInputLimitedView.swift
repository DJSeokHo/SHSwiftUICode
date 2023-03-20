//
//  XMInputLimitedView.swift
//  SHSwiftUICode
//
//  Created by mac on 2023/03/15.
//

import SwiftUI

private class ContentViewModel: ObservableObject {
    
    @Published
    var text: String = "" {
        
        didSet {
            
            // maximum length is 8
            if text.trimmingCharacters(in: .whitespaces).count > 8 {
                self.text = oldValue
            }
        }
    }
    
    @Published
    var message: String = "message"
}

private struct ContentView: View {
    
    @ObservedObject
    private var viewModel: ContentViewModel = ContentViewModel()
    
    var body: some View {
        
        VStack(alignment: .center, spacing: 10) {
            
            Text("input limited")
                .font(.title)
            
            TextField("input", text: self.$viewModel.text)
                .padding(.horizontal, 10)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .disableAutocorrection(true)
            
            Button(action: {
                
                let tempText = self.viewModel.text.trimmingCharacters(in: .whitespaces)
                
                if tempText.isEmpty {
                    self.viewModel.message = "empty!!"
                }
                else {
                    self.viewModel.message = "good"
                }
                
            }, label: {
                Text("Confirm")
                    .padding()
                    .background(Color.blue)
                    .foregroundColor(Color.white)
                    .cornerRadius(10)
            })
            
            Spacer()
            
            Text(self.viewModel.message)
                .frame(width: UIScreen.main.bounds.width - 20, height: 60, alignment: .leading)
                .padding(.horizontal, 10)
                .background(.gray)
                .foregroundColor(Color.white)
            
        }
        .padding(0)
    }
}

struct XMInputLimitedView: View {
    var body: some View {
        ContentView()
    }
}

struct XMInputLimitedView_Previews: PreviewProvider {
    static var previews: some View {
        XMInputLimitedView()
    }
}
