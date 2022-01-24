//
//  DatePickerExample.swift
//  SHSwiftUICode
//
//  Created by 浩 SHI on 2022/01/21.
//

import SwiftUI

struct DatePickerExample: View {
    var body: some View {
       
        VStack {
            // DatePicker 的使用非常简单，
            // 类似 ColorPicker，只需要绑定上 Date 变量即可
            // 在使用时点击右侧的时间（日期），即可进行选择
            DatePicker(
                "start date",
                selection: $date,
                displayedComponents: [.date]
            )
            // 可以通过 displayedComponents 控制时间的精细程度
            // 可选的值为 DatePickerComponents.hourAndMinute 和
            // DatePickerComponents.date
            
            Spacer().frame(height: 20)
            
            DatePicker(
                "end date",
                selection: $date,
                displayedComponents: [.hourAndMinute, .date]
            )
            
            Spacer().frame(height: 20)
            
            DatePicker(
                "date range",
                 selection: $dateWithRange,
                 in: dateRange,
                 displayedComponents: [.date]
            )
            
            Spacer().frame(height: 20)
            
            DatePicker(
                "date picker style",
                selection: $date,
                displayedComponents: [.date, .hourAndMinute]
            )
            // 类似 Button 的 .buttonStyle，我们可以转换日期显示的样式
            // 除去这里使用的 GraphicalDatePickerStyle，
            // SwiftUI 还给我们提供了好几种有趣的方案，快去试试吧~
//            .datePickerStyle(GraphicalDatePickerStyle())
            .datePickerStyle(WheelDatePickerStyle())
            
        }
    }
    
    @State
    private var date = Date()
    @State
    private var dateWithRange = Date()
    let dateRange: ClosedRange<Date> = {
        let calendar = Calendar.current
        let startComponents = DateComponents(year: 2022, month: 1, day: 1)
        let endComponents = DateComponents(year: 2022, month: 12, day: 31)
        return calendar.date(from:startComponents)!...calendar.date(from:endComponents)!
    }()
}

struct DatePickerExample_Previews: PreviewProvider {
    static var previews: some View {
        DatePickerExample()
    }
}
