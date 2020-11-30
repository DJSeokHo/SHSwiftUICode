//
//  PropertyEnvironmentObjectDemo.swift
//  SHSwiftUICode
//
//  Created by Seok Ho on 2020/11/30.
//

import SwiftUI

/*
 EnvironmentObject
 从名字上可以看出，这个修饰器是针对全局环境的。通过它，我们可以避免在初始 View 时创建 ObservableObject, 而是从环境中获取 ObservableObject
 */
struct PropertyEnvironmentObjectDemo: View {
    
    // UserSettings 在SceneDelegate里进行初始化
    @EnvironmentObject var settings: UserSettings
    
    var body: some View {
        NavigationView {
            VStack {
                // A button that writes to the environment settings
                Button(action: {
                    self.settings.score += 1
                }) {
                    Text("Increase Score")
                }

                NavigationLink(destination: DetailView()) {
                    Text("Show Detail View")
                }
                
                Text("\(settings.score)")
            }
        }
    }
}

struct DetailView: View {
    @EnvironmentObject var settings: UserSettings

    var body: some View {
        // A text view that reads from the environment settings
        Text("Score: \(settings.score)")
    }
}

struct PropertyEnvironmentObjectDemo_Previews: PreviewProvider {
    static var previews: some View {
        PropertyEnvironmentObjectDemo()
    }
}
