//
//  LayoutScroll.swift
//  SHSwiftUICode
//
//  Created by Seok Ho on 2020/11/29.
//

import SwiftUI

struct LayoutScroll: View {
    
    @State var languages = ["Objective-C", "Swift", "Flutter"]
    
    var body: some View {
        
        // Vertical
        ScrollView(/*@START_MENU_TOKEN@*/.vertical/*@END_MENU_TOKEN@*/, showsIndicators: true, content: {
            
            VStack(alignment: HorizontalAlignment.leading, spacing: 20, content: {
                
                Text("Overview")
                    .font(.system(size: 48))
                    .padding(10)
                Text("With the power of Xcode, the ease of Swift, and the revolutionary features of cutting-edge Apple technologies, you have the freedom to create your most innovative apps ever.\nSwiftUI provides views, controls, and layout structures for declaring your app's user interface. The framework provides event handlers for delivering taps, gestures, and other types of input to your app, and tools to manage the flow of data from your app's models down to the views and controls that users will see and interact with.")
                    .lineLimit(nil)
                    .frame(width: 300, height: 240, alignment: .topLeading)
                    .padding(10)
                    
                Image("test")
                    .resizable()
                    .frame(width: 300, height: 556, alignment: .center)
                
            })
        })
        .background(Color.orange)
        .navigationBarTitle(Text("ScrollView"))
        .edgesIgnoringSafeArea(.all)
        
        // Horizontal
        ScrollView(.horizontal, showsIndicators: true) {
            HStack(alignment:.center, spacing: 20) {

                Image("test")
                    .resizable()
                    .frame(width: 300, height: 556, alignment: .center)

                Image("test")
                    .resizable()
                    .frame(width: 823, height: 556, alignment: .center)

                Image("test")
                    .resizable()
                    .frame(width: 300, height: 556, alignment: .center)
            }
        }
        .background(Color.orange)
        .padding(10)
        
        // Vertical And Horizontal
        ScrollView(.vertical, showsIndicators: false) {
            VStack(alignment: HorizontalAlignment.leading, spacing: 20){

                Text("Overview")
                .font(.system(size: 48))
                .padding(10)
                Text("With the power of Xcode, the ease of Swift, and the revolutionary features of cutting-edge Apple technologies, you have the freedom to create your most innovative apps ever.\nSwiftUI provides views, controls, and layout structures for declaring your app's user interface. The framework provides event handlers for delivering taps, gestures, and other types of input to your app, and tools to manage the flow of data from your app's models down to the views and controls that users will see and interact with.")
                .lineLimit(nil)
                .frame(width: 300, height: 350, alignment: .topLeading)
                .padding(10)
                
                ScrollView(.horizontal, showsIndicators: true) {
                    HStack(alignment:.center, spacing: 20){

                        Image("test")
                            .resizable()
                            .frame(width: 189, height: 350, alignment: .center)

                        Image("test")
                            .resizable()
                            .frame(width: 518, height: 350, alignment: .center)

                        Image("test")
                            .resizable()
                            .frame(width: 189, height: 350, alignment: .center)
                    }
                }
                .background(Color.orange)
                .padding(10)
            }
        }
        .padding(10)
        .background(Color.orange)
        .navigationBarTitle(Text("ScrollView"))
        .edgesIgnoringSafeArea(.all)
    }
}

struct LayoutScroll_Previews: PreviewProvider {
    static var previews: some View {
        LayoutScroll()
    }
}
