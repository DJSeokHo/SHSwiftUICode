//
//  PropertyEnvironmentDemo.swift
//  SHSwiftUICode
//
//  Created by Seok Ho on 2020/11/30.
//

import SwiftUI

/*
 通过 @Environment 修饰的属性，我们开一个监听系统级别信息的变换，这个例子里一旦 Calendar, Locale, ColorScheme 发生了变换，我们定义的 CalendarView 就会刷新
 */
struct PropertyEnvironmentDemo: View {
    
    @Environment(\.calendar) var calendar: Calendar
    @Environment(\.locale) var locale: Locale
    @Environment(\.colorScheme) var colorScheme: ColorScheme

    var body: some View {
        
        Text(calendar.description)
        
        // 唯一表达式与省略return（当函数体中只存在一个表达式的时候会直接可以省略return)
//        Text(calendar.description)
//        return Text(calendar.description)
    }
}

struct PropertyEnvironmentDemo_Previews: PreviewProvider {
    static var previews: some View {
        PropertyEnvironmentDemo()
    }
}
