//
//  ObservableAndBindable.swift
//  SHSwiftUICode
//
//  Created by SeokHo on 2/26/24.
//

import SwiftUI

struct ObservableAndBindable: View {
    
    @Bindable
    var user: User = .init()
    
    var body: some View {
        
        VStack {
            TextField("name", text: $user.name)
        }
        .onChange(of: user.name, { oldValue, newValue in
            ILog.debug(tag: #file, content: "\(oldValue) \(newValue)")
        })
    }
}

@Observable // only can used on class
class User {
    var name: String = ""
    var email: String = ""
}

#Preview {
    ObservableAndBindable()
}
