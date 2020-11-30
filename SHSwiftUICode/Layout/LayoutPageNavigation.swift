//
//  LayoutPageNavigation.swift
//  SHSwiftUICode
//
//  Created by Seok Ho on 2020/11/30.
//

import SwiftUI

struct InfoModel : Hashable {
    var description : String
    var pictureName : String
}

struct LayoutPageNavigation: View {
    
    var messages : [InfoModel]
    
    var body: some View {
        NavigationView{
            List{
                ForEach(messages, id: \.self) { message in
                    NavigationLink(destination: LayoutPageNavigationDetailView(imageName: message.pictureName)) {
                        Text(message.description)
                    }
                    Text(message.description)
                }
            }.navigationBarTitle("Picture List")
        }
    }
}

struct LayoutPageNavigationDetailView : View {
    var imageName : String
    var body: some View{
        Image(imageName)
    }
}

struct LayoutPageNavigation_Previews: PreviewProvider {
    static var previews: some View {
        let model1 = InfoModel(description: "A lady with a horse", pictureName: "test")
        let model2 = InfoModel(description: "An African animal with a very long neck", pictureName: "test")
        LayoutPageNavigation(messages: [model1, model2])
    }
}
