//
//  LayoutForm.swift
//  SHSwiftUICode
//
//  Created by Seok Ho on 2020/11/29.
//

import SwiftUI

struct LayoutForm: View {
    
    private var languages = ["Swift", "Objective-C"]
    @State private var selectedLanguage = 0
    @State var workingYear: Double = 2
    @State var enableNotification = false
    
    @State var enableForm = false
    @State var userName = ""
    @State var password = ""
    
    @State var showingVisible = false
    
    var body: some View {
        
        // form
        NavigationView {
            Form {
                Picker(selection: $selectedLanguage, label: Text("Languages")) {
                   ForEach(0 ..< languages.count) {
                    Text(self.languages[$0]).tag($0)
                   }
                }.pickerStyle(SegmentedPickerStyle())
                
                HStack{
                    Text("Working years")
                    Slider(value: $workingYear, in: 1...10, step: 1)
                }
                
                Toggle(isOn: $enableNotification) {
                    Text("Enable Notification")
                }
                
                Button(action: {
                    print("Your programming language: \(self.languages[self.selectedLanguage])")
                    print("Your working years: \(Int(self.workingYear))")
                    print("Enable notification: \(self.enableNotification)")
                }) {
                    Text("Submit")
                }
            }
            .navigationBarTitle(Text("Profiles"))
        }
        
        // form and section
        NavigationView {
            Form {
                Section(header: Text("Please enter your information:"), footer: Text("Note: Enabling notification to get more infomration")) {
                    Picker(selection: $selectedLanguage, label: Text("Languages")) {
                       ForEach(0 ..< languages.count) {
                        Text(self.languages[$0]).tag($0)
                       }
                    }.pickerStyle(SegmentedPickerStyle())
                    
                    HStack{
                        Text("Working years")
                        Slider(value: $workingYear, in: 1...10, step: 1)
                    }
                    
                    Toggle(isOn: $enableNotification) {
                        Text("Enable Notification")
                    }
                }
                Button(action: {
                // activate theme!
                    print("Your programming language: \(self.languages[self.selectedLanguage])")
                    print("Your working years: \(Int(self.workingYear))")
                    print("Enable notification: \(self.enableNotification)")
                }) {
                    Text("Submit")
                }
            }.navigationBarTitle(Text("Profiles"))
        }
        
        // Enable Disable
        NavigationView {
            Form {
                Toggle(isOn: $enableForm) {
                    Text("Enable Form")
                }
                
                Section(header: Text("Please enter your information:")) {
                    
                    TextField("Username", text: $userName)
                    SecureField("Password", text: $password)
                    Toggle(isOn: $enableNotification) {
                        Text("Enable Notification")
                    }
                }.disabled(!enableForm)
                
            }.navigationBarTitle(Text("Profiles"))
        }
        
        NavigationView {
            Form {
                Toggle(isOn: $showingVisible.animation()) {
                    if(showingVisible){
                        Text("Hide Form")
                    }
                    else{
                        Text("Show Form")
                    }
                }
                
                if(showingVisible)
                {
                    Section(header: Text("Please enter your information:")) {
                        
                        TextField("Username", text: $userName)
                        SecureField("Password", text: $password)
                    }
                }
            }.navigationBarTitle(Text("Profiles"))
        }
    }
}

struct LayoutForm_Previews: PreviewProvider {
    static var previews: some View {
        LayoutForm()
    }
}
