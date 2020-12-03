//
//  HttpAndJSONDemo.swift
//  SHSwiftUICode
//
//  Created by Seok Ho on 2020/12/02.
//

import SwiftUI

struct HttpAndJSONDemo: View {
    
    @ObservedObject
    private var httpAndJSONVM = HttpAndJSONVM()
    
    var body: some View {
        
        ZStack {
            VStack {
                Button(action: {
                    httpAndJSONVM.request()
                }, label: {
                    Text("Request")
                })
                
                Text(httpAndJSONVM.httpAndJSONModel.name ?? "").padding()
                Text(httpAndJSONVM.httpAndJSONModel.nickname ?? "").padding()
            }
            
            if(httpAndJSONVM.showProgress) {
                CustomProgressView(style: UIActivityIndicatorView.Style.medium)
            }
        }
    }
}

struct HttpAndJSONDemo_Previews: PreviewProvider {
    static var previews: some View {
        HttpAndJSONDemo()
    }
}
