//
//  EnvironmentExample.swift
//  SHSwiftUICode
//
//  Created by Seok Ho on 2022/01/29.
//

import SwiftUI

/**
 我们的确开一个从 Environment 拿到用户自定义的 object，
 但是 SwiftUI 本身就有很多系统级别的设定，我们开一个通过 @Environment 来获取到它们
 */
struct EnvironmentExample: View {
    
    /**
     通过 @Environment 修饰的属性，我们开一个监听系统级别信息的变换，
     这个例子里一旦 Calendar, Locale, ColorScheme 发生了变换，
     我们定义的 CalendarView 就会刷新
     */
    @Environment(\.calendar)
    var calendar: Calendar
    
    @Environment(\.locale)
    var locale: Locale
    
    @Environment(\.colorScheme)
    var colorScheme: ColorScheme
    
    var body: some View {
        VStack {
            Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
            Text(colorScheme == .dark ? "dark" : "light")
        }
    }
}

struct EnvironmentExample_Previews: PreviewProvider {
    static var previews: some View {
        EnvironmentExample()
    }
}
