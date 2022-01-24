//
//  PickerExample.swift
//  SHSwiftUICode
//
//  Created by 浩 SHI on 2022/01/21.
//

import SwiftUI

enum Development: String, CaseIterable, Identifiable {
    case android
    case iOS
    case python
    case none

    var id: String {
        self.rawValue
    }
    
    var value: String {
        switch self {
            case .android:
                return "Android"
            case .iOS:
                return "iOS"
            case .python:
                return "Python"
            case .none:
                return "I just want playing"
        }
    }
    
    var suggestedIED: IDE {
        switch self {
            case .android:
                return .androidIDE
            case .iOS:
                return .iOSIDE
            case .python:
                return .pythonIDE
            case .none:
                return .none
        }
    }
}

enum IDE: String, CaseIterable, Identifiable {
    case androidIDE
    case iOSIDE
    case pythonIDE
    case none

    var id: String {
        self.rawValue
    }
    
    var value: String {
        switch self {
            case .androidIDE:
                return "Android Studio"
            case .iOSIDE:
                return "XCode"
            case .pythonIDE:
                return "PyCharm"
            case .none:
                return "Out door"
        }
    }
}

struct PickerExample: View {
    var body: some View {
        VStack {
            // 在 Picker 中通过 Text 加 .tag 的方式添加选项，
            // 并在 selection 输入中绑定用户选择的结果。
            Picker("Development", selection: $selectedDevelopment) {
                Text("Android").tag(Development.android)
                Text("iOS").tag(Development.iOS)
                Text("Python").tag(Development.python)
                Text("No!!!").tag(Development.none)
            }
            Text("Your chioce is: \(selectedDevelopment.value)")
            Text("Suggest IDE is: \(selectedDevelopment.suggestedIED.value)")
            
            Spacer().frame(height: 30)
            
            
            VStack {
                Picker("Development", selection: $selectedDevelopmentNew) {
                    ForEach(Development.allCases) { development in
                        Text(development.value).tag(development)
                    }
                }
                Picker("IDE", selection: $selectedIDENew) {
                    ForEach(IDE.allCases) { ide in
                        Text(ide.value).tag(ide)
                    }
                }

                Text("Your chioce is: \(selectedDevelopmentNew.value)")
                Text("Suggest IDE is: \(selectedIDENew.value)")
            }
            // 可以通过 .pickerStyle 来改变 Picker 的样式
            .pickerStyle(SegmentedPickerStyle())
            
        }
    }
    
    @State
    private var selectedDevelopment = Development.none
    
    @State
    private var selectedDevelopmentNew = Development.none
    @State
    private var selectedIDENew = IDE.none
}

struct PickerExample_Previews: PreviewProvider {
    static var previews: some View {
        PickerExample()
    }
}
