//
//  EnviromentObject.swift
//  SHSwiftUICode
//
//  Created by Seok Ho on 2020/12/01.
//

import SwiftUI

class UserModelOne: ObservableObject {
    @Published var nickName: String = ""
}

struct EnviromentObject: View {
    
    @EnvironmentObject var model : UserModelOne
    @State var isPresented = false
    
    var body: some View {
        NavigationView {

            VStack{
                TextField("Your nickname", text: $model.nickName)
                .padding()
                
                NavigationLink(destination: DetailView()) {
                    Text("Show Detail")
                }
            }
        }
    }
}

struct EnviromentObject_Previews: PreviewProvider {
    static var previews: some View {
        
        let model = UserModelOne()
        model.nickName = "Super man"
        return EnviromentObject().environmentObject(model)
    }
}

